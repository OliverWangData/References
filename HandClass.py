import tensorflow as tf
from tensorflow import keras
import numpy as np
import matplotlib.pyplot as plt

hand_mnist = keras.datasets.mnist
(train_data, train_labels), (test_data, test_labels) = hand_mnist.load_data()

plt.figure()
plt.imshow(train_data[0])
plt.show()

train_data = train_data/255
test_data = test_data/255

model = keras.Sequential([
    keras.layers.Flatten(input_shape = (28,28)),
    keras.layers.Dense(40, activation = tf.nn.sigmoid),
    keras.layers.Dense(10, activation = tf.nn.softmax)
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])

history = model.fit(train_data,train_labels, epochs = 10, validation_data=(test_data, test_labels))




history_dict = history.history

acc = history_dict['acc']
val_acc = history_dict['val_acc']
loss = history_dict['loss']
val_loss = history_dict['val_loss']

epochs = range(1, len(acc) + 1)

plt.plot(epochs, loss, 'bo', label='Training loss')
plt.plot(epochs, val_loss, 'b', label='Validation loss')
plt.title('Training and validation loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend()
plt.show()



predictions = model.predict(test_data)
accCount = 0

for i in range(len(test_labels)):
    if np.argmax(predictions[i]) == test_labels[i]:
        accCount+=1

print(accCount)
