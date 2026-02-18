module "naming" {
  source  = "cloudnationhq/naming/azure"
  version = "~> 0.26"

  suffix = ["demo", "dev"]
}

module "rg" {
  source  = "cloudnationhq/rg/azure"
  version = "~> 2.0"

  groups = {
    demo = {
      name     = module.naming.resource_group.name_unique
      location = "westeurope"
    }
  }
}

module "uai" {
  source  = "cloudnationhq/uai/azure"
  version = "~> 2.0"

  config = {
    name                = module.naming.user_assigned_identity.name
    location            = module.rg.groups.demo.location
    resource_group_name = module.rg.groups.demo.name
  }
}

module "lt" {
  source = "../../"

  naming = local.naming

  tests = {
    lt1 = {
      location            = module.rg.groups.demo.location
      resource_group_name = module.rg.groups.demo.name
      identity = {
        type         = "UserAssigned"
        identity_ids = [module.uai.config.id]
      }
    }
  }

  tags = {
    environment = "demo"
  }
}
