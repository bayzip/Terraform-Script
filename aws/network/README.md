# Terraform Module ECS
This is example to create network with single Nat Gateway that placed in the public subnet. 

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Default Configuration Network
You can find all variable in the `variable.tf`

|  Name | Description  |
| ------------ | ------------ |
| cidr  | 192.0.0.0/16 |
| avz  | "ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c" |
| private  | "192.0.1.0/24", "192.0.2.0/24", "192.0.3.0/24" |
| public  | "192.0.101.0/24", "192.0.102.0/24", "192.0.103.0/24" |

## How to use
First thing first, you need to create an account using the IAM. Then you will get the secret key access key. Then create a file with the name `terraform.tfvars` then fill it with
```
AWS_ACCESS_KEY = "YOUR_ACCESS_KEY"
AWS_SECRET_KEY = "YOUR_SECRET_KEY"
```

Or alternatif way, you can export this variable. 
