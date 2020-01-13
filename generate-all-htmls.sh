find ./ -type f -name '*.html' -delete

wlc-md-to-html  -i './**/*.md'  -e  -E3  --to './html'
