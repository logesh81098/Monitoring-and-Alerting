terraform {
  backend "s3" {
    bucket = "terraform-backend-files-logesh"
    key    = "monitoring and alerting"
    region = "us-east-1"
  }
}