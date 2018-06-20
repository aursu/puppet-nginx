type Nginx::Rate = Variant[
    Integer,
    Pattern[/[1-9][0-9]*(r\/[sm])?/]
]
