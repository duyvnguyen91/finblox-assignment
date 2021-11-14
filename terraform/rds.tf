resource "aws_db_subnet_group" "main" {
  name       = "tf-db-main-subnet-group"
  subnet_ids = "${module.vpc.private_subnets_id}"
}

resource "aws_db_instance" "default" {
    allocated_storage = 20
    identifier = "duynv-rds"
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t2.micro"
    name = "test"
    username = var.rds_account
    password = var.rds_password
    parameter_group_name = "default.mysql5.7"
    db_subnet_group_name = "${aws_db_subnet_group.main.name}"
}