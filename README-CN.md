Terraform module which creates microservice engine (MSE) gateway on Alibaba Cloud

terraform-alicloud-mse
=====================================================================

[English](README.md) | 简体中文

本 Module 用于在阿里云自动化管理和配置MSE云原生网关，包括集群和网关。

本 Module 支持创建以下资源:

* [alicloud_mse_cluster](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mse_cluster)
* [alicloud_mse_gateway](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs/resources/mse_gateway)

## 用法

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

## 示例

* [MSE 完整示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-mse/tree/main/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file`
  中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置.

## 要求

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | > = 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | > = 1.157.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_alicloud"></a> [alicloud](#provider\_alicloud) | > = 1.157.0 |

## 提交问题

如果在使用该 Terraform Module
的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

## 作者

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## 许可

MIT Licensed. See LICENSE for full details.

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)