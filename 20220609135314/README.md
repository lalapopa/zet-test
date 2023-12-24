# Some notes

DIR="/home/project/Data Files/"
if [ -d "$DIR" ]; then
echo "'$DIR' found and now copying files, please wait ..."
else
echo "Warning: '$DIR' NOT found."
fi
