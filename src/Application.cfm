<cfcomponent output="false">
    <cfset this.name = 'errorRegister'/>
    <cfset this.applicationTimeout = createtimespan(0, 2, 0, 0)/>
    <cfset this.datasource = 'test_db'/>
    <cfset this.sessionManagement = true/>
    <cfset this.sessionTimeout = createTimespan(0, 0, 30, 0)/>
    <cfset this.customTagPaths = expandPath('/proto/src/frontend')/>

</cfcomponent>
