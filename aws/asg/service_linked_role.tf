# A service linked role for autoscaling
resource "aws_iam_service_linked_role" "autoscaling" {
  aws_service_name = "autoscaling.amazonaws.com"
  custom_suffix    = "development"

  provisioner "local-exec" {
    command = "sleep 30"
  }
}