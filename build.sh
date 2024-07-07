#!/usr/bin/env bash

set -eou pipefail

SHIELD_NAME=""
UF2_NAME=""

# Parse arguments
while [[ $# -gt 0 ]]
do
    key="$1"
    case $key in
        -s|--shield)
            SHIELD_NAME="$2"
            shift
            shift
            ;;
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
if [ -z "$SHIELD_NAME" ]; then
    echo "Shield name is required"
    exit 1
fi
if [ -z "$UF2_NAME" ]; then
    echo "Name for firmware/build directory is required"
    exit 1
fi


# Script
BUILD_DIR="build/${UF2_NAME}"

rm ${UF2_NAME}.uf2 &> /dev/null || true

echo "Building for shield: $SHIELD_NAME"
echo "UF2 file: $UF2_NAME.uf2"
echo "Build directory: $BUILD_DIR"
echo ""

west zephyr-export

west build -s zmk/app -d ${BUILD_DIR} -b nice_nano_v2 -- -DZMK_CONFIG=/home/zmk-config/config -DSHIELD=${SHIELD_NAME}

cp ${BUILD_DIR}/zephyr/zmk.uf2 ${UF2_NAME}.uf2
