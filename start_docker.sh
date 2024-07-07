#!/usr/bin/env bash

CMD=""
if [[ $# -gt 0 ]]; then
    CMD="$@"
else
    CMD="/bin/bash"
fi

docker run -it -v $(pwd):/home/zmk-config -w /home/zmk-config zmkfirmware/zmk-build-arm:3.5-branch $CMD
