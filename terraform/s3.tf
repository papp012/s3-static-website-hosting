resource "aws_s3_bucket" "www_bucket" {
  bucket = "www.${var.prefix}-websitetest.com"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  acl = "public-read"
  bucket = aws_s3_bucket.www_bucket.id 
}

#resource "aws_s3_bucket_object" "object" {
#  for_each = fileset("../app", "*")
#
 # bucket = "www.papp012-websitetest.com"
  #key    = each.value
  #source = "../app/${each.value}"
#}

resource "aws_s3_bucket_object" "index_page" {
  bucket = "${aws_s3_bucket.www_bucket.id}"
  key = "index.html"
  source = "../app/index.html"
  content_type = "text/html"
  acl = "public-read"
}

resource "aws_s3_bucket_object" "error_page" {
  bucket = "${aws_s3_bucket.www_bucket.id}"
  key = "404.html"
  source = "../app/404.html"
  content_type = "text/html"
  acl = "public-read"
}

resource "aws_s3_bucket_object" "css" {
  bucket = "${aws_s3_bucket.www_bucket.id}"
  for_each = fileset("../app/css", "*")
  key = each.value
  source = "../app/css/${each.value}"
  content_type = "text/css"
}

resource "aws_s3_bucket_object" "pictures" {
  bucket = "${aws_s3_bucket.www_bucket.id}"
  for_each = fileset("../app/pictures", "*")
  key = each.value
  source = "../app/pictures/${each.value}"
  content_type = "image/jpeg"
}