FROM ubuntu:latest
MAINTAINER vikashashoke@gmail.com

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y \
        apache2 \
        unzip \
        wget

# Download and add files
RUN wget -O /var/www/html/photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip

# Set working directory
WORKDIR /var/www/html/

# Extract files and clean up
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose port 80
EXPOSE 80

# Start Apache HTTP server
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

 
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   
