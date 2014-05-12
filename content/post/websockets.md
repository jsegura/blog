---
title: "Websockets"
description: "What are websockets?"
date: "2014-05-13"
categories:
  - "web"
tags:
  - "websockets"
---


A **Websocket** is a protocol that provides dual-channel communication between web servers and web browsers. It uses the *HTTP* protocol as a handshake but it has its own *TCP-based* protocol.
This is useful for enabling a better interaction between your web users, it's a real-timeand once the request is started by the client, the server can send information over the websocket without the requisition from the client.

A demo site [Echo test](http://www.websocket.org/echo.html) is available using ```ws://echo.websocket.org```.

We can see how the communication is started looking at the network traffic using your preferred tool (in my case *Developer tools* from Chrome is more than enough).

<br />

This is the workflow in the Echo test example:

* Client initiaties the connection:

```http
Cache-Control:no-cache
Connection:Upgrade
Cookie:__utma=9925811.560021929.1398795440.1398795440.1399893753.2; __utmb=9925811.2.10.1399893753; __utmc=9925811; __utmz=9925811.1399893753.2.2.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided)
Host:echo.websocket.org
Origin:http://www.websocket.org
Pragma:no-cache
Sec-WebSocket-Extensions:permessage-deflate; client_max_window_bits, x-webkit-deflate-frame
Sec-WebSocket-Key:j6MZV0bC4TBsmQHmnlsEyw==
Sec-WebSocket-Version:13
Upgrade:websocket
User-Agent:Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.131 Safari/537.36
```

* Server response:

```http
Access-Control-Allow-Credentials:true
Access-Control-Allow-Headers:x-websocket-protocol
Access-Control-Allow-Headers:x-websocket-version
Access-Control-Allow-Headers:x-websocket-extensions
Access-Control-Allow-Headers:authorization
Access-Control-Allow-Headers:content-type
Access-Control-Allow-Origin:http://www.websocket.org
Connection:Upgrade
Date:Mon, 12 May 2014 11:25:46 GMT
Sec-WebSocket-Accept:Psgr6cQUXMgP1tz5StleqjOWtpE=
Server:Kaazing Gateway
Upgrade:WebSocket
```


After that we have a fully working websocket. The browser has a permanent connection to the webserver as we can see using netstat:

```bash
% nslookup echo.websocket.org
Server:		192.168.1.1
Address:	192.168.1.1#53

Non-authoritative answer:
echo.websocket.org	canonical name = echo-kaazing.websocket.org.
echo-kaazing.websocket.org	canonical name = websocket.org.
Name:	websocket.org
Address: 174.129.224.73

% netstat -tn | grep 174.129.224.73
tcp4       0      0  192.168.1.7.50195      174.129.224.73.80      ESTABLISHED
```

If we want to use websockets in our javascript application we can use the example of [websocket](http://www.websocket.org/aboutwebsocket.html):

```javascript
// Code from websocket.org
var myWebSocket = new WebSocket("ws://www.websockets.org"); 
myWebSocket.onopen = function(evt) { alert("Connection open ..."); };
myWebSocket.onmessage = function(evt) { alert( "Received Message: " + evt.data); }; 
myWebSocket.onclose = function(evt) { alert("Connection closed."); }; 
myWebSocket.send("Hello WebSockets!"); myWebSocket.close();
```

