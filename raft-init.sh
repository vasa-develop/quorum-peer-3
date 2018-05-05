#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 4 (permissioned)"
mkdir -p qdata/dd4/{keystore,geth}
cp permissioned-nodes.json qdata/dd4/static-nodes.json
cp permissioned-nodes.json qdata/dd4/
cp keys/key4 qdata/dd4/keystore
cp raft/nodekey4 qdata/dd4/geth/nodekey
geth --datadir qdata/dd4 init genesis.json

echo "[*] Configuring node 5"
mkdir -p qdata/dd5/{keystore,geth}
cp permissioned-nodes.json qdata/dd5/static-nodes.json
cp keys/key5 qdata/dd5/keystore
cp raft/nodekey5 qdata/dd5/geth/nodekey
geth --datadir qdata/dd5 init genesis.json

echo "[*] Configuring node 6"
mkdir -p qdata/dd6/{keystore,geth}
cp permissioned-nodes.json qdata/dd6/static-nodes.json
cp raft/nodekey6 qdata/dd6/geth/nodekey
geth --datadir qdata/dd6 init genesis.json

echo "[*] Configuring node 7"
mkdir -p qdata/dd7/{keystore,geth}
cp permissioned-nodes.json qdata/dd7/static-nodes.json
cp raft/nodekey7 qdata/dd7/geth/nodekey
geth --datadir qdata/dd7 init genesis.json
