#!/bin/bash

#Search String SS is the first argument in the inputs
SS=$1
#the File we're parsing through
FILE=$(readlink -f $2)

LIF=$(cat -n ${FILE}|tail -n 1|awk '{print $1}'|bc)
LX=($(grep -n "${SS}" "${FILE}"|sed -e 's/\:..*//g'))
L2L=($(echo "${LX[1]} - ${LX[0]} + 1"|bc))
TAILLINES=$(echo "${LIF}-${LX[0]}+1"|bc)
echo Lines in file: ${LIF}
echo ${LX[1]} - ${LX[0]} = ${L2L}
tail -n "${TAILLINES}" ${FILE}|head -n ${L2L}|grep -i "#end\|#if\|#elif"
