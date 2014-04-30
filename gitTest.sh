ignoredList=`mktemp`
fullList=`mktemp`

git ls-files -coiz --exclude-per-directory=.testignore test | xargs -0 -L1 echo > $ignoredList
find test -type f -print0 | xargs -0 -L1 echo > $fullList

sort $ignoredList $fullList | uniq -u > files.git

rm $ignoredList
rm $fullList
