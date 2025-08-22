terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.0"
        }
        random = {
        source  = "hashicorp/random"
        version = "~> 3.0"
        }
    }
}
provider "aws" {
    region = var.aws_region
}

resource "random_id" "bucket_id" {
    byte_length = 8
}
resource "aws_s3_bucket" "my_bucket" {
    bucket = "my-unique-bucket-${random_id.bucket_id.hex}"

    tags = {
        Name        = "My terraform test bucket"
    }
    force_destroy = true
}

output "My terraform test bucket" { 
    value = aws_s3_bucket.my_bucket.bucket  
  
}
