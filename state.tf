terraform {
  backend "s3" {
    bucket = "terraformstatefile09121995"
    key    = "remote.tfstate"
    region = "ap-south-1"
  }
}