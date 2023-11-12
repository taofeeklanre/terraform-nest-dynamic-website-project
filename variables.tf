# environment variable
variable "region" {
  description = "region to create resources"
  type        = string
}

variable "project_name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}

 # vpc variables

variable "vpc_cidr" {
description = "vpc cidr block"
type          = string
}

variable "public_subnet_az1_cidr" {
description = "public subnet az1 cidr block"
type          = string
 }

variable "public_subnet_az2_cidr" {
description = "public subnet az2 cidr block"
type          = string
 }
variable "private_app_subnet_az1_cidr" {
description = "private app subnet az1 cidr block"
type          = string
 }

variable "private_app_subnet_az2_cidr" {
description = "private app subnet az2 cidr block"
type          = string
 }

variable "private_data_subnet_az1_cidr" {
description = "private data subnet az1 cidr block"
type          = string
 }

variable "private_data_subnet_az2_cidr" {
description = "private data subnet az2 cidr block"
type          = string
 }

 # rds variables
 variable "engine_type" {
   description = "db engine type"
   type        = string
 }
 
 variable "engine_version" {
   description = "db engine type"
   type        = string
 }
 
 
 variable "multi_az_deployment" {
   description = "create a standby db instance"
   type        = bool
 }

 variable "database_instance_identifier" {
   description = "database instance identifier"
   type        = string
 }

 variable "database_instance_class" {
   description = "database instance type"
   type        = string
 }

 variable "db_username" {
   description = "database instance type"
   type        = string
 }

 variable "db_password" {
   description = "database instance type"
   type        = string
 }

 variable "db_name" {
   description = "database instance type"
   type        = string
 }

# sns variables
 variable "operator_email" {
   description = "operator email"
   type        = string
 }

  # acm variables
 variable "domain_name" {
   description = "domain name"
   type        = string
 }

 variable "alternative_names" {
   description = "alternative name"
   type        = string
 }


 #ec2 migrate variables
 variable "amazon_linux_ami_id" {
   description = "amazon linux ami id"
   type        = string
 }

 variable "instance_type_name" {
   description = "instance type name"
   type        = string
 }

  # route-53 variables
 variable "record_name" {
   description = "sub domain name"
   type        = string
 }



