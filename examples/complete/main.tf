data "alicloud_zones" "default" {
  available_resource_creation = "VSwitch"
}

resource "alicloud_vpc" "vpc" {
  vpc_name   = "tf-mse-test"
  cidr_block = "172.16.0.0/16"
}

resource "alicloud_vswitch" "vswitch" {
  vswitch_name = "tf-mse-test"
  cidr_block   = cidrsubnet("172.16.0.0/16", 8, 2)
  vpc_id       = alicloud_vpc.vpc.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

resource "alicloud_vswitch" "backup_vswitch" {
  vswitch_name = "tf-mse-test-backup"
  cidr_block   = cidrsubnet("172.16.0.0/16", 8, 4)
  vpc_id       = alicloud_vpc.vpc.id
  zone_id      = data.alicloud_zones.default.zones.0.id
}

module "example" {
  source = "../.."

  #alicloud_mse_gateway
  create_gateway            = true
  vpc_id                    = alicloud_vpc.vpc.id
  vswitch_id                = alicloud_vswitch.vswitch.id
  backup_vswitch_id         = alicloud_vswitch.backup_vswitch.id
  gateway_name              = var.gateway_name
  gateway_replica           = 2
  gateway_spec              = "MSE_GTW_2_4_200_c"
  enterprise_security_group = var.enterprise_security_group
  internet_slb_spec         = var.internet_slb_spec
  slb_spec                  = var.slb_spec
  delete_slb                = var.delete_slb

  #alicloud_mse_cluster
  create_cluster            = true
  cluster_alias_name        = var.cluster_alias_name
  cluster_spec              = "MSE_SC_1_2_200_c"
  cluster_type              = "Eureka"
  cluster_version           = "EUREKA_1_9_3"
  instance_count            = 1
  net_type                  = "privatenet"
  pub_network_flow          = "1"
  acl_entry_list            = var.acl_entry_list
  disk_type                 = "alicloud-disk-ssd"
  private_slb_specification = "slb.s1.small"
  pub_slb_specification     = "slb.s1.small"
}

