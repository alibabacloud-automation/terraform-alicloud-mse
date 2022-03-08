output "vpc_id" {
  description = "The id of vpc."
  value       = alicloud_vpc.vpc.id
}

output "vswitch_id" {
  description = "The id of VSwitch."
  value       = alicloud_vswitch.vswitch.id
}

output "backup_vswitch_id" {
  description = "The id of backup VSwitch."
  value       = alicloud_vswitch.backup_vswitch.id
}

output "mse_cluster_id" {
  description = "The id of MSE Cluster."
  value       = module.example.mse_cluster_id
}

output "mse_cluster_status" {
  description = "The status of MSE Cluster."
  value       = module.example.mse_cluster_status
}

output "mse_gateway_slb_list" {
  description = "A list of gateway Slb."
  value       = module.example.mse_gateway_slb_list
}

output "mse_gateway_id" {
  description = "The resource ID in terraform of Gateway."
  value       = module.example.mse_gateway_id
}

output "mse_gateway_status" {
  description = "The status of the gateway."
  value       = module.example.mse_gateway_status
}
