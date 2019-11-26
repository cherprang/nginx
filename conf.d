server {
    listen 80;
    listen [::]:80;
    
    # listen 443 ssl http2;
    # listen [::]:443 ssl http2;
    
    server_name _;
    
	# SSL
	# ssl_certificate _;
	# ssl_certificate_key _;
	# ssl_trusted_certificate _;
    
    # security
    # include security.conf;

    location / {
        root   /var/www/html;
        # index.*
        index index.php;
    }

	# index.* fallback
	location / {
		try_files $uri $uri/ =404;
	}

    #error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    # handle .php
    location ~ \.php$ {
        include snippets/fastcgi-php.conf
        fastcgi_pass unix:/run/php/php7.3-fpm.sock
    }
}
