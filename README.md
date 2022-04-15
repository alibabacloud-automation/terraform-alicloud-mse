Terraform module which creates microservice engine (MSE) gateway on Alibaba Cloud

terraform-alicloud-mse
=====================================================================

English | [简体中文](README-CN.md)

This module is used to create a microservice engine (MSE) gateway under Alibaba Cloud.

These types of resources are supported:

* [alicloud_mse_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mse_cluster)
* [alicloud_mse_gateway](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mse_gateway)

## Usage

```hcl
module "example" {
  source             = "terraform-alicloud-modules/mse/alicloud"
  
  #alicloud_mse_gateway
  vpc_id             = "vpc-123456xxx"
  vswitch_id         = "vsw-123456xxx"
  backup_vswitch_id  = "vsw-123456xxx"
  gateway_name       = "tf-name"
  gateway_replica    = 2
  gateway_spec       = "MSE_GTW_2_4_200_c"

  #alicloud_mse_cluster
  cluster_alias_name = "tf-name"
  cluster_spec       = "MSE_SC_1_2_200_c"
  cluster_type       = "Eureka"
  cluster_version    = "EUREKA_1_9_3"
}
```

## Examples

* [complete example](https://github.com/terraform-alicloud-modules/terraform-alicloud-mse/tree/main/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`. If you have not set them
  yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.157.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.157.0 |

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)