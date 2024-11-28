
variable "ami_id" {
  type        = string
  default     = "ami-0453ec754f44f9a4a"
  description = "This the amazon AMI used"
}


variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "This is the instance type used for the project"
}
