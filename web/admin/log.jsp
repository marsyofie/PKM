<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="ie6 ielt8"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="ie7 ielt8"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="ie8"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--> <html lang="en"> <!--<![endif]-->
<head>
<meta charset="utf-8">
<title>Medicare Website</title>
<link rel="stylesheet" type="text/css" href="log.css" />
</head>
<body>
<div class="container">
	<section id="content">
            <form action="login.jsp" method="post">
			<h1>Login Form</h1>
			<div>
				<input type="text" name="uname" value="" placeholder="Username" required="" id="username" />
			</div>
			<div>
				<input type="password" name="pass" value="" placeholder="Password" required="" id="password" />
			</div>
			<div>
				<input type="submit" value="Log in" />
                                <input type="reset" value="Reset" />
				<a href="../index.jsp">Go Home</a>
			</div>
		</form><!-- form -->
	</section><!-- content -->
</div><!-- container -->
</body>
</html>