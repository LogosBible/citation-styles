#!/bin/sh

SCRIPT_DIR=`dirname "$0"`
MAKE_JSON="$SCRIPT_DIR/../scripts/makejson.py"
OUTPUT_DIR="$1"

pushd "$SCRIPT_DIR/.."

for STYLE in apa bibtex chicago-fullnote-bibliography din-1505-2 harvard1 modern-language-association refer-bibix ris society-of-biblical-literature-fullnote-bibliography turabian-fullnote-bibliography american-anthropological-association modern-humanities-research-association american-political-science-association american-sociological-association unified-style-linguistics pontifical-biblical-institute pontifical-athenaeum-regina-apostolorum
do
    echo "Converting $STYLE from CSL to JSON"
    python "$MAKE_JSON" $STYLE.csl > $STYLE.json
    SIZE_CSL=`ls -l $STYLE.csl | awk '{ print $5 }'`
    SIZE_JSON=`ls -l $STYLE.json | awk '{ print $5 }'`
    echo "File size changed from $SIZE_CSL to $SIZE_JSON"
    if [[ "$OUTPUT_DIR" !=  "" ]]; then
    	echo "Copying $STYLE.json to $OUTPUT_DIR"
    	cp $STYLE.json "$OUTPUT_DIR"
    fi
done

popd
