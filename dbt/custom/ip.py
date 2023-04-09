import glob
from typing import Optional

import pandas as pd
from iptocc import CountryCodeNotFound
from iptocc import get_country_code

# use glob to get all the csv files
# in the folder
path = "/source/hb/**/**/**/*.csv"
csv_files = glob.glob(path)

df = pd.concat((pd.read_csv(f) for f in csv_files))


def country_code(row) -> Optional[str]:
    try:
        return get_country_code(row['ip_address'])
    except CountryCodeNotFound:
        return None

df['country'] = df.apply(country_code, axis=1)

df[['ip_address', 'country']].drop_duplicates().dropna().to_csv('/app/seeds/ip_country.csv', index=False)
