#!/bin/bash

python3 -m venv weirdAAL
source weirdAAL/bin/activate
pip3 install -r requirements.txt
python3 create_dbs.py