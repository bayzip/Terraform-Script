## Create ECS with Server Load Balancer 
This example will create 2 instances in Zone A and Zone B, after that, it will attach 2 instances to SLB. The instance condition is no using public IP and SLB using public ip.

## Requirement
First, you net to set-up RAM for alicloud and get secret key and access key. After that, you can export it by using this command
```
export ALICLOUD_ACCESS_KEY="ALICLOUD_ACCESS_KEY"
export ALICLOUD_SECRET_KEY="ALICLOUD_SECRET_KEY"
export ALICLOUD_REGION="ALICLOUD_REGION"
```

## Basic Component
In this example, we create a component with the following details.

### VPC and Vswitch
| Name  | Value  |
| ------------ | ------------ |
| VPC CIDR | 10.0.0.0/21 |
| vswitch zone A CIDR | 10.0.1.0/24 |
| vswitch zone B CIDR | 10.0.2.0/24 |

### Security Group
| Name  | Value  |
| ------------ | ------------ |
| Inbound | Access tcp 22/22 |
| outbound | Access all traffic |

## Usage
```
terraform init
terraform plan
terraform apply
```
