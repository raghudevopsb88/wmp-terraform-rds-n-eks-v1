resource "null_resource" "kube-config" {

  triggers = {
    alltime = timestamp()
  }

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.env}"
  }

}
