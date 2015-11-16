#!/bin/sh

# Set this to your Code folder
CODE_DIR="$HOME/Code50"


SCRIPT_DIR=`dirname "$0"`
MAKE_JSON="$SCRIPT_DIR/../scripts/makejson.py"
DEFAULT_OUTPUT_DIR="$CODE_DIR/DigitalLibrary/src/Libronix.DigitalLibrary/CitationStyles/"
OUTPUT_DIR=${1:-$DEFAULT_OUTPUT_DIR}

if [[ -z $OUTPUT_DIR || ! -d $OUTPUT_DIR ]]
then
	echo "Please specify a folder to copy the .json output files to."
	echo "e.g. $OUTPUT_DIR"
	exit 1;
fi

pushd "$SCRIPT_DIR/.."

for STYLE in apa bibtex chicago-fullnote-bibliography din-1505-2 harvard1 modern-language-association refer-bibix ris society-of-biblical-literature-fullnote-bibliography society-of-biblical-literature-fullnote-bibliography-1st-ed turabian-fullnote-bibliography american-anthropological-association modern-humanities-research-association american-political-science-association american-sociological-association unified-style-linguistics pontifical-biblical-institute pontifical-athenaeum-regina-apostolorum christian-writers-manual-of-style
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

GIT_UPSTREAM_REVISION=`git rev-parse upstream/master`
GIT_THIRDPARTY_REVISION=`git rev-parse master`
echo "CSL JSON files generated from upstream/master revision $GIT_UPSTREAM_REVISION, master revision $GIT_THIRDPARTY_REVISION on `date`" | tee "$OUTPUT_DIR/csl_revision_info.txt"
popd
