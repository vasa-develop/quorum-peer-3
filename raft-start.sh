#!/bin/bash
set -u
set -e

mkdir -p qdata/logs
echo "[*] Starting Constellation nodes"
./constellation-start.sh

echo "[*] Starting Ethereum nodes"
set -v
ARGS="--nodiscover --raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"
PRIVATE_CONFIG=qdata/c4/tm.ipc nohup geth --datadir qdata/dd4 $ARGS --permissioned --raftport 50404 --rpcport 22003 --port 21003 2>>qdata/logs/4.log &
PRIVATE_CONFIG=qdata/c5/tm.ipc nohup geth --datadir qdata/dd5 $ARGS --raftport 50405 --rpcport 22004 --port 21004 2>>qdata/logs/5.log &
PRIVATE_CONFIG=qdata/c6/tm.ipc nohup geth --datadir qdata/dd6 $ARGS --raftport 50406 --rpcport 22005 --port 21005 2>>qdata/logs/6.log &
PRIVATE_CONFIG=qdata/c7/tm.ipc nohup geth --datadir qdata/dd7 $ARGS --raftport 50407 --rpcport 22006 --port 21006 2>>qdata/logs/7.log &
set +v

echo
echo "All nodes configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd1/geth.ipc' to attach to the first Geth node."
echo "To test sending a private transaction from Node 3 to Node 7, run './runscript.sh script1.js'"
