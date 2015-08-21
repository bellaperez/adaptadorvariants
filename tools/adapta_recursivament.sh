#!/bin/bash

cd ca
FITXERPO=`find * -type f -name "*.po"`
cd ..

for PO in $FITXERPO
do
   # Extraiem el nom de directori i el nom de fitxer
   DIR=`dirname $PO`
   FITX=`basename $PO`

   # Si no existeix el directori, el creem
  if [ ! -d ca@valencia/$DIR ]; then
      mkdir -p ca@valencia/$DIR
  fi

  # Executem la conversió del fitxer PO
  ./src2valencia-moz.sed < ca/$DIR/$FITX > ca@valencia/$DIR/$FITX
done