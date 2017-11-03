<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 09-10-2017
  Time: PM 04:07
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mail</title>
</head>

<body>
<h3>Greetings ${session.user}!</h3>
<p>Welcome to Personal Expense Analyzer</p>
<p>Find Expense Report Below.</p>

<table class="table-five" border="1" >
    <thead>
    <tr>
        <th class="heading1">Payee</th>
        <th class="heading1">Amount<span style="color: white; margin-left: 7px; ">( <i class="fa fa-inr" > )</i></span></th>
        <th class="heading1">Account Paid From</th>
        <th class="heading1">Date</th>
        <th class="heading1">Tag</th>

    </tr>
    </thead>
    <tbody>

    <g:each in="${expensesShare}" status="i" var="expense">
        <tr class="expenseTable">
            <td>${expense.payee}</td>
            <td>${expense.amount}</td>
            <td>${expense.account.bankName}</td>
            <td><g:formatDate date="${expense.date}" format="dd-MMM-yyyy" /> </td>
            <td>${expense.tag}</td>

        </tr>
    </g:each>
    </tbody>
</table>
</body>
</html>