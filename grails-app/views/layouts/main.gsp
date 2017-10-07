<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 28-08-2017
  Time: PM 02:48
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<title>Login:Personal Expense Analyzer </title>
	<link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'bootstrap.min.css')}" type="text/css">

	<link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'login.css')}" type="text/css">

	<script src="https://apis.google.com/js/client:platform.js?onload=renderButton" async defer></script>

	<meta name="google-signin-client_id" content="1091185830753-1o70arngk6j4i5keefgn51qdvk8o2kg2.apps.googleusercontent.com">

	<asset:javascript src="platform.js"/>

	<asset:javascript src="jquery-3.2.1.min.js"/>
</head>
<body>
<h3 id="title1">Personal Expense Analyzer</h3>
<div class="duck" >
	<div class="trBorder" align=center>
		<br>Login using Gmail
		<br>

		<button class="loginBtn loginBtn--google g-signin2" data-onsuccess="onSignIn" id="gmailButton">
			Login with Google
		</button>



		<g:javascript>

			function onSignIn(googleUser) {

				var profile = googleUser.getBasicProfile();

				$("#email").val(profile.getEmail());

				//$( "#onLogin" ).submit();
				$.ajax({
					url:  "/PEA/api/loginsuccess",
					type: 'post',
					data: {fullName: profile.getName(), profilePhoto:profile.getImageUrl(), email:profile.getEmail()},
					success: function (data) {
						// alert("success");
						window.location="/PEA/api/onLogin"
					},
					error: function () {
						alert("Some error occured , please retry....");
					}

				});

			};



		</g:javascript>

	</div>
</div>
</body>
</html>
