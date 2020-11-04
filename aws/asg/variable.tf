variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  description = "AWS Region"
  type        = string
  default     = "ap-southeast-1"
}

variable "service" {
  description       = "variable for service"
  type              = object({
    environment     = string
    name            = string
  })
  default           = {
    environment     = "development"
    name            = "rnd"
  }
}

variable "lc_config" {
  description       = "variable for launch configuration"
  type              = object({
    instance_type     = string
    key               = string
  })
  default           = {
    instance_type     = "t2.medium"
    key               = "rnd-dev"
  }
}

variable "asg_config" {
  description       = "variable for auto scalling groups"
  type              = object({
    vpc_id            = string
    min               = string
    max               = string
    desired           = string
  })
  default           = {
    vpc_id            = "vpc-0957df4f4c048f354"
    min               = 2
    max               = 5
    desired           = 2
  }
}

variable "scaleup" {
  description       = "variable for auto scalling groups"
  type              = object({
    cooldown          = string
    policy            = string
    comparation       = string
    metrix            = string
    threshold         = string
  })
  default           = {
    cooldown          = "60"
    policy            = "SimpleScaling"
    comparation       = "GreaterThanOrEqualToThreshold"
    metrix            = "CPUUtilization"
    threshold         = 45
  }
}

variable "scaledown" {
  description       = "variable for auto scalling groups"
  type              = object({
    cooldown          = string
    policy            = string
    comparation       = string
    metrix            = string
    threshold         = string
  })
  default           = {
    cooldown          = "300"
    policy            = "SimpleScaling"
    comparation       = "LessThanOrEqualToThreshold"
    metrix            = "CPUUtilization"
    threshold         = 10
  }
}