type Nginx::CachePath = Struct[{
        keys_zone                   => String,
        Optional[levels]            => String,
        Optional[use_temp_path]     => Variant[Boolean, Enum['on', 'off']],
        Optional[inactive]          => String,  # time
        Optional[max_size]          => String,  # size
        Optional[manager_files]     => Integer, # number
        Optional[manager_sleep]     => String, # time in milliseconds (50ms)
        Optional[manager_threshold] => String, # time in milliseconds (200ms)
        Optional[loader_files]      => Integer, # number
        Optional[loader_sleep]      => String, # time in milliseconds
        Optional[loader_threshold]  => String, # time in milliseconds
        Optional[purger]            => Variant[Boolean, Enum['on', 'off']],
        Optional[purger_files]      => Integer, # number
        Optional[purger_sleep]      => String, # time in milliseconds
        Optional[purger_threshold]  => String, # time in milliseconds
      }]
