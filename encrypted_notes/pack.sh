
NOTE_DIR=my_notes

PACK_NAME=my_notes.tar.gz
ZIP_NAME=my_notes.zip

PACK_NAME_GPG=${PACK_NAME}.gpg
ZIP_NAME_GPG=${ZIP_NAME}.gpg

BASE64_NAME1=my_notes.g.z
BASE64_NAME2=my_notes.z.z

tar -czvf $PACK_NAME $NOTE_DIR
gpg -er 'Ted Wang' $PACK_NAME
base64 $PACK_NAME_GPG > $BASE64_NAME1
rm $PACK_NAME_GPG
rm $PACK_NAME

#zip -r $ZIP_NAME $NOTE_DIR
#gpg -er 'Ted Wang' $ZIP_NAME
#base64 $ZIP_NAME_GPG > $BASE64_NAME2
#rm $ZIP_NAME_GPG
#rm $ZIP_NAME
