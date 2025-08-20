#!/bin/bash
find . -type d ! -name . ! -path "*.git*" | xargs -I {} cp -a gen_index.sh {}/
