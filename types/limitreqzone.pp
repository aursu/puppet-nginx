type Nginx::LimitReqZone = Struct[{
  size  => Nginx::Size,
  key   => String,
  rate  => Nginx::Rate
}]
