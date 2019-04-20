type Nginx::ReturnFormat = Variant[
  Integer[100, 511],
  Stdlib::HTTPUrl,
  Stdlib::HTTPSUrl,
  Hash[Integer[301, 303], Variant[Stdlib::HTTPUrl, Stdlib::HTTPSUrl]],
  Hash[Integer[307, 308], Variant[Stdlib::HTTPUrl, Stdlib::HTTPSUrl]],
  Hash[Integer[100, 103], String],
  Hash[Integer[200, 226], String],
  Hash[Integer[304, 306], String],
  Hash[Integer[400, 511], String],
]
