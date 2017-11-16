# Use Alpine Linux
FROM alpine

# Maintainer
# MAINTAINER Muhammad Zamroni <halo@matriphe.com>

# Environments
ENV TIMEZONE            Asia/Shanghai

# Let's roll
RUN	apk update && \
	apk upgrade && \
	apk add --update tzdata && \
	cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
	echo "${TIMEZONE}" > /etc/timezone && \
	apk add --update \
		nginx && \
    
    # Cleaning up
	mkdir /www && \
	apk del tzdata && \
	rm -rf /var/cache/apk/*

# Set Workdir
WORKDIR /www

# Expose volumes
VOLUME ["/www"]

# Expose ports
EXPOSE 80

# Entry point
CMD ["nginx", "-g", "daemon off;"]