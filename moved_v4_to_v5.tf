# the load test resource went from for_each = var.tests to a single instance,
# so the state address changed from azurerm_load_test.this["<key>"] to
# azurerm_load_test.this. keys were caller-chosen, this covers the key used in
# the documented example. consumers that used a different key must either
# adjust the from address below or run:
#   terraform state mv 'module.<name>.azurerm_load_test.this["<key>"]' 'module.<name>.azurerm_load_test.this'
moved {
  from = azurerm_load_test.this["lt1"]
  to   = azurerm_load_test.this
}
