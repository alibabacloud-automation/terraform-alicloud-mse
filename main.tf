resource "alicloud_mse_gateway" "gateway" {
  count                     = var.create_gateway ? 1 : 0
  gateway_name              = var.gateway_name
  replica                   = var.gateway_replica
  spec                      = var.gateway_spec
  vpc_id                    = var.vpc_id
  vswitch_id                = var.vswitch_id
  backup_vswitch_id         = var.backup_vswitch_id
  enterprise_security_group = var.enterprise_security_group
  internet_slb_spec         = var.internet_slb_spec
  slb_spec                  = var.slb_spec
  delete_slb                = var.delete_slb
  timeouts {
    create = "20m"
  }
}

resource "alicloud_mse_cluster" "cluster" {
  count                     = var.create_cluster ? 1 : 0
  cluster_alias_name        = var.cluster_alias_name
  vswitch_id                = var.cluster_vswitch_id != "" ? var.cluster_vswitch_id : var.vswitch_id
  cluster_specification     = var.cluster_spec
  cluster_type              = var.cluster_type
  cluster_version           = var.cluster_version
  instance_count            = var.instance_count
  net_type                  = var.net_type
  pub_network_flow          = var.pub_network_flow
  acl_entry_list            = var.acl_entry_list
  disk_type                 = var.disk_type
  private_slb_specification = var.private_slb_specification
  pub_slb_specification     = var.pub_slb_specification
}