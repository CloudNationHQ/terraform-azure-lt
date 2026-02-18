resource "azurerm_load_test" "this" {
  for_each = var.tests

  name = coalesce(
    each.value.name,
    try(
      join("-", [var.naming.load_test, each.key]), null
    ), each.key
  )

  resource_group_name = coalesce(
    lookup(each.value, "resource_group_name", null),
    var.resource_group_name
  )

  location = coalesce(
    lookup(each.value, "location", null),
    var.location
  )

  description = each.value.description

  tags = coalesce(
    each.value.tags, var.tags
  )

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []

    content {
      type         = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }

  dynamic "encryption" {
    for_each = each.value.encryption != null ? [each.value.encryption] : []

    content {
      identity {
        type        = encryption.value.identity.type
        identity_id = encryption.value.identity.identity_id
      }
      key_url = encryption.value.key_url
    }
  }
}

