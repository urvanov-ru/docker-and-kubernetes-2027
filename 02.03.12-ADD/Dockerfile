FROM httpd:2.4.65
ADD https://github.com/urvanov-ru/html5games.git#docker-and-kubernetes-2027:html5lines /usr/local/apache2/htdocs/
RUN ["mv", "/usr/local/apache2/htdocs/html5lines.html", "/usr/local/apache2/htdocs/index.html"]
