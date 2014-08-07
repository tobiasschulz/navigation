#!/bin/bash

for x in /data/Dropbox/Apps/My\ Cars*/*
do
	export date=$(LC_ALL=C stat "$x" | awk '/Access/{print $2 $3}' | tail -n1  | tr -d'' '-' | cut -d"." -f1 | tr -d'' ':')
	mv "$x" MyCars/mycar_data_$date.xml
done
git add --all MyCars
git commit -a -m "latest my cars backup"
