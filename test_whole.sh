set -x
if [ $# -eq 0 ]; then
    echo "Please provide the directory path as a parameter."
    exit 1
fi

# Get the directory path from the parameter
directory=$1
for video in "$directory"/*.mkv
do
    if [ -f "$video" ]; then
        echo $video
        # artifacts=("banding" "hitsh264")
        artifacts=("hitsh264")        
        for artifact in "${artifacts[@]}"
        do
            echo $artifact
            python2 VIDMAP_test_whole.py $artifact single $video
        done
    fi
done