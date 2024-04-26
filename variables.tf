#alicloud_mse_gateway
variable "create_gateway" {
  description = "Controls if mse gateway should be created"
  type        = bool
  default     = false
}

variable "gateway_name" {
  description = "The name of the Gateway ."
  type        = string
  default     = ""
}

variable "gateway_replica" {
  description = "Required,Number of Gateway Nodes."
  type        = number
  default     = 2
}

variable "gateway_spec" {
  description = "Required,Gateway Node Specifications. Valid values: MSE_GTW_2_4_200_c, MSE_GTW_4_8_200_c, MSE_GTW_8_16_200_c, MSE_GTW_16_32_200_c."
  type        = string
  default     = "MSE_GTW_2_4_200_c"

  validation {
    condition     = contains(["MSE_GTW_2_4_200_c", "MSE_GTW_4_8_200_c", "MSE_GTW_8_16_200_c", "MSE_GTW_16_32_200_c"], var.gateway_spec)
    error_message = "Allowed values are MSE_GTW_2_4_200_c , MSE_GTW_4_8_200_c , MSE_GTW_8_16_200_c or MSE_GTW_16_32_200_c."
  }
}

variable "vpc_id" {
  description = "The ID of the vpc."
  type        = string
  default     = ""
}

variable "vswitch_id" {
  description = "The ID of the vswitch."
  type        = string
  default     = ""
}

variable "backup_vswitch_id" {
  description = "The backup vswitch id."
  type        = string
  default     = ""
}

variable "enterprise_security_group" {
  description = "Whether the enterprise security group type."
  type        = bool
  default     = false
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
variable "create_cluster" {
  description = "Controls if mse cluster should be created"
  type        = bool
  default     = false
}

variable "cluster_alias_name" {
  description = "The alias of MSE Cluster."
  type        = string
  default     = ""
}

variable "cluster_vswitch_id" {
  description = "The ID of the vswitch."
  type        = string
  default     = ""
}

variable "cluster_spec" {
  description = "Required,The engine specification of MSE Cluster. Valid values: MSE_SC_1_2_60_c, MSE_SC_2_4_60_c, MSE_SC_4_8_60_c, MSE_SC_8_16_60_c, MSE_SC_16_32_60_c, MSE_SC_1_2_200_c:1C2G, MSE_SC_2_4_200_c:2C4G, MSE_SC_4_8_200_c:4C8G, MSE_SC_8_16_200_c:8C16G."
  type        = string
  default     = "MSE_SC_1_2_200_c"

  validation {
    condition     = contains(["MSE_SC_1_2_60_c", "MSE_SC_2_4_60_c", "MSE_SC_4_8_60_c", "MSE_SC_8_16_60_c", "MSE_SC_16_32_60_c", "MSE_SC_1_2_200_c", "MSE_SC_2_4_200_c", "MSE_SC_4_8_200_c", "MSE_SC_8_16_200_c"], var.cluster_spec)
    error_message = "Allowed values are MSE_SC_1_2_60_c, MSE_SC_2_4_60_c, MSE_SC_4_8_60_c, MSE_SC_8_16_60_c, MSE_SC_16_32_60_c, MSE_SC_1_2_200_c, MSE_SC_2_4_200_c, MSE_SC_4_8_200_c, MSE_SC_8_16_200_c."
  }
}

variable "cluster_type" {
  description = "Required,The type of MSE Cluster.Valid values:ZooKeeper,Nacos-Ans,Eureka"
  type        = string
  default     = "ZooKeeper"

  validation {
    condition     = contains(["ZooKeeper", "Nacos-Ans", "Eureka"], var.cluster_type)
    error_message = "Allowed values are ZooKeeper , Nacos-Ans or Eureka."
  }
}

variable "cluster_version" {
  description = "Required,The version of MSE Cluster."
  type        = string
  default     = "ZooKeeper_3_6_3"
}

variable "instance_count" {
  description = "The count of instance."
  type        = number
  default     = 1
}

variable "net_type" {
  description = "Required,The type of network. Valid values: privatenet and pubnet."
  type        = string
  default     = "privatenet"

  validation {
    condition     = contains(["privatenet", "pubnet"], var.net_type)
    error_message = "Allowed values are privatenet or pubnet."
  }
}

variable "pub_network_flow" {
  description = "The public network bandwidth. 0 means no access to the public network."
  type        = string
  default     = "1"
}

variable "acl_entry_list" {
  description = "The whitelist."
  type        = list(string)
  default     = []
}

variable "disk_type" {
  description = "(Deprecated from version 1.1.0) The type of Disk."
  type        = string
  default     = "alicloud-disk-ssd"
}

variable "private_slb_specification" {
  description = "(Deprecated from version 1.1.0) The specification of private network SLB."
  type        = string
  default     = "slb.s1.small"
}

variable "pub_slb_specification" {
  description = "(Deprecated from version 1.1.0) The specification of public network SLB."
  type        = string
  default     = "slb.s1.small"
}

variable "mse_version" {
  description = "The version of MSE."
  type        = string
  default     = "mse_dev"
  validation {
    condition     = contains(["mse_pro", "mse_dev", "mse_serverless"], var.mse_version)
    error_message = "Allowed values are mse_pro, mse_dev, mse_serverless."
  }
}