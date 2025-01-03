resource "aws_instance" "wandaprep-web-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "wandaprep-web-server"
  }
}

resource "aws_instance" "wandaprep-prod-server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = "wandaprep-prod-server"
  }
}

/*
resource "aws_s3_bucket" "example" {
  bucket = "my-tf-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
*/