variable "aws_region" {
  description = "The AWS region to launch instances"
  default     = "us-east-1"
}

variable "key_name" {
  description = "Name of the SSH key pair"
}

variable "public_key_path" {
  description = "Path to the public key file"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu EC2"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
