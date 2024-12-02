provider "aws" {
    access_key = "xxxxxxxxxxxxxx"
    secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxx"
    region = "us-east-1"
  
}

resource "aws_instance" "vishnu-ec2" {
    instance_type = "t2.micro"
    ami = "ami-005fc0f236362e99f"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "vishnu-15021112"
  
}
#The Terraform lock file is mainly used to lock the versions of the provides and the Terraform if someone is using it on another machine they will not get the version conflicts.
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
