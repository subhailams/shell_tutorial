#!/bin/bash

for arg in "$@"
    do
        index=$(echo $arg | cut -f1 -d=)
        val=$(echo $arg | cut -f2 -d=)
        
        # swtich case 
        case $index in
        epoch) intial_epoch=$val;;

        batch_size) initial_batch_size=$val;;

        *)
        esac
    done

echo "Initial Epoch: $intial_epoch"
echo "Initial Batch Size: $initial_batch_size"