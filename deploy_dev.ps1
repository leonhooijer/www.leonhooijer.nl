npm install -g svgo
npm install -g minify

minify about.html | Out-File -Encoding utf8 -FilePath .\about.min.html
minify blog.html | Out-File -Encoding utf8 -FilePath .\blog.min.html
minify index.html | Out-File -Encoding utf8 -FilePath .\index.min.html
minify style.css | Out-File -Encoding utf8 -FilePath .\style.min.css
svgo img/logo.svg -o img/logo.min.svg

Copy-Item about.html about.orig.html
Copy-Item about.min.html about.html
Copy-Item blog.html blog.orig.html
Copy-Item blog.min.html blog.html
Copy-Item index.html index.orig.html
Copy-Item index.min.html index.html

docker pull nginx
docker build -t leonhooijer .
docker stop leonhooijer
docker rm leonhooijer
docker run --name leonhooijer -d -p 81:80/tcp leonhooijer 

Copy-Item about.orig.html about.html
Copy-Item blog.orig.html blog.html
Copy-Item index.orig.html index.html

Remove-Item style.min.css
Remove-Item about.min.html
Remove-Item about.orig.html
Remove-Item blog.min.html
Remove-Item blog.orig.html
Remove-Item index.min.html
Remove-Item index.orig.html
Remove-Item img/logo.min.svg
