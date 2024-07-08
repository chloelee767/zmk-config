#!/usr/bin/env bash
#
set -eou pipefail

UF2_NAME=""

while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -n|--name)
            UF2_NAME="$2"
            shift
            shift
            ;;
        *)
            echo "Invalid argument: $key"
            exit 1
            ;;
    esac
done

# Validate args
if [ -z "$UF2_NAME" ]; then
    echo "Name for firmware/build directory is required"
    exit 1
fi

# Script
BUILD_DIR="build/${UF2_NAME}"

rm ${UF2_NAME}.uf2 &> /dev/null || true

echo "Rebuilding from directory: $BUILD_DIR"
echo "UF2 file: $UF2_NAME.uf2"
echo ""

west zephyr-export

west build -d ${BUILD_DIR}

cp ${BUILD_DIR}/zephyr/zmk.uf2 ${UF2_NAME}.uf2
