# Overview
#
# Very unfinished, and mostly untested -- some sample terraform code for our raw data upload
# + automated processing of that data. We'll create one or more s3 buckets, with which IAM auth'd non-profit
# users will have access to upload data to via the AWS console. There are of course other options -- a web
# app wherein users auth to a login area that provides upload functionality (seems overkill). Retool or
# another internal app builder could be a better choice if for some reason we really don't want to provide
# AWS console upload ability (IAM users/roles to perform these uploads would be least-privilege of course).

# s3 bucket for uploading anxiety data
resource "aws_s3_bucket" "upload_anxiety" {
  bucket   = "raw-anxiety-3948593z82819dw4094"
}

# sends event notifications from our upload anxiety bucket to eventbridge
resource "aws_s3_bucket_notification" "upload_anxiety_notification" {
  bucket      = aws_s3_bucket.upload_anxiety.id
  eventbridge = true
}

# rule to filter for only object created events
resource "aws_cloudwatch_event_rule" "s3_object_created" {
  name        = "s3-object-created"
  description = "Fires when a new object is created in our raw-anxiety S3 bucket"

  event_pattern = jsonencode({
    source : ["aws.s3"]
    detail-type = ["Object Created"]
    resources   = ["${aws_s3_bucket.upload_anxiety.arn}"]
  })
}

# TODO: (too many to list)
# - glue workflow + job
# - decide whether non-profit users will upload different datasets to separate buckets, or to separate
#     prefixes within one single bucket. if separate buckets, we'll be repeating the above bucket + event
#     numerous times (one for each dataset); in that case, obviously a module starts to look enticing
# - iam, user upload access
