#!/usr/bin/env python
# Simple script for remapping snipMate plugin's default trigger key from tab
# to other, in order to not mess up with neocomplcache plugin's functionality.
# Note: It doesn't work for all keys.
from __future__ import with_statement

import os
import shutil
import fnmatch

# new trigger key
TRIGGER_KEY = '*'
# your snipmate directory location
SNIPMATE_DIR = os.getenv('HOME') + '/.vim/bundle/snipmate.vim/'

files = []
for root, dirnames, filenames in os.walk(SNIPMATE_DIR):
    for filename in fnmatch.filter(filenames, '*.vim'):
        files.append(os.path.join(root, filename))

for a_file in files:
    tmp_file = a_file + '~'
    with open(a_file, mode='r') as f1:
        with open(tmp_file, mode="w") as f2:
            content = f1.read()
            content = content.replace('<tab>', TRIGGER_KEY)
            content = content.replace('<s-tab>', '<s-{0}>'.format(TRIGGER_KEY))
            f2.write(content)
    shutil.move(tmp_file, a_file)
