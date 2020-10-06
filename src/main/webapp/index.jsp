<%-- 
    Document   : index
    Created on : Oct 1, 2020, 3:47:03 PM
    Author     : Ngoc Do Minh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Demo</title>
        <meta name="google-signin-client_id" content="861931736148-om7o4kovv2ho79tnfuit1m1ml1eqlqbr.apps.googleusercontent.com">
        <!--===============================================================================================-->
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="CSS/LoginPageCSS/LoginPage.css"/>
    </head>
    <script type="text/javascript">
        function onSignIn(googleUser)
        {
            var profile = googleUser.getBasicProfile();
            var name = profile.getName();
            var email = profile.getEmail();
//            alert("login.action?email=" + email + "&username=" + name);
            location.assign('login.action?email=' + email + '&username=' + name);
        }
    </script>
    <body class="login">
        <img class="logo" height="80" width="208" src="https://btec.fpt.edu.vn/wp-content/uploads/2017/12/2017-Btec-01-354.png" alt="BTEC Forum">
        <form class="vertical-form sign-in" id="sign-in" action="#" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="&#10003;"><input type="hidden" name="authenticity_token" value="P7p2cFAxLUBRON14P9JNyy6tSrahF1SsiHq+tp97Sho9mZvKdjyGKuV3B1e9d9gq4mCD85FCvTsbW54ayhMw9g=="><input type="hidden" name="i" id="i">
            <input type="hidden" name="browser" id="browser" value="Chrome">
            <input type="hidden" name="operating_system" id="operating_system" value="Windows 10 64-bit">
            <input type="hidden" name="timezone_offset" id="timezone_offset" value="-60">
            <legend>Log In</legend>
            <input type="email" placeholder="Email address" label="false" spellcheck="false" class="is-sensitive" value="" name="user[email]" id="user_email" required="true" autocomplete="off">
            <input placeholder="Password" label="false" autocomplete="off" class="is-sensitive" type="password" name="user[password]" id="user_password" required="true" autocomplete="off">
            <input type="submit" name="commit" value="Log In">
            <div class="btnGSignIn" style="margin-top: 20px;">
                <div class="g-signin2" data-width="390" data-height="50" data-longtitle="true" data-onsuccess="onSignIn"></div>
            </div>
            <p><a href="/forgot_password/new">Forgot password?</a></p>
        </form>
<!--        <div class="footer">
            <p>
                Don't have an account?
                <a href="#">Sign Up</a>
            </p>
        </div>-->
    </body>
</html>

