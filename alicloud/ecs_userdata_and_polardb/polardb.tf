data "alicloud_zones" "default" {
  available_resource_creation = "PolarDB"
}

resource "alicloud_polardb_cluster" "demo_polardb" {
  db_node_class = "polar.mysql.x4.medium"
  db_type = "MySQL"
  db_version = "8.0"
  pay_type = "PostPaid"
  vswitch_id = alicloud_vswitch.zone_A.id
  security_ips = ["${alicloud_vswitch.zone_A.cidr_block}"]
  description = "PolarDB Demo Cluster"
}

resource "alicloud_polardb_database" "db" {
  db_cluster_id = alicloud_polardb_cluster.demo_polardb.id
  db_name = "demodb"
  db_description = "PolarDB Database"
}

resource "alicloud_polardb_account" "account_demo" {
  account_name = "bayuadmn"
  account_password = "Test123100@"
  db_cluster_id = alicloud_polardb_cluster.demo_polardb.id
  account_description = "Using for testing and demo purpose"
}

resource "alicloud_polardb_account_privilege" "priviledge_demo" {
  account_name = alicloud_polardb_account.account_demo.account_name
  db_cluster_id = alicloud_polardb_cluster.demo_polardb.id
  db_names = ["${alicloud_polardb_database.db.*.db_name}"]
  account_privilege = "ReadWrite"
}
