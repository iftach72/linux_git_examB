grep -c pattern man_sed.txt >> README.md
## Command-Line Options >> README.md
grep -e '^-' man_sed.txt  >> README.md
sed -n '/For example/,/\./p' man_sed.txt >> README.md
grep -n reg man_sed.txt >> README.md
