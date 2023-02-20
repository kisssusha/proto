<cfset errorService = createObject("component", 'proto.src.services.error')/>

<cfset errorToDel = false/>
<cfset errorList = errorService.errorList()/>

<cfif isDefined('url.error_id')>
    <cfset errorToDel = errorService.deleteError(url.error_id)/>
</cfif>

<cfif errorToDel EQ true>
    <script>
        alert("Успешно");
    </script>
</cfif>

<cf_header>
    <cf_navig>

    <main role="main">
    <div class="jumbotron">
    <div class="container">
    <table class="table">
        <thead>
        <tr>
            <th scope="col">
                Номер
            </th>
            <th scope="col">
                Дата ввода
            </th>
            <th scope="col">
                Короткое описание
            </th>
            <th scope="col">
                Подробное описание
            </th>
            <th scope="col">
                Пользователь
            </th>
            <th scope="col">
                Статус
            </th>
            <th scope="col">
                Срочность
            </th>
            <th scope="col">
                Критичность
            </th>
            <th scope="col">
                Редактировать
            </th>
            <th scope="col">
                Удалить
            </th>
        </tr>
        </thead>

    <tbody>
    <cfset count = 1/>
    <cfoutput query="errorList">
        <tr>
        <th scope="row">
        #count++#
        </th>

    <td>
        #lateDate#
        </td>
    <td>
        #short_descr#
        </td>
    <td>
        #full_descr#
        </td>
    <td>
        #fullname#
        </td>
    <td>
        #sta#
        </td>
    <td>
        #urgency#
        </td>
    <td>
        #criticality#
        </td>

    <td>
            <a href="update.cfm?error_id=#id#" class="btn btn-primary">
        Редактировать
    </a>
    </td>
    <td>
            <a href="list.cfm?error_id=#id#" class="btn btn-primary">
        Удалить
    </a>
    </td>
    </tr>
    </cfoutput>
    </tbody>
    </table>
    </div>
    </div>
    </main>
</cf_header>
