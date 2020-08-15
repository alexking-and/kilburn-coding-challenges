import tensorflow as tf
import numpy as np
from tensorflow import keras
from tensorflow.keras.utils import to_categorical
from flask import Flask
app = Flask(__name__)

# Load model
MODEL_PATH = '../data/model'
model = keras.models.load_model(MODEL_PATH)

# Parameters (must match model)
REVERSE = True
DIGITS_PER_SIDE = 3
MAX_INPUT_LEN = (2 * DIGITS_PER_SIDE) + 1
CHARS = list('0123456789+ ')
CHARS_INT_ENCODED = {x: i for i, x in enumerate(CHARS)}
ONE_HOT_CHARS = np.array(
    to_categorical(
        list(CHARS_INT_ENCODED.values()), 
        len(CHARS_INT_ENCODED), 
        'bool'
    )
)

# Utility functions
char_to_one_hot = lambda x: ONE_HOT_CHARS[CHARS.index(x)]

# Base route to demonstrate correct usage
@app.route('/')
def base():
    return 'Usage: {url}/add/{first_number}/{second_number}'

# Return the predicted sum of two integers
@app.route('/add/<int:x>/<int:y>')
def add(x, y):
    input_string = '{}+{}'.format(x, y)
    input_string += ' ' * (MAX_INPUT_LEN - len(input_string))
    if REVERSE:
        input_string = input_string[::-1]

    input_array = list(map(char_to_one_hot, list(input_string)))
    input_tensor = tf.convert_to_tensor([input_array])
    output_tensor = model(input_tensor)

    prediction = tf.argmax(output_tensor[0], axis=1, output_type=tf.int32)
    prediction_string = ''.join(list(map(lambda x: CHARS[x], list(prediction.numpy())))).strip()
    return {
        "modelInput": input_string,
        "prediction": int(prediction_string)
    }
