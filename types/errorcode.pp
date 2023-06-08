type Nginx::ErrorCode = Variant[
  Integer[400, 599],
  Pattern[/^[45][0-9]{2}$/]
]
