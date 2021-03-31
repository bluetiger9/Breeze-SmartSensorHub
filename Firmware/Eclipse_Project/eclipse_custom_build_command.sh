#!/usr/bin/bash
##!/usr/bin/env bash

export PATH=/usr/share/gcc-arm-none-eabi-10-2020-q4-major/bin/:$PATH
export SYMBIFLOW_DIR=/home/bluetiger/Dev/QuickLogic/Symbiflow

export PATH="/home/bluetiger/Dev/QuickLogic/symbiflow-arch-defs/build/env/conda/bin/:$PATH"

cd $1
echo "Symbiflow dir: " $SYMBIFLOW_DIR
export PATH="$SYMBIFLOW_DIR/quicklogic-arch-defs/bin:$SYMBIFLOW_DIR/quicklogic-arch-defs/bin/python:$PATH"
source "$SYMBIFLOW_DIR/conda/etc/profile.d/conda.sh"
conda activate
make $2
