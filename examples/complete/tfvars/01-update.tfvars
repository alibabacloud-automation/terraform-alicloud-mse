#alicloud_mse_gateway
gateway_name              = "update-tf-testacc-gateway"
enterprise_security_group = false
internet_slb_spec         = "slb.s1.small"
slb_spec                  = "slb.s1.small"
delete_slb                = true

#alicloud_mse_cluster
cluster_alias_name = "update-tf-testacc-cluster"
acl_entry_list     = ["127.0.0.0/10"]