variable "tests" {
  description = "contains all load tests configuration"
  type = map(object({
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

  validation {
    condition = alltrue([
      for k, v in var.tests : (
        v.location != null || var.location != null
      )
    ])
    error_message = "location must be provided either in the config object or as a separate variable."
  }

  validation {
    condition = alltrue([
      for k, v in var.tests : (
        v.resource_group_name != null || var.resource_group_name != null
      )
    ])
    error_message = "resource group name must be provided either in the config object or as a separate variable."
  }
}

variable "naming" {
  description = "contains naming convention"
  type        = map(string)
  default     = {}
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

