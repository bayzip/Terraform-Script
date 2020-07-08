## Create ECS with Server Load Balancer 
This example will create 2 instance in Zone A and Zone B, after that it will attached 2 instance to SLB

## Requirement
First, you net to set-up RAM for alicloud and get secret key and access key. After that, you can export it by using this command
```
export ALICLOUD_ACCESS_KEY="ALICLOUD_ACCESS_KEY"
export ALICLOUD_SECRET_KEY="ALICLOUD_SECRET_KEY"
export ALICLOUD_REGION="ALICLOUD_REGION"
```

## Usage
```
terraform init
terraform plan
terraform apply
```
