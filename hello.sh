#!/bin/bash

# Starting Here -> Comment
echo "Hello Shell!"

# Multi Line Comment
: '
Line 1 
Line 2 
'

## Operations

((area=5*5))
echo $area


##  Loop

counter=0 #Initialize
for (( counter=10; counter>0; counter-- ))
    do
        echo -n "$counter "
    done
echo


## Read from user


echo "Enter username"
read username
echo "Enter password"
read password

if [[ ( $username == "admin" && $password == "secret" ) ]]; then
    echo "valid user"
else
    echo "invalid user"
fi

## bash arguments

for arg in "$@"
    do
        index=$(echo $arg | cut -f1 -d=)
        val=$(echo $arg | cut -f2 -d=)

        # swtich case 
        case $index in
        X) x=$val;;

        Y) y=$val;;

        *)
        esac
    done

((result=x+y))
echo "X+Y = $result"