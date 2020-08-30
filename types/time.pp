# http://nginx.org/en/docs/syntax.html
# ms	milliseconds
# s	seconds
# m	minutes
# h	hours
# d	days
# w	weeks
# M	months, 30 days
# y	years, 365 days
# A value without a suffix means seconds
type Nginx::Time = Variant[
    Integer,
    Pattern[/^[1-9][0-9]*([smhdwMy]|ms)?$/]
]
