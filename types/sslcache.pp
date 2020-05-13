type Nginx::SSLCache = Variant[
    Enum['off', 'none'],
    Struct[{
      type           => Enum['builtin'],
      Optional[size] => Nginx::Size
    }],
    Struct[{
      type => Enum['shared'],
      name => String,
      size => Nginx::Size
    }]
]
