@echo off
npm run build&&cd dist&&echo 'niklasluehr.com' > CNAME&&copy index.html 404.html&&git init&&git add -A&&git commit -m "[deployment from script]"&&git push -f https://github.com/niklasluehr/portfolio.git master:gh-pages&&cd ..