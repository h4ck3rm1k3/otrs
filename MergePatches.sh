
echo param is $1, to filter the packages with that name
#create a manifest file
#find > MANIFEST

# get all the sopms that contain the files in the mainfest, the rest of them are not interesting
grep -H -e'\<File '  ../../private/$1/*.sopm | grep -v '$File' > sopms_to_patch.txt

# just take one file, 
perl ./trypatch.pl sopms_to_patch.txt