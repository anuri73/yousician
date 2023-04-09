SELECT 'hb'                                                                        as game,
       COUNT(IF(gender = 'Male', 1, NULL))                                            count_male,
       COUNT(IF(gender = 'Female', 1, NULL))                                          count_female,
       COUNT(IF(gender = 'Male', 1, NULL)) / COUNT(IF(gender = 'Female', 1, NULL)) as ratio
FROM {{ ref('stg_hb') }}
union all
SELECT 'wwc'                                                                       as game,
       COUNT(IF(gender = 'male', 1, NULL))                                            count_male,
       COUNT(IF(gender = 'female', 1, NULL))                                          count_female,
       COUNT(IF(gender = 'male', 1, NULL)) / COUNT(IF(gender = 'female', 1, NULL)) as ratio
FROM {{ ref('stg_wwc') }}