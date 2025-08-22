output "My terraform test bucket" { 
    value = aws_s3_bucket.my_bucket.bucket  
  
}