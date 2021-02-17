# first neural network with keras tutorial

import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
import argparse
from numpy import loadtxt

parser = argparse.ArgumentParser(
        description='Diabetes prediction')
parser.add_argument('--batch_size',
                        default=16,type=int,
                        help="A hyperparameter defines the number of samples that will be propagated through the network.")
parser.add_argument('--epochs',
                        default=5,type=int,
                        help="The iteration number of training")
parser.add_argument('--opt',
                        default="adam",type=str,
                        help="Optimizer")
args = parser.parse_args()

# load the dataset
dataset = loadtxt('pima-indians-diabetes.csv', delimiter=',')

# split into input (X) and output (y) variables
X = dataset[:,0:8]
y = dataset[:,8]

# define parameters
epochs = args.epochs
batch_size = args.batch_size
optimizer = args.opt

# define the keras model
model = Sequential()
model.add(Dense(12, input_dim=8, activation='relu'))
model.add(Dense(8, activation='relu'))
model.add(Dense(1, activation='sigmoid'))

# compile the keras model
model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

# fit the keras model on the dataset
model.fit(X, y, epochs=epochs, batch_size=batch_size)

# evaluate the keras model
_, accuracy = model.evaluate(X, y)
print()
print("Epochs:",epochs, "Batch Size:",batch_size, "Optimizer:",optimizer,'Accuracy: %.2f' % (accuracy*100))
print()