variable "load_test" {
  description = "contains all load test configuration"
  type = object({
    name                = string
    location            = optional(string)
    resource_group_name = optional(string)
    description         = optional(string)
    tags                = optional(map(string))
    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))
    encryption = optional(object({
      key_url = string
      identity = object({
        type        = string
        identity_id = string
      })
    }))
  })

  validation {
    condition     = lookup(var.load_test, "location", null) != null || var.location != null
    error_message = "location must be set on var.load_test.location or on the module-level var.location."
  }

  validation {
    condition     = lookup(var.load_test, "resource_group_name", null) != null || var.resource_group_name != null
    error_message = "resource_group_name must be set on var.load_test.resource_group_name or on the module-level var.resource_group_name."
  }
}

variable "location" {
  description = "default azure region to be used."
  type        = string
  default     = null
}

variable "resource_group_name" {
  description = "default resource group to be used."
  type        = string
  default     = null
}

variable "tags" {
  description = "tags to be added to the resources"
  type        = map(string)
  default     = {}
}
