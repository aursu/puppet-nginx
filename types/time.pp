# @summary Type Alias for Nginx::Time
#
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
  Integer[0],
  Pattern[/^(?!$)((\d+y *)?(\d+M *)?(\d+w *)?(\d+d *)?(\d+h *)?(\d+m *)?(\d+s *)?(\d+ms)?|\d+)$/],
]
