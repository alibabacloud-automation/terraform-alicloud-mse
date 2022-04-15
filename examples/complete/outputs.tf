output "vpc_id" {
  description = "The id of vpc."
  value       = data.alicloud_vpcs.default.vpcs.0.id
}

output "vswitch_id" {
  description = "The id of VSwitch."
  value       = data.alicloud_vswitches.default.vswitches.0.id
}

output "backup_vswitch_id" {
  description = "The id of backup VSwitch."
  value       = data.alicloud_vswitches.default.vswitches.1.id
}

output "mse_cluster_id" {
  description = "The id of MSE Cluster."
  value       = module.mse_cluster.mse_cluster_id
}

output "mse_cluster_status" {
  description = "The status of MSE Cluster."
  value       = module.mse_cluster.mse_cluster_status
}

output "mse_gateway_slb_list" {
  description = "A list of gateway Slb."
  value       = module.mse_gateway.mse_gateway_slb_list
}

output "mse_gateway_id" {
  description = "The resource ID in terraform of Gateway."
  value       = module.mse_gateway.mse_gateway_id
}

output "mse_gateway_status" {
  description = "The status of the gateway."
  value       = module.mse_gateway.mse_gateway_status
}