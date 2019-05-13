#!/bin/bash

rm -f telnet.out
instances=30
port=9900
endport=$((port+instances-1))

echo "Creating log..."
for i in {1..10} ; do
        port=9900
        while [ $port -le $endport ] ; do
                echo "Creating log for server on port $port"
                (echo -e 'stats\nquit'; sleep 1) | telnet localhost $port &>> telnet.out
                port=$((port+1))
        done
        echo ""
        grep "cuckoo_insert " telnet.out | tail -n 30
        sleep 60
done
#grep "cuckoo_insert " telnet.out >> stats.out

