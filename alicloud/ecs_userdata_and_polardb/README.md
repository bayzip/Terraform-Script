# Create ECS with PolarDB
In this session, you can create single ECS with user_data and polarDB

## Requirement
First, you net to set-up RAM for alicloud and get secret key and access key. After that, you can export it by using this command
```
export ALICLOUD_ACCESS_KEY="ALICLOUD_ACCESS_KEY"
export ALICLOUD_SECRET_KEY="ALICLOUD_SECRET_KEY"
export ALICLOUD_REGION="ALICLOUD_REGION"
```
After that, you need to create key_pair from ECS > Network & Security > SSH Key Pairs. This can be used to access instances with the private key. After creating the key, you can simply change key_name in main.tf.

## Usage
To use this example, you can simple use
```
terraform init
terraform plan
terraform apply
```

## Output
Setelah menjalankan ini, Anda akan mendapatkan output IP dari instance yang dibuat sebelumnya. Anda dapat menggunakan IP ini untuk masuk ke dalam instances.

| Name | type | descreption | 
| ------------ | ------------ | ------------ |
| IP Public | string | Public IP from instances |

### Accessing polarDB enpoint from instances.
After creating an instance, there is actually a continuing task it will install apache and mysql-client. You can define whatever you want to install from user_data.sh. In this case, after installing mysql-client, we can access using this command from instances

`mysql -h{polardb_endpoint} -h{db_username} -p`

## Component
For the components that we make, we will divide into 4 components

### Network
| Name | Value |
| ------------ | ------------ |
| VPC CIDR | 10.0.0.0/21 |
| Vswitch CIDR | 10.0.1.0/24 |

### Security Group
| Port | Type | Descreption |
| ------------ | ------------ | ------------ |
| 1-65535 |  Outbound | Allow all traffic outbound |
| 22  | Inbound | Allow default SSH access |
| 80 | Inbound | Allow HTTP access |

### Instances
| Name | Value |
| ------------ | ------------ |
| image_id | ubuntu_18_04_x64_20G_alibase_20200521.vhd |
| instance_type | ecs.t5-lc1m1.small |
| internet_charge_type | PayByBandwidth |
| instance_charge_type | PostPaid |

### PolarDB
| Name | Value |
| ------------ | ------------ |
| db_type | MySQL |
| db_version | 8.0 |
| pay_type | PostPaid |
| account_privilege | ReadWrite |
