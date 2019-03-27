#!/bin/bash

IMAGE=kickstart-flavor-base
REVS=( testing latest release-1.2.8 release-1.2.6 )

for rev in "${REVS[@]}"
do
    echo -n "- checking security for $IMAGE:$rev.. "

    SECFILE=sec-$IMAGE\:$rev.txt

    docker run -it --entrypoint "/bin/bash"  infracamp/$IMAGE:$rev -c 'apt-get -qq update && apt-get upgrade -s | grep -i security' > $SECFILE

    if [[ `cat $SECFILE | wc -l` = 0 ]]
    then
        rm $SECFILE
        echo " [skip - no updates]"
    else
        echo " [SECURITY UPDATES AVAILABLE - UPDATE REQUIRED!]"
    fi
    #>
done

