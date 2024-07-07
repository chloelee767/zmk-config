#!/usr/bin/env bash

set -eou pipefail

# This fails if .west/ already exists
west init -l /home/zmk-config/config/

# This takes a while the first time
west update
