#!/bin/bash

# Training with various hyperparameters

my_epochs=5
my_batch_size=16
accuracy=0

# Run multiple trainings
valid=True
cnt=1
while [ $valid ]
    do
        adam_accuracy=$(python train.py --epochs $my_epochs --batch_size $my_batch_size --opt adam)
        sgd_accuracy=$(python train.py --epochs $my_epochs --batch_size $my_batch_size --opt sgd)
        ((cnt=cnt+1))
        ((my_batch_size=my_batch_size/2))
        echo $adam_accuracy
        echo $sgd_accuracy
        if [ $cnt -eq 5 ];
        then
        break
        fi
        echo
    done