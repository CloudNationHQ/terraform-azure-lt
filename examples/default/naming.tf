locals {
  naming = {
    for type in local.naming_types : type => lookup(module.naming, type).name
  }

  naming_types = ["load_test"]
}
