#!/usr/bin/python

import os
for fn in os.listdir('/opt/fidm/data/in'):
    if os.path.isfile(fn):
      print fn

