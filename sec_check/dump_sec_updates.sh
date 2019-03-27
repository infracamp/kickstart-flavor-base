#!/bin/bash


SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`


IMAGE=kickstart-flavor-base
REVS=( testing latest release-1.2.8 release-1.2.6 )

JSON_OUT="{\"last_update\": \"$(date --iso-8601=seconds)\",\"image\": \"$IMAGE\"";

for rev in "${REVS[@]}"
do
    echo -n "- checking security for $IMAGE:$rev.. "

    SECFILE=$SCRIPTPATH/sec-$IMAGE\:$rev.txt

    docker run -it --entrypoint "/bin/bash"  infracamp/$IMAGE:$rev -c 'apt-get -qq update && apt-get upgrade -s | grep -i security' > $SECFILE

    if [[ `cat $SECFILE | wc -l` = 0 ]]
    then
        rm $SECFILE
        echo " [skip - no updates]"
        state="secure"
    else
        echo " [SECURITY UPDATES AVAILABLE - UPDATE REQUIRED!]"
        state="insecure"
    fi

    JSON_OUT="$JSON_OUT, \"$rev\":\"$state\""

done

JSON_OUT="$JSON_OUT}";
echo $JSON_OUT > $SCRIPTPATH/security.json

