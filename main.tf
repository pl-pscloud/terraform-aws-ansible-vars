
data  "template_file" "ansible-tpl" {
  template = file("../ansible/templates/vars.tpl")
  vars = {
    efs_mount_target = var.pscloud_efs_mount_target
    rds_endpoint = var.pscloud_rds_endpoint
    rds_dbuser = var.pscloud_rds_dbuser
    rds_dbpass = var.pscloud_rds_dbpass
  }
}

resource "local_file" "ansible-file-yml" {
  content  = data.template_file.ansible-tpl.rendered
  filename = "../ansible/files/vars.yml"
}



data  "template_file" "rds-codeigniter-database-tpl" {
  template = file("../ansible/templates/codeigniter-database.php")
  vars = {
    db-endpoint = var.pscloud_rds_endpoint
    dbuser = var.pscloud_rds_dbuser
    dbpass = var.pscloud_rds_dbpass
  }
}

resource "local_file" "codeigniter-database-file" {
  content = data.template_file.rds-codeigniter-database-tpl.rendered
  filename = "../ansible/files/codeigniter-database.php"
}