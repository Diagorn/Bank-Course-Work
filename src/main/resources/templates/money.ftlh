<#import "parts/common.ftlh" as c>
<#import "parts/moneyForm.ftlh" as m>

<@c.page>
    <#if message??>
        <h2 class="red">${message}</h2>
    </#if>
    <div class="col-md-4">
        <form action="/money" method="get">
            <input type="text" name="filter" class="form-control">
            <button type="submit" class="btn btn-success">Найти</button>
        </form>
    </div>
    <div class="col-md-4">
        <h2>Добавить валюту</h2>
        <@m.money "money" "Добавить"/>
    </div>
    <div class="col-md-4">
        <table class="table table-striped">
            <thead>
            <tr>
                <td>Название валюты</td>
                <td>Цена в рублях за единицу</td>
                <td></td><td></td>
            </tr>
            </thead>
            <#list currencies as currency>
            <tr>
                <td>
                    <p>${currency.moneyName}</p>
                </td>
                <td>
                    <p>${currency.summInRoubles}₽</p>
                </td>
                <td>
                    <a href="/money/edit/${currency.moneyName}">Изменить...</a>
                </td>
                <td>
                    <form action="/money/delete/${currency.moneyName}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <button type="submit" class="btn btn-danger">Удалить</button>
                    </form>
                </td>
            </tr>
            <#else>
        </table>
        <p>No money types added to DB</p>
        </#list>
    </div>
</@c.page>