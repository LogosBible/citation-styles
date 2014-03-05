Logos Desktop Citation Styles Readme
==============================

Embedding styles in Logos Desktop
---------------------------------

The CSL files are converted to JSON then embedded as resources in the ```Libronix.DigitalLibrary.dll``` assembly.

The files are converted with the makeJSON.py which is found under the scripts folder. The original version of the ```makeJSON.py``` file included in the [citeproc-js source](https://bitbucket.org/fbennett/citeproc-js/src/f53167766c75e879f77f5190a57f3c33959b54eb/tools/makejson.py?at=default)

There is an example shell script, ```convertJSON.sh```, which can be used to perform the conversion under the scripts folder as well.

The files are converted from CSL to JSON and then copied into the ```Libronix.DigitalLibrary/CitationStyles``` folder. 

Usage:
```
	cd citation-styles/scripts
	sh convertJSON.sh "<path_to_Libronix.DigitalLibrary/CitationStyles>"
```

Localization
------------
The locale files for the supported langaugages are obtained from [https://github.com/citation-style-language/locales](https://github.com/citation-style-language/locales). When they need to be updated, they should be copied into the ```Libronix.DigitalLibrary/Citations/Locales``` folder. New locale files should be added to the ```Libronix.DigitalLibrary.csproj``` file as EmbeddedResources.



