#!/bin/bash

# echo $(dirname $(realpath ${BASH_SOURCE[0]}))

s=$(realpath ${BASH_SOURCE[0]})
d=$(dirname $(realpath ${BASH_SOURCE[0]}))
ds=$(find $d -type d)

# echo s=$s, d=$d ds=$ds

gen(){
  if [ -f "header.md" ]; then
    cat header.md > README.md
  else
    cat ${d}/header.md > README.md
  fi
  l=$(find . -type d | sed -e 's%^./%%' -e '/^.$/d')
  for li in $l; do
    # echo "# [${li}](${li}/index.html)" >> README.md
    echo "${li}" | awk -F "/" 'BEGIN{n=0} { for(i=1;i<=NF;i++){ printf "#"; if(i==NF) print " ["$i"]""("$0"/index.html)"; } }' >> README.md
  done
  markmap --no-open README.md -o index.html
}

for di in $ds; do
  ( cd $di; \
    gen\
    cd - \
  ) #> /dev/null 2>&1
done

