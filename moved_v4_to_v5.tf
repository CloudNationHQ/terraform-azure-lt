# covers the "lt1" example key; other keys need:
#   terraform state mv 'module.<name>.azurerm_load_test.this["<key>"]' 'module.<name>.azurerm_load_test.this'
moved {
  from = azurerm_load_test.this["lt1"]
  to   = azurerm_load_test.this
}
