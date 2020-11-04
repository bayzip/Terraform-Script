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

variable "network" {
  description       = "variable for creating network"
  type              = object({
    cidr            = string
    azs             = list(string)
    private         = list(string)
    public          = list(string)
  })
  default           = {
    cidr            = "192.0.0.0/16"
    azs             = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
    private         = ["192.0.1.0/24", "192.0.2.0/24", "192.0.3.0/24"]
    public          = ["192.0.101.0/24", "192.0.102.0/24", "192.0.103.0/24"]
  }
}
