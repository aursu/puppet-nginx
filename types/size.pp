type Nginx::Time = Variant[
    Integer,
    Pattern[/[1-9][0-9]*[kKmM]?/]
]
