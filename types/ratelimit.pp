type Nginx::RateLimit = Variant[
  Struct[{
      zone                => String,
      Optional[burst]     => Integer,
      Optional[delay]     => Integer,
  }],
  Struct[{
      zone                => String,
      Optional[burst]     => Integer,
      Optional[nodelay]   => Boolean,
  }],
]
