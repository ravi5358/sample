#############################################Users#########################
resource "aws_iam_user" "admin1" {
  name = "admin1"
  path = "/system/"
  tags = {
    tag-key = "Administration_access"
  }
}

resource "aws_iam_user" "admin2" {
  name = "admin2"
  path = "/system/"
  tags = {
    tag-key = "S3_Full_Access"
  }
}
resource "aws_iam_user" "admin3" {
  name = "admin3"
  path = "/system/"
  tags = {
    tag-key = "Load_balancer_read_write_Access"
  }
}
resource "aws_iam_group_membership" "administrators-users" {
  name = "administrators-users"
  users = [
    "${aws_iam_user.admin1.name}",
    "${aws_iam_user.admin2.name}",
    "${aws_iam_user.admin3.name}",
  ]
  group = "${aws_iam_group.administrators.name}"
}
