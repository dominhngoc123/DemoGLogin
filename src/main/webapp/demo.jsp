<%-- 
    Document   : demo
    Created on : Oct 1, 2020, 4:55:33 PM
    Author     : Ngoc Do Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo</title>
        <meta name="google-signin-client_id" content="861931736148-2ocuuknf09i59bdndlhr8i48f0u1joni.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script> 
    </head>
    <script>
        function signOut() {
            var check = confirm("Do you want to log out?");
            if (check)
            {
                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    window.location='index.jsp';
                });
            }
        }

        function onLoad() {
            gapi.load('auth2', function () {
                gapi.auth2.init();
            });
        }
    </script>
    <body>
        <h1>Welcome, <s:property value="#session.username" /></h1>
        <a href="#" onclick="signOut();">Sign out</a>
    </body>
</html>
