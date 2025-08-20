---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# ctags
## find
- Linux
  - `find . -name "*.[ch]" -exec realpath {} \;`
- macOS
  - `find . -iname "*.[ch]" -exec realpath {} \;`
## tags
- `ctags -Rb`
- `ctags -L cscope.files`
