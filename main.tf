
//Rendering vars for ansible
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
  filename = "../ansible/group_vars/terraform_vars.yml"
}