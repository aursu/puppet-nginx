type Nginx::FileCache = Variant[
    Enum['off'],
    Struct[{
      max                 => Integer,
      Optional[inactive]  => Integer
    }]
]
