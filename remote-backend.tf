terraform {
  backend "s3" {
    bucket         = "vishnu-15021" # change this
    key            = "vishnu/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}
