#!/bin/sh

dir=withDate

mkdir $dir

n=0;
for i in `ls -rt`
do
	n=$(( $n + 1 ))
	nstr=$(printf '%03d' "$n")
	echo "$n $nstr ${nstr}"
	cp $i $dir/${nstr}-$i
done

exit


mkdir $dir
for i in *
do
	cp $i $dir/`date -r $i +%m.%d_%Hh%Mm%Ss_`$i 
done

