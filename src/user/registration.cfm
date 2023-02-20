<cfset isUserLogin = false/>
<cfset MyErrorMessage = arrayNew(1)/>
<cfif structKeyExists(form,'signup')>

    <cfset userService = createObject("component", 'proto.src.services.user')/>
    <cfset MyErrorMessage =  userService.userAuthentication(form.login,form.firstname,form.lastname, form.password)/>
    <cfif arrayIsEmpty(MyErrorMessage)>
        <cfset isUserLogin =  userService.UserSignUp(form.login,form.firstname,form.lastname, form.password)/>
    </cfif>
    <cfif isUserLogin EQ true >
        <cfset authenticationService = createObject("component", 'proto.src.services.authentification')/>
        <cfset isUserLogin =  authenticationService.doLogin(form.login, form.password)/>
    </cfif>
</cfif>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://getbootstrap.com/favicon.ico">

    <title>
        Document
    </title>

    <link href="./Signin Template for Bootstrap_files/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
</head>

<body>
<div class="container">

<cfif structKeyExists(variables, 'MyErrorMessage') AND NOT arrayIsEmpty(MyErrorMessage)>
    <cfoutput>
        <cfloop array="#MyErrorMessage#" index="message">
                <script>
                alert("#MESSAGE#");
            </script>
        </cfloop>
    </cfoutput>
    <cfset arrayClear(MyErrorMessage)/>
</cfif>

<cfif structKeyExists(session, 'installTheLoggedInUser')>
        <script>
            alert('Успешно');
        </script>
    <cflocation url="/test/src/userUpdate.cfm" />
<cfelse>
    <cfform class="form-signin"  >
            <h1 class="h3 mb-3 font-weight-normal">
                Регистрация
            </h1>
            <label for="inputfirstname" class="sr-only">
                Имя
            </label>
        <cfinput type="text" id="inputfirstname"  class="form-control" name="firstname" placeholder="Имя" required="true" message="Введите имя!">
            <label for="inputlastname" class="sr-only">
                Фамилия
            </label>
        <cfinput type="text" id="inputlastname" class="form-control" name="lastname" placeholder="Фамилия" required="true" message="Введите фамилию!">
            <label for="inputlogin" class="sr-only">
                Введите логин
            </label>
        <cfinput type="text" id="inputlogin"  class="form-control" name="login" placeholder="Логин" required="true" message="Введите логин!">
            <label for="inputpassword" class="sr-only">
                Введите пароль
            </label>
        <cfinput type="password" id="inputpassword" class="form-control" name="password" placeholder="Пароль" required="true" message="Введите пароль!">
        <cfinput type="submit" class="btn btn-lg btn-primary btn-block" name="signup" value="Зарегистрироваться">
    </cfform>
</cfif>

</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>
