resource "aws_s3_bucket" "www_bucket" {
  prefix = "www.${var.prefix}-websitetest.com"
   
}


resource "aws_s3_bucket_acl" "bucket_acl" {
  acl = "public-read"
  bucket = aws_s3_bucket.www_bucket.id 
}