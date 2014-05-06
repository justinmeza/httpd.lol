OBTW
    httpd.lol -- a minimal HTTP server written in LOLCODE
    example:
        ./lci httpd.lol
        point your favorite HTTP-getter to http://127.0.0.1:13337/lol.html
        ...
        profit?
    by Justin J. Meza, 2014
TLDR
HAI 1.4
    CAN HAS STDIO?
    CAN HAS SOCKS?
    CAN HAS STRING?

    HOW IZ I parse YR header
        I HAS A len ITZ I IZ STRING'Z LEN YR header MKAY
        I HAS A readin ITZ FAIL
        I HAS A file ITZ ""
        IM IN YR loop UPPIN YR index TIL BOTH SAEM index AN len
            I HAS A char ITZ I IZ STRING'Z AT YR header AN YR index MKAY
            BOTH OF BOTH SAEM char AN " " AN readin
            O RLY?
                YA RLY, FOUND YR file
            OIC
            readin, O RLY?, YA RLY, file R SMOOSH file AN char MKAY, OIC
            BOTH OF BOTH SAEM char AN "/" AN NOT readin
            O RLY?
                YA RLY, readin R WIN
            OIC
        IM OUTTA YR loop
        FOUND YR ""
    IF U SAY SO

    BTW bind to a local port
    I HAS A sock
    sock R I IZ SOCKS'Z BIND YR "127.0.0.1" AN YR 13337 MKAY

    IM IN YR loop
        BTW receive a connection
        I HAS A conn
        conn R I IZ SOCKS'Z LISTN YR sock MKAY

        BTW get a command
        I HAS A cmd
        cmd R I IZ SOCKS'Z GET YR sock AN YR conn AN YR 1024 MKAY
        VISIBLE "CMD IZ " AN cmd

        BTW parse the file name
        I HAS A name ITZ I IZ parse YR cmd MKAY
        VISIBLE "FIEL IZ " AN name

        I HAS A reply ITZ ""

        BTW get the file contents
        I HAS A file ITZ I IZ STDIO'Z OPEN YR name AN YR "r" MKAY
        I IZ STDIO'Z DIAF YR file MKAY, O RLY?
        YA RLY
            VISIBLE "FIEL NOT FOUND"
            reply R "HTTP/1.1 404 Not Found:3:):3:)"
        NO WAI
            VISIBLE "FIEL FOUND!"
            I HAS A data ITZ I IZ STDIO'Z LUK YR file AN YR 1024 MKAY
            I HAS A len ITZ I IZ STRING'Z LEN YR data MKAY
            I IZ STDIO'Z CLOSE YR file MKAY
            VISIBLE "LEN IZ " AN len
            VISIBLE "DATA IZ " AN data

            reply R SMOOSH "HTTP/1.1 200 OK:3:)"...
                    AN "Server: httpd.lol/0.1 (lci):3:)"...
                    AN "Context-Type: text/html:3:)"...
                    AN "Content-Length: :{len}:3:):3:)"...
                    AN ":{data}:3:)" MKAY
        OIC

	BTW serve it up
	VISIBLE "REPLY IZ " AN reply
	I IZ SOCKS'Z PUT YR sock AND YR conn AN YR reply MKAY

        BTW buh-bye
        I IZ SOCKS'Z CLOSE YR conn MKAY
    IM OUTTA YR loop
KTHXBYE
