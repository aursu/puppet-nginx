function nginx::switch(Variant[Nginx::Switch, String] $directive) >> String {
  case $directive {
    false: { 'off' }
    true: { 'on' }
    default: { $directive }
  }
}
