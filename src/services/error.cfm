<cfcomponent output="false">
    <cffunction name="deleteError" access="public" output="false" returntype="boolean">
        <cfargument name="errorId" type="numeric" required="true"/>
        <cfset isErrorDelete = false/>
        <cfquery>
            DELETE FROM `errorhistory`
            WHERE error_id = "#arguments.errorId#";
        </cfquery>

        <cfquery>
            DELETE FROM `error`
            WHERE id = "#arguments.errorId#";
        </cfquery>

        <cfset isErrorDelete = true/>
        <cfreturn isErrorDelete>
    </cffunction>
    <cffunction name="errorList" access="public" output="false" returntype="query">
        <cfquery name="selected_error">
            SELECT id,`short_descr`, `full_descr`, hh.status as sta, hh.latestDate as lateDate, hh.whole_name as fullname, `urgency`, `criticality`
            FROM `error` as err
            JOIN
            (SELECT max(`data`) as latestDate, status, sys.whole_name, error_id
            FROM errorhistory
            INNER JOIN(SELECT id, CONCAT_WS(" ", `firstname`, `lastname`)
            AS `whole_name`
            FROM `systemuser`)
            as sys on sys.id = user_id
            group by error_id )
            as hh on err.id = hh.error_id
        </cfquery>
        <cfreturn selected_error>
    </cffunction>

    <cffunction name="error_Reg" access="public" output="false" returntype="boolean">
        <cfargument name="status" type="string" required="true"/>
        <cfargument name="comment" type="string" required="true"/>
        <cfargument name="short_descr" type="string" required="true"/>
        <cfargument name="detailed_descr" type="string" required="true"/>
        <cfargument name="urgency" type="string" required="true"/>
        <cfargument name="criticality" type="string" required="true"/>
        <cfset isErrorReg = false/>

        <cfquery>
            DROP TRIGGER IF EXISTS `new_history`
        </cfquery>

        <cfquery>
            CREATE TRIGGER new_history AFTER INSERT ON error
            FOR EACH ROW
            BEGIN
            INSERT INTO `errorhistory`(`data`, `status`, `comment`, `user_id`, `error_id`)
            VALUES ('#DateFormat(Now(), "yyyy-mm-dd hh:mm:ss")#','#arguments.status#','#arguments.comment#','#session.installTheLoggedInUser.userID#',NEW.id);
            END
        </cfquery>
        <cfquery>
            INSERT INTO `error`(`short_descr`, `full_descr`, `urgency`, `criticality`)
            VALUES ('#arguments.short_descr#','#arguments.detailed_descr#','#arguments.urgency#','#arguments.criticality#')
        </cfquery>
        <cfset isErrorReg = true/>
        <cfreturn isErrorReg>
    </cffunction>


    <cffunction name="error_Update" access="public" output="false" returntype="boolean">
        <cfargument name="id" type="numeric" required="true"/>
        <cfargument name="status" type="string" required="true"/>
        <cfargument name="comment" type="string" required="true"/>
        <cfargument name="short_descr" type="string" required="true"/>
        <cfargument name="detailed_descr" type="string" required="true"/>
        <cfargument name="urgency" type="string" required="true"/>
        <cfargument name="criticality" type="string" required="true"/>
        <cfset isErrorUpdate = false/>
        <cfquery>
            DROP TRIGGER IF EXISTS `new_history`
        </cfquery>
        <cfquery>
            CREATE TRIGGER new_history AFTER UPDATE ON error
            FOR EACH ROW
            BEGIN
            INSERT INTO `errorhistory`(`data`, `status`, `comment`, `user_id`, `error_id`)
            VALUES ('#DateFormat(Now(), "yyyy-mm-dd hh:mm:ss")#','#arguments.status#','#arguments.comment#','#session.installTheLoggedInUser.userID#',NEW.id);
            END
        </cfquery>

        <cfquery>
            UPDATE `error`
            SET `short_descr`='#arguments.short_descr#',
        `full_descr`='#arguments.detailed_descr#',
        `urgency`='#arguments.urgency#',
        `criticality`='#arguments.criticality#'
        WHERE `id`=#arguments.id#
        </cfquery>
        <cfset isErrorUpdate = true/>
        <cfreturn isErrorUpdate>
    </cffunction>

    <cffunction name="selected_history" access="public" output="false" returntype="query">
        <cfargument name="error_id" type="numeric" required="true"/>

        <cfquery name="historyList">
            SELECT histor.`id`,`data`, `status`, `comment`, sys.whole_name as fullname
            FROM `errorhistory`as histor
            INNER JOIN
            (SELECT id, CONCAT_WS(" ", `firstname`, `lastname`)AS `whole_name`
            FROM `systemuser`)
            as sys on sys.id = user_id and error_id = #arguments.error_id#
        </cfquery>
        <cfreturn historyList>
    </cffunction>

    <cffunction name="error_to_update" access="public" output="false" returntype="query">
        <cfargument name="error_id" type="numeric" required="true"/>

        <cfquery name="errorToUpdate">
            SELECT `short_descr`, `full_descr`, hh.status as sta, `urgency`, `criticality`, hh.comment as comment
            FROM `error` as err
            JOIN
            (SELECT status, error_id,comment
            FROM errorhistory group by error_id )
            as hh on err.id = #arguments.error_id# and hh.error_id =#arguments.error_id#
        </cfquery>
        <cfreturn errorToUpdate>
    </cffunction>

    <cffunction name="deleteHistory" access="public" output="false" returntype="boolean">
        <cfargument name="historyId" type="numeric" required="true"/>
        <cfset isErrorDelete = false/>
        <cfquery>
            DELETE FROM `errorhistory`
            WHERE id = "#arguments.historyId#";
        </cfquery>
        <cfset isErrorDelete = true/>
        <cfreturn isErrorDelete>
    </cffunction>
</cfcomponent>
