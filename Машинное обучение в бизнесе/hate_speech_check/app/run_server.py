import dill
import pandas as pd
import numpy as np
import re
import json
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression

import nltk
from nltk.stem import WordNetLemmatizer
nltk.download('omw-1.4')
nltk.download('wordnet')
lemmas = WordNetLemmatizer()

import os
dill._dill._reverse_typemap['ClassType'] = type
import flask
import logging
from logging.handlers import RotatingFileHandler
from time import strftime

app = flask.Flask(__name__)

handler = RotatingFileHandler(filename='app.log', maxBytes=100000, backupCount=10)
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.addHandler(handler)

with open('/app/app/contractions.json', 'r') as m:
    contractions = json.load(m)

def load_model(model_path):
	with open(model_path, 'rb') as f:
		model = dill.load(f)
	print(model)
	return model

modelpath = "/app/app/models/hate_speech_check.dill"
model = load_model(modelpath)

@app.route("/", methods=["GET"])
def general():
	return """Welcome to 'check your toxic level'. Please use 'http://<address>/predict' to POST"""

@app.route("/predict", methods=["POST"])
def predict():
	data = {"success": False}
	dt = strftime("[%Y-%b-%d %H:%M:%S]")
	
	if flask.request.method == "POST":

		comment_text = ""
		request_json = flask.request.get_json()

		if request_json["comment_text"]:
			comment_text = request_json["comment_text"]

		logger.info(f'{dt} Data: comment_text={comment_text}')

		try:
			df = pd.DataFrame({"comment_text": [comment_text]})
			print(f'TRYING TO PREDICT {comment_text}')
			preds = model.predict_proba(df)
			print(preds)

		except AttributeError as e:
			logger.warning(f'{dt} Exception: {str(e)}')
			data['predictions'] = str(e)
			data['success'] = False
			return flask.jsonify(data)

		data["predictions"] = int(np.where(preds[:, 1][0] < 0.1315460332422606, 0, 1))
		data["success"] = True

	return flask.jsonify(data)

if __name__ == "__main__":
	print(("* Loading the model and Flask starting server..."
		"please wait until server has fully started"))
	port = int(os.environ.get('PORT', 8180))
	app.run(host='0.0.0.0', debug=True, port=port)