from dotenv import load_dotenv


from pymongo import MongoClient
import os

load_dotenv()
connection_string = os.getenv("MONGO_URI")



client = MongoClient(connection_string)

db = client["openenv"]
collection = db["users"]

collection.insert_one({"name": "John Doe", "email": "john.doe@example.com"})

print("User inserted successfully!")
