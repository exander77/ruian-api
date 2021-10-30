#!/usr/bin/env bash

echo $(pwd)

for i in ruian/*.csv; do
    recode windows-1250..utf-8 "$i"
done
