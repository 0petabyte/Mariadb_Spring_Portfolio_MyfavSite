<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   

<html>
<head>
	<meta charset="UTF-8">
	<title>jiung</title>
<style>

body {
  background-color: #F2F2F2;
  color: #606468;
  font: 400 0.875rem/1.5 "Open Sans", sans-serif;
  margin: 0;
  min-height: 100%;
}
a {
  color: #eee;
  outline: 0;
  text-decoration: none;
}
a:focus, a:hover {
  text-decoration: underline;
}

input {
  border: 0;
  color: inherit;
  font: inherit;
  margin: 0;
  outline: 0;
  padding: 0;
  -webkit-transition: background-color .3s;
          transition: background-color .3s;
}


.form input[type="password"], .form input[type="text"], .form input[type="submit"] {
  width: 100%;
}
.form--login {
  color: #606468;
}
.form--login label,
.form--login input[type="text"],
.form--login input[type="password"],
.form--login input[type="submit"] {
  border-radius: 0.25rem;
  padding: 1rem;
}
.form--login label {
  background-color: #363b41;
  border-bottom-right-radius: 0;
  border-top-right-radius: 0;
  padding-left: 1.25rem;
  padding-right: 1.25rem;
}
.form--login input[type="text"], .form--login input[type="password"] {
  background-color: #3b4148;
  border-bottom-left-radius: 0;
  border-top-left-radius: 0;
}
.form--login input[type="text"]:focus, .form--login input[type="text"]:hover, .form--login input[type="password"]:focus, .form--login input[type="password"]:hover {
  background-color: #434A52;
}
.form--login input[type="submit"] {
  background-color: #ea4c88;
  color: #eee;
  font-weight: bold;
  text-transform: uppercase;
}
.form--login input[type="submit"]:focus, .form--login input[type="submit"]:hover {
  background-color: #d44179;
}
.form__field {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin-bottom: 1rem;
}
.form__input {
  -webkit-box-flex: 1;
  -webkit-flex: 1;
      -ms-flex: 1;
          flex: 1;
}



.hidden {
  border: 0;
  clip: rect(0 0 0 0);
  height: 1px;
  margin: -1px;
  overflow: hidden;
  padding: 0;
  position: absolute;
  width: 1px;
}

.text--center {
  text-align: center;
}

.text--center a{
  color: blue;
}

.grid__container {
  margin: 0 auto;
  max-width: 20rem;
  width: 90%;
}

</style>
</head>

<body class="align">
<br><br><br><br><br>
  <div class="site__container">

    <div class="grid__container">

      <form method="post" action="loginCheck" class="form form--login">
<h3 align="center"><br>My FavSite</h3>
        <div class="form__field">
         <span class="hidden">Username</span>
          <input style="color: white" type="text" name="userid" class="form__input" placeholder="Username" required>
        </div>

        <div class="form__field">
        <span class="hidden">Password</span>
          <input style="color: white" type="password" name="userpw" class="form__input" placeholder="Password" required>
        </div>

        <div class="form__field">
          <input type="submit" value="Log In">
        </div>

      </form>

      <p class="text--center">관리자에게 문의하고싶다면.<a href="https://t.me/coindater" target="_black">텔레그램 문의하기</a> <span class="fontawesome-arrow-right"></span></p>
	<p style="text-align: center;">테스트아이디 목록<br> testid / testid <br> admin / admin</p>
    </div>

  </div>


</body>
</html>