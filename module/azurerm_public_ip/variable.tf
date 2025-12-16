variable "pip" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    allocation_method    = string
    ddos_protection_mode = optional(string)
    tags                 = optional(map(string))
  }))
}