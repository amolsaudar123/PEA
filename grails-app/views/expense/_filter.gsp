<div class="list">
<table class="table-five" border="2" >
    <thead>
    <tr>
    <util:remoteSortableColumn property="payee" title="${message(code: 'userTransaction.payee.label', default: 'Payee')}" update="expenseInfoTable" action="filter"/>
        <util:remoteSortableColumn property="amount" title="${message(code: 'userTransaction.amount.label', default: 'Amount')}" update="expenseInfoTable" action="filter"/>
        <util:remoteSortableColumn property="account" title="${message(code: 'userTransaction.account.label', default: 'Account')}" update="expenseInfoTable" action="filter"/>
        <util:remoteSortableColumn property="date" title="${message(code: 'userTransaction.date.label', default: 'Date')}" update="expenseInfoTable" action="filter"/>
        <util:remoteSortableColumn property="tag" title="${message(code: 'userTransaction.tag.label', default: 'Tag')}" update="expenseInfoTable" action="filter"/>
    </tr>
    </thead>
    <tbody>
    <g:each in="${expenseList}" status="i" var="expense">
        <tr  class="${(i % 2) == 0 ? 'odd' : 'even'}">


            <td>${fieldValue(bean: expense, field: "payee")}  </td>

            <td>${fieldValue(bean: expense, field: "amount")}</td>

            <td>${fieldValue(bean: expense, field: "account.bankName")}</td>

            <td>${fieldValue(bean: expense, field: "date")}</td>

            <td>${fieldValue(bean: expense, field: "tag")}</td>

        </tr>
    </g:each>

    </tbody>
</table>
</div>
<div class="paginateButtons">
    <util:remotePaginate total="${totalExpenses}" update="expenseInfoTable" action="filter" pageSizes="[2: '2 on Page',4:'4 on Page',6:'6 on Page']"  />
</div>