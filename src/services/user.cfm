<cfcomponent output="false">
    <cffunction name="userAuthentication" access="public" output="false" returntype="array">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="firstname" type="string" required="true"/>
        <cfargument name="lastname" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>

        <cfset myErrorMessage = arrayNew(1)/>
        <cfquery name="login_validation">
            SELECT COUNT(*) as count
            FROM `systemuser`
            WHERE login = "#arguments.userLogin#"
        </cfquery>
        <cfif arguments.firstname EQ "">
            <cfset arrayAppend(myErrorMessage, "Введите свое имя")/>
        </cfif>
        <cfif arguments.lastname EQ "">
            <cfset arrayAppend(myErrorMessage, "Введите свою фамилию")/>
        </cfif>
        <cfif arguments.userLogin EQ "">
            <cfset arrayAppend(myErrorMessage, "Введите свой логин")/>
        </cfif>
        <cfif arguments.userPassword EQ "">
            <cfset arrayAppend(myErrorMessage, "Введите свой пароль")/>
        </cfif>
        <cfif #login_validation.count# NEQ 0>
            <cfset arrayAppend(myErrorMessage, "Данный логин уже зарегистрирован")/>
        </cfif>
        <cfreturn myErrorMessage/>
    </cffunction>

    <cffunction name="UserLogIn" access="public" output="false" returntype="boolean">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="firstname" type="string" required="true"/>
        <cfargument name="lastname" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>

        <cfset isUserLogIn = false/>
        <cfquery>
            INSERT INTO `systemuser`(`login`, `firstname`, `lastname`, `password`)
            VALUES ('#arguments.userLogin#','#arguments.firstname#','#arguments.lastname#','#arguments.userPassword#')
        </cfquery>
        <cfset isUserLogIn = true/>
        <cfreturn isUserLogIn/>
    </cffunction>

    <cffunction name="userForUpdate" access="public" output="false" returntype="query">
        <cfquery name="userUpdate">
            SELECT `login`, `firstname`, `lastname`, `password`
            FROM `systemuser`
            WHERE id ="#session.installTheLoggedInUser.userID#"
        </cfquery>
        <cfreturn userUpdate>
    </cffunction>

    <cffunction name="updatingUser" access="public" output="false" returntype="boolean">
        <cfargument name="userLogin" type="string" required="true"/>
        <cfargument name="firstname" type="string" required="true"/>
        <cfargument name="lastname" type="string" required="true"/>
        <cfargument name="userPassword" type="string" required="true"/>

        <cfset isUserUpdate = false/>
        <cfquery>
            UPDATE `systemuser`
            SET `login`='#arguments.userLogin#',`firstname`='#arguments.firstname#',`lastname`='#arguments.lastname#',`password`= '#arguments.userPassword#'
            WHERE id = "#session.installTheLoggedInUser.userID#"
        </cfquery>
        <cfset isUserUpdate = true/>
        <cfreturn isUserUpdate>
    </cffunction>
</cfcomponent>
