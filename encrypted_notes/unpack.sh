
NOTE_DIR=my_notes

PACK_NAME=my_notes.tar.gz
ZIP_NAME=my_notes.zip

PACK_NAME_GPG=${PACK_NAME}.gpg
ZIP_NAME_GPG=${ZIP_NAME}.gpg

BASE64_NAME1=my_notes.g.z
BASE64_NAME2=my_notes.z.z

TARGET_DIR1=my_notes_gz
TARGET_DIR2=my_notes_zip

TARGET_DIR1=$NOTE_DIR
TARGET_DIR2=$NOTE_DIR

if [ -f $BASE64_NAME1 ]; then
	base64 -d $BASE64_NAME1 > $PACK_NAME_GPG
fi

if [ -f $PACK_NAME_GPG ]; then
	gpg -o $PACK_NAME -d $PACK_NAME_GPG
	mkdir -p $TARGET_DIR1 && tar -xvf $PACK_NAME -C $TARGET_DIR1 --strip-component=1
	rm $PACK_NAME_GPG
	rm $PACK_NAME
fi

if [ -f $BASE64_NAME2 ]; then
	base64 -d $BASE64_NAME2 > $ZIP_NAME_GPG
fi

if [ -f $ZIP_NAME_GPG ]; then
	gpg -o $ZIP_NAME -d $ZIP_NAME_GPG
	unzip $ZIP_NAME -d $TARGET_DIR2
	mv $TARGET_DIR2/$NOTE_DIR/* $TARGET_DIR2/ -f && rmdir $TARGET_DIR2/$NOTE_DIR
	rm $ZIP_NAME_GPG
	rm $ZIP_NAME
fi
