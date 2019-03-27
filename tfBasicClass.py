import tensorflow as tf
from tensorflow import keras
import numpy as np
import matplotlib.pyplot as plt

fashion_mnist = keras.datasets.fashion_mnist
(train_images, train_labels), (test_images, test_labels) = fashion_mnist.load_data()



class_names = ['T-shirt/top', 'Trouser', 'Pullover', 'Dress', 'Coat', 'Sandal', 'Shirt', 'Sneaker', 'Bag', 'Ankle boot']



plt.figure()
plt.imshow(train_images[0])
plt.colorbar()
plt.grid(False)
plt.show()



train_images = train_images / 255.0

test_images = test_images / 255.0



plt.figure(figsize=(10,10))
for i in range(25):
    plt.subplot(5,5,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(train_images[i], cmap=plt.cm.binary)
    plt.xlabel(class_names[train_labels[i]])
plt.show()



#Actual Neural Network Starts Here

#Creates 1 hidden layer, 1 output layer, 1 layer that transforms input into a 28x28 long line instead of grid
model = keras.Sequential([
    keras.layers.Flatten(input_shape=(28, 28)),
    keras.layers.Dense(128, activation=tf.nn.relu),
    keras.layers.Dense(10, activation=tf.nn.softmax)
])

#Settings during model compilation
model.compile(optimizer='adam', 
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])

#Training Model
model.fit(train_images, train_labels, epochs=5)

#Testing Model
test_loss, test_acc = model.evaluate(test_images, test_labels)

print('Test accuracy:', test_acc)


#Predictions, multiple
predictions = model.predict(test_images)

predictions[0] #First prediction
np.argmax(predictions[0]) #Returns index of highest value/most confident prediction

#Predictions, singular
img = test_images[0]
img = (np.expand_dims(img,0))
predictions_single = model.predict(img)

np.argmax(predictions_single[0])