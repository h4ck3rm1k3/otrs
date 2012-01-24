
#create a manifest file
#find > MANIFEST

# get all the sopms that contain the files in the mainfest, the rest of them are not interesting
grep -e'\<File '  ../*/*.sopm | grep -v '$File' > sopms_to_patch.txt

# just take one file, 
perl ./trypatch.pl sopms_to_patch.txt