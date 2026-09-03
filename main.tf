# load test
resource "azurerm_load_test" "this" {
  resource_group_name = coalesce(
    var.load_test.resource_group_name, var.resource_group_name
  )

  location = coalesce(
    var.load_test.location, var.location
  )

  tags = coalesce(
    var.load_test.tags, var.tags
  )

  name        = var.load_test.name
  description = var.load_test.description

  dynamic "identity" {
    for_each = var.load_test.identity != null ? { "this" = var.load_test.identity } : {}

    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "encryption" {
    for_each = var.load_test.encryption != null ? { "this" = var.load_test.encryption } : {}

    content {
      key_url = encryption.value.key_url

      identity {
        type        = encryption.value.identity.type
        identity_id = encryption.value.identity.identity_id
      }
    }
  }
}
