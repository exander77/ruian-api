#!/usr/bin/env bash
RETURN=2
VENDORDIR="data/vendor"
mkdir -p "$VENDORDIR"
REPOID=$(date -d "$(date +%Y-%m-01) -1 day" +%Y%m%d)
FILE="${REPOID}_OB_ADR_csv.zip"
FILEPATH="$VENDORDIR/$FILE"
if [ ! -f "$FILEPATH" ]; then
    URL="http://vdp.cuzk.cz/vymenny_format/csv/$FILE"
    echo "Downloading $URL"
    wget "$URL" -O "$FILEPATH"
fi
REPODIR="data/vendor/$REPOID"
if [ ! -d "$REPODIR" ]; then
    mkdir "$REPODIR"
    unzip $FILEPATH -d "$REPODIR"
    for i in data/vendor/"$REPOID"/CSV/*.csv; do
        recode windows-1250..utf-8 "$i"
    done
    RETURN=0
fi
rm ruian
ln -s "data/vendor/$REPOID/CSV/" ruian
exit $RETURN
