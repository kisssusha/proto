<cfcomponent output="false">

    <cffunction name="userVerification" access="public" output="false" returntype="array">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>

        <cfset var MyErrorMessage = arrayNew(1)/>

        <cfquery name="login_validation">
            SELECT COUNT(*) as `count`
            FROM `systemuser`
            WHERE login = "#arguments.userLogin#"
        </cfquery>
        <cfquery name="password_validation">
            SELECT `login`
            FROM `systemuser`
            WHERE password = "#arguments.userPassword#"
        </cfquery>

        <cfif arguments.userLogin EQ "">
            <cfset arrayAppend(MyErrorMessage, "Введите свой логин")/>
        </cfif>
        <cfif arguments.userPassword EQ "">
            <cfset arrayAppend(MyErrorMessage, "Введите свой пароль")/>
        </cfif>
        <cfif #login_validation.count# EQ 0>
            <cfset arrayAppend(MyErrorMessage, "Данный логин не зарегистрирован")/>
        </cfif>
        <cfif #password_validation.login# NEQ #arguments.userLogin#>
            <cfset arrayAppend(MyErrorMessage, "Неверный пароль")/>
        </cfif>

        <cfreturn MyErrorMessage/>
    </cffunction>

    <cffunction name="doLogin" access="public" output="false" returntype="boolean">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>
        <cfset var isUserLogin = false/>

        <cfquery name="user_select">
            SELECT `id`, `login`, `firstname`, `lastname`, `password`
            FROM `systemuser`
            WHERE login = "#arguments.userLogin#" and password = "#arguments.userPassword#"
        </cfquery>

        <cfif user_select.recordcount EQ 1>
            <cflogin>
                <cfloginuser name="#user_select.firstname# #user_select.lastname#" password="#user_select.password#" roles="user">
            </cflogin>
            <cfset session.installTheLoggedInUser = {'userFirstName' = user_select.firstname, 'userLastaName' = user_select.lastname, 'userID' = user_select.id}/>
            <cfset var isUserLogin = true/>

        </cfif>
        <cfreturn isUserLogin/>
    </cffunction>


    <cffunction name="LogOuting" access="public" output="false" returntype="void">
        <cfset structdelete(session, 'installTheLoggedInUser')/>
        <cflogout/>
    </cffunction>


</cfcomponent>