#alicloud_mse_gateway
variable "gateway_name" {
  description = "The name of the Gateway ."
  type        = string
  default     = "tf-testacc-gateway"
}

variable "enterprise_security_group" {
  description = "Whether the enterprise security group type."
  type        = bool
  default     = true
}

variable "internet_slb_spec" {
  description = "Public network SLB specifications."
  type        = string
  default     = "slb.s2.small"
}

variable "slb_spec" {
  description = "Private network SLB specifications."
  type        = string
  default     = "slb.s2.small"
}

variable "delete_slb" {
  description = "Whether to delete the SLB purchased on behalf of the gateway at the same time."
  type        = bool
  default     = false
}

#alicloud_mse_cluster
variable "cluster_alias_name" {
  description = "The alias of MSE Cluster."
  type        = string
  default     = "tf-testacc-cluster"
}

variable "acl_entry_list" {
  description = "The whitelist."
  type        = list(string)
  default     = ["127.0.0.1/32"]
}