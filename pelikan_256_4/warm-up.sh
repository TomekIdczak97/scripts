
rm -f log/*
./bring-up.sh

nready=0
while [ $nready -lt 30 ]
do
    nready=$(grep -l "prefilling cuckoo" log/slimcache-*.log | wc -l)
    echo "$(date): $nready out of 30 servers are warmed up"
    sleep 10
done
