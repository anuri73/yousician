import os

from sqlalchemy import create_engine, inspect

db_string = 'postgresql://{}:{}@{}:{}/{}'.format(
    os.environ['APP_USER'],
    os.environ['APP_PASSWORD'],
    "db",
    '5432',
    os.environ['APP_DB']
)
db = create_engine(db_string)
inspector = inspect(db)

print(db.echo)