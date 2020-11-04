# Terraform Module ECS
This is example to ASG that placed in the private subnet. Firstly, you need to create network in the folder `network` Then you will get the VPC_ID as output. Safe this VPC and then put this on the `variable.tf`.

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## How to use
First thing first, you need to create an account using the IAM. Then you will get the secret key access key. Then create a file with the name `terraform.tfvars` then fill it with
```
AWS_ACCESS_KEY = "YOUR_ACCESS_KEY"
AWS_SECRET_KEY = "YOUR_SECRET_KEY"
```

Or alternatif way, you can export this variable. 
