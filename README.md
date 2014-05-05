httpd.lol
=========

A minimal HTTP server written in [LOLCODE](http://lolcode.org).  Because programming languages.

Usage
-----

Check out and build the future branch of [lci](https://github.com/justinmeza/lci/tree/future).

    $ ./lci httpd.lol
    point your favorite HTTP-getter to http://127.0.0.1:13337/lol.html
    ...
    profit?


Example
-------

Here we're using Netcat, but browsers work just fine as well.

    $ ./lci httpd.lol &
    $ echo "GET /lol.html HTTP/1.1" | nc 127.0.0.1 13337
    CMD IZ GET /lol.html HTTP/1.1
    
    FIEL IZ lol.html
    FIEL FOUND!
    LEN IZ 74
    DATA IZ <html>
    <body><h1><blink>HAI, INTERWEBZ!!!1!!~</blink></h1></body>
    </html>
    
    REPLY IZ HTTP/1.1 200 OK
    Server: httpd.lol/0.1 (lci)
    Context-Type: text/html
    Content-Length: 74
    
    <html>
    <body><h1><blink>HAI, INTERWEBZ!!!1!!~</blink></h1></body>
    </html>
    
    
    HTTP/1.1 200 OK
    Server: httpd.lol/0.1 (lci)
    Context-Type: text/html
    Content-Length: 74
    
    <html>
    <body><h1><blink>HAI, INTERWEBZ!!!1!!~</blink></h1></body>
    </html>
