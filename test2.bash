#!/bin/bash

string=`top | cut -d ":" -f 12`

echo $string
