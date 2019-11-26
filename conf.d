server {
    listen 80;
    # listen [::]:80;
    
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
        root /usr/share/nginx/html;
        index index.php index.html index.htm;
    }

    # index.* fallback
    location / {
	try_files $uri $uri/ =404;
    }
	
    # handle .php
    location ~ \.php$ {
        include snippets/fastcgi-php.conf
        fastcgi_pass unix:/run/php/php7.3-fpm.sock
    }
}
