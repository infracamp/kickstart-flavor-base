#!/bin/bash


SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`


IMAGES=( $( cat $SCRIPTPATH/images-to-check.csv ) )
REVS=( testing latest 1.2.9 release-1.2.8 release-1.2.6 )

JSON_OUT="{\"_last_update\": \"$(date --iso-8601=seconds)\"";

for image in "${IMAGES[@]}"
do
    echo -n "- checking security for $image.. "



    SECFILE=$SCRIPTPATH/vul/${image//[\:\-\/]/-}.txt

    docker pull $image > /dev/null
    docker run -it --rm --entrypoint "/bin/bash" $image -c 'apt-get -qq update && apt-get upgrade -s | grep -i security | grep -i inst' > $SECFILE

    if [[ `cat $SECFILE | wc -l` = 0 ]]
    then
        rm $SECFILE
        echo " [skip - no updates]"
        state="secure"
    else
        echo " [SECURITY UPDATES AVAILABLE - UPDATE REQUIRED!]"
        state="insecure"
    fi


    JSON_OUT="$JSON_OUT, \"$image\":\"$state\""

done

JSON_OUT="$JSON_OUT}";
echo $JSON_OUT > $SCRIPTPATH/security.json

