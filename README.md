# Load Tests

This terraform module simplifies the creation of Azure Load Testing resources on the azure cloud platform, allowing users to configure and manage load tests in a structured and repeatable way.

## Features

Supports provisioning multiple load tests through a single object-driven configuration.

Utilization of terratest for robust validation.

Supports user-assigned managed identity configuration.

Supports customer-managed key encryption settings.

Offers three-tier naming hierarchy (explicit, convention-based, or key-based) for flexible resource management.

<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (~> 1.0)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (~> 4.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (~> 4.0)

## Resources

The following resources are used by this module:

- [azurerm_load_test.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/load_test) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_tests"></a> [tests](#input\_tests)

Description: contains all load tests configuration

Type:

```hcl
map(object({
    name                = optional(string)
    location            = optional(string)
    resource_group_name = optional(string)
    description         = optional(string)
    tags                = optional(map(string))
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))
    encryption = optional(object({
      identity = object({
        type        = string
        identity_id = string
      })
      key_url = string
    }))
  }))
```

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_location"></a> [location](#input\_location)

Description: default azure region to be used.

Type: `string`

Default: `null`

### <a name="input_naming"></a> [naming](#input\_naming)

Description: contains naming convention

Type: `map(string)`

Default: `{}`

### <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name)

Description: default resource group to be used.

Type: `string`

Default: `null`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: tags to be added to the resources

Type: `map(string)`

Default: `{}`

## Outputs

The following outputs are exported:

### <a name="output_tests"></a> [tests](#output\_tests)

Description: contains all load test config
<!-- END_TF_DOCS -->

## Goals

For more information, please see our [goals and non-goals](./GOALS.md).

## Testing

For more information, please see our testing [guidelines](./TESTING.md)

## Notes

Using a dedicated module, we've developed a naming convention for resources that's based on specific regular expressions for each type, ensuring correct abbreviations and offering flexibility with multiple prefixes and suffixes.

Full examples detailing all usages, along with integrations with dependency modules, are located in the examples directory.

To update the module's documentation run `make doc`

## Contributors

We welcome contributions from the community! Whether it's reporting a bug, suggesting a new feature, or submitting a pull request, your input is highly valued.

For more information, please see our contribution [guidelines](./CONTRIBUTING.md). <br><br>

<a href="https://github.com/cloudnationhq/terraform-azure-lt/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=cloudnationhq/terraform-azure-lt" />
</a>

## License

MIT Licensed. See [LICENSE](./LICENSE) for full details.

## References

- [Documentation](https://learn.microsoft.com/en-us/azure/app-testing/load-testing/overview-what-is-azure-load-testing)
- [Rest Api](https://learn.microsoft.com/en-us/rest/api/loadtesting/)
- [Rest Api Specs](https://github.com/Azure/azure-rest-api-specs/tree/main/specification/loadtestservice/resource-manager)
