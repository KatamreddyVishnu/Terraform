provider "aws" {
  access_key = "AKIATCKAOQX2N7747KNT"
  secret_key = "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"
  region = "us-east-1"
}

variable "ami" {
  description = "value"
}

variable "instance_type" {
  description = "value"
  type = map(string)

  default = {
    "dev" = "t2.nano"
    "stage" = "t1.micro"
    "prod" = "t2.micro"
  }
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t2.micro")
}
