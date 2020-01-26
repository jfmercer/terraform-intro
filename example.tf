variable "region" {
  default = "us-east-2"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ami-b374d5a5" {
  default = "ami-b374d5a5"
}

provider "aws" {
  profile    = "default"
  region     = "${var.region}"
}

// first AMI
resource "aws_instance" "example" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_micro}"
}

// second AMI
resource "aws_instance" "another" {
  ami           = "${var.instance_ami}"
  instance_type = "${var.instance_micro}"
}

resource "aws_eip" "ip" {
    vpc = true
    instance = aws_instance.example.id
}

resource "aws_s3_bucket" "example" {
  # NOTE: S3 bucket names must be unique across _all_ AWS accounts, so
  # this name must be changed before applying this example to avoid naming
  # conflicts.
  bucket = "terraform-getting-started-guide-124505c"
  acl    = "private"
}