---
markmap:
  color:
    - blue
  initialExpandLevel: 4
  # other options
---

# [go back](../index.html)
# find
## .c / .h files for cscope.files
```bash
find . -name "*.[ch]" -exec realpath {} \;
find . -name "*.[ch]" | xargs realpath 
```

