import requests
import os
import json
from dotenv import load_dotenv
from flask import Flask, request, jsonify
from flask_restful import Resource, Api 

#loading env variables
load_dotenv()
# creating the flask app 
app = Flask(__name__) 
# creating an API object 
api = Api(app) 

class telegram(Resource):

    def post(self):
        message=request.get_json()
        message=json.loads(message)
        TOKEN = os.environ['TOKEN']
        chat_id = os.environ['CHAT_ID']
        url = f"https://api.telegram.org/bot{TOKEN}/sendMessage?chat_id={chat_id}&text={message}"
        requests.get(url).json() # this sends the message
        return jsonify({'message':'message sent on telegram'})

class check(Resource):
    def get(self):
        return jsonify({'result':'Service is live!'})  
      
api.add_resource(telegram, '/') 
api.add_resource(check, '/check')

if __name__ == '__main__': 
  
    #app.run(debug = True, host='127.1.1.2', port=8081) #this is for local dev
    app.run(debug = True) #this is for cloud run