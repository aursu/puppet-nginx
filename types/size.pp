type Nginx::Size = Variant[
    Integer,
    Pattern[/^[1-9][0-9]*[kKmM]?$/]
]
