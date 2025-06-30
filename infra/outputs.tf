# an example of some output
output "bucket_upload_anxiety" {
  description = "arn of raw anxiety uploads bucket"
  value       = aws_s3_bucket.upload_anxiety.arn
}
