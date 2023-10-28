terraform {
  backend "s3" {
    bucket = "<name of bucket with random numbers"
    key    = "remote.tfstate"
    region = "your region"
  }
}