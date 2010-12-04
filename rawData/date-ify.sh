#!/bin/sh

dir=withDate

mkdir $dir
for i in *
do
	cp $i $dir/`date -r $i +%m.%d_%Hh%Mm%Ss_`$i 
done

