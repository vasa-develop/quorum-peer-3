#!/bin/bash
PRIVATE_CONFIG=qdata/c7/tm.ipc geth --exec "loadScript(\"$1\")" attach ipc:qdata/dd7/geth.ipc
