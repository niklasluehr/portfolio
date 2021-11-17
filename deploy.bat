@echo off
npm run build&&cd dist&&git init&&git add -A&&git commit -m "[deployment from script]"&&git push -f https://github.com/niklasluehr/portfolio.git master:gh-pages&&cd ..