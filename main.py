import firebase_admin
from firebase_admin import credentials, firestore
import random


# setting up firebase credentials
cred = credentials.Certificate('./ec463-miniproject-firebase-adminsdk-3ke0r-c936727c6c.json')
default_app = firebase_admin.initialize_app(cred)
db = firestore.client()


# # generating random numbers for humidity and temperature
#
# #randomData = {
# #        humidity = 5
# #      "temperature" = 33#     }
#
# def get_quote() ->
#     {
#         'author' :
#     }
#
# #
# def get_data():
#     generate_data(x)
#     dat = json.dumps(x)
#     return dat


# getting a response to post on database
#
# response = get_data()
# temperature = response.body['temperature']
# humidity = response.body['humidity']



# doc_ref = db.collection(u'Houses').document(u'KjfrMD8eXilnJJ0n9CuO')
# doc_ref.set({
#     u'humidity' : 60,
#     u'temperature': 60,
#     u'maybe': u'works?'
# })


for x in range(10):
  temp1 = random.randint(60, 80)

for x in range(10):
  hum1 = random.randint(0, 25)

u = 'u'

for i in range(50):
    house_id = ('testID' + str(i))
    print(house_id)

doc_ref = db.collection(u'Houses').document(u+house_id)
doc_ref.set({
    u'humidity': hum1,
    u'temperature': temp1
})

doc_ref_users = db.collection(u'Users').document(u'testUser')
doc_ref_users.set({
    u'email': u'muddin1@bu.edu',
    u'test_field': hum1
})



for i in range(100):
    print('testID' + str(i))














