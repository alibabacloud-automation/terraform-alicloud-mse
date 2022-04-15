data "alicloud_vpcs" "default" {
  name_regex = "default-NODELETING"
}

data "alicloud_vswitches" "default" {
  name_regex = "default-zone-j"
  vpc_id     = data.alicloud_vpcs.default.vpcs.0.id
}

module "mse_gateway" {
  source = "../.."

  #alicloud_mse_gateway
  create_gateway = true

  gateway_name              = var.gateway_name
  gateway_replica           = 2
  gateway_spec              = "MSE_GTW_2_4_200_c"
  vpc_id                    = data.alicloud_vpcs.default.vpcs.0.id
  vswitch_id                = data.alicloud_vswitches.default.vswitches.0.id
  backup_vswitch_id         = data.alicloud_vswitches.default.vswitches.1.id
  enterprise_security_group = var.enterprise_security_group
  internet_slb_spec         = var.internet_slb_spec
  slb_spec                  = var.slb_spec
  delete_slb                = var.delete_slb

  #alicloud_mse_cluster
  create_cluster = false

}

module "mse_cluster" {
  source = "../.."

  #alicloud_mse_gateway
  create_gateway = false

  #alicloud_mse_cluster
  create_cluster = true

  cluster_alias_name        = var.cluster_alias_name
  cluster_vswitch_id        = data.alicloud_vswitches.default.vswitches.2.id
  cluster_spec              = "MSE_SC_1_2_200_c"
  cluster_type              = "ZooKeeper"
  cluster_version           = "ZooKeeper_3_6_3"
  instance_count            = 1
  net_type                  = "privatenet"
  pub_network_flow          = "1"
  acl_entry_list            = var.acl_entry_list
  disk_type                 = "alicloud-disk-ssd"
  private_slb_specification = "slb.s1.small"
  pub_slb_specification     = "slb.s1.small"

}