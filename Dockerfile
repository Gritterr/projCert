# PHP website on the course's base image: Ubuntu 18.04 with Apache 2.4 and PHP 7.0.
FROM devopsedu/webapp

# The base image ships a placeholder index.html, which Apache would serve
# instead of the site's index.php.
RUN rm -f /var/www/html/index.html

COPY website/ /var/www/html/

EXPOSE 80

# The base image's default command is /bin/bash, which exits immediately in a
# detached container. Run Apache in the foreground so the container stays up.
CMD ["apachectl", "-D", "FOREGROUND"]
