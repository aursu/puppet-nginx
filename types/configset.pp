type Nginx::ConfigSet = Variant[
    Hash[
        String,
        Variant[
            String,
            Array[String, 1]
        ], 1],
    Array[Array[String, 2, 2], 1]
]
