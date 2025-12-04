# syntax=docker/dockerfile:1
FROM httpd:2.4.65
COPY ./ssi-enabled-httpd.conf /usr/local/apache2/conf/httpd.conf
COPY --exclude=*.md --exclude=template.shtml ./public-html/ /usr/local/apache2/htdocs/
