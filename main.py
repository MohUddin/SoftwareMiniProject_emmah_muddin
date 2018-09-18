import firebase_admin
from firebase_admin import credentials, firestore
import json


# setting up firebase credentials
cred = credentials.Certificate('./ec463-miniproject-firebase-adminsdk-3ke0r-c936727c6c.json')
default_app = firebase_admin.initialize_app(cred)
db = firestore.client()

# generating random numbers for humidity and temperature

#randomData = {
#        humidity = 5
#      "temperature" = 33#     }

def generateData():
    return input


def getData():
    generateData(x)
    dat = json.dumps(x)
    return dat



# getting a response to post on database

response = getData()
temperature = response.body['temperature']
humidity = response.body['humidity']














