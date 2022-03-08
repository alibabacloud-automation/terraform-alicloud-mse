
output "mse_cluster_id" {
  description = "The id of MSE Cluster."
  value       = concat(alicloud_mse_cluster.cluster.*.id, [""])[0]
}

output "mse_cluster_status" {
  description = "The status of MSE Cluster."
  value       = concat(alicloud_mse_cluster.cluster.*.status, [""])[0]
}

output "mse_gateway_slb_list" {
  description = "A list of gateway Slb."
  value       = concat(alicloud_mse_gateway.gateway.*.slb_list, [""])[0]
}

output "mse_gateway_id" {
  description = "The resource ID in terraform of Gateway."
  value       = concat(alicloud_mse_gateway.gateway.*.id, [""])[0]
}

output "mse_gateway_status" {
  description = "The status of the gateway."
  value       = concat(alicloud_mse_gateway.gateway.*.status, [""])[0]
}