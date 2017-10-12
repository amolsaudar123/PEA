<%--
  Created by IntelliJ IDEA.
  User: amol.saudar
  Date: 31-08-2017
  Time: PM 03:44
--%>

<%@ page import="pea.Account" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
   <title>PEA:Expense</title>
    <asset:stylesheet src="acc.css"/>
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'account.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'verticalMenu.css')}" type="text/css">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Cherry Swash' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="mainContainer">
    <div class="topHeader">
        <div class="logoHeader">

            <asset:image class="logo" src="personalLogo.PNG"></asset:image>
            <div class="projectTitle">Personal Expense Analyzer</div>
            <div class="navbar1">

                <a href="#profile">Welcome ${session.user}  |</a>

            </div>
        </div>
    </div>
    <!--LeftSide Menu Starts-->
    <nav class="navbar navbar-default sidebar" role="navigation">
        <div class="container-fluid" id="expenseFluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li style="height: 70px; font-size: 18px"><g:link action="onLogin" controller="dashboard"> Dashboard<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home "></span></g:link></li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index" controller="account" >Account<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li class="active" style="height: 70px; font-size: 18px"><g:link action="index1" controller="expense">Expense<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-paperclip"></span></g:link></li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index" controller="reminder">Analytics<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-dashboard"></span></g:link></li>
                    <li  style="height: 70px; font-size: 18px; "><g:link controller="dashboard" action="profile">Profile<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
    <!--LeftSide Menu End-->

    <div class="expense">Previous Expenses</div>
<div class="analyzeExpense"><g:link action="index" controller="reminder"><button  type="button" id="" class="btn-md btn-info"  > Analyze Expenses</g:link></button></div>
    <table class="table-five" border="2" >
        <thead>
        <tr>
            <th class="heading1">Payee</th>
            <th class="heading1">Amount<span style="color: white; margin-left: 7px; ">( <i class="fa fa-inr" > )</i></span></th>
            <th class="heading1">Account Paid From</th>
            <th class="heading1">Date</th>
            <th class="heading1">Tag</th>
            <th class="heading1">Delete Expense</th>
            <th class="heading1">Edit Expense</th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${expenses}" status="i" var="expense">
            <tr class="expenseTable">
                <td>${expense.payee}</td>
                <td>${expense.amount}</td>
                <td>${expense.account.bankName}</td>
                <td><g:formatDate date="${expense.date}" format="dd-MMM-yyyy"/> </td>
                <td>${expense.tag}</td>
                <td><g:link action="delete"  controller="expense" id="${expense.id}">Delete</g:link></td>
                <td><g:link action="edit"  controller="expense" id="${expense.id}">Edit</g:link></td>
            </tr>
        </g:each>
        </tbody>
        <g:paginate controller="expense" action="index1" total="${expenses}" />
    </table>

    <div class="income">Income</div>

    <table class="table-transaction" border="2">
        <thead>
        <tr>
            <th class="heading1">Payer</th>
            <th class="heading1">Amount <span style="color: white; margin-left: 7px; ">( <i class="fa fa-inr" > )</i></span></th>
            <th class="heading1">Account Received In</th>
            <th class="heading1">Date</th>
            <th class="heading1">Tag</th>
            <th class="heading1">Delete Income</th>
            <th class="heading1">Edit Income</th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${incomes}" status="i" var="income">
            <tr class="expenseTable">
                <td>${income.payer}</td>
                <td>${income.amount}</td>
                <td>${income.account.bankName}</td>
                <td><g:formatDate date="${income.date}" format="dd-MMM-yyyy"/>  </td>
                <td>${income.tag}</td>
                <td><g:link action="delete"  controller="expense" id="${income.id}">Delete</g:link></td>
                <td><g:link action="editTransaction"  controller="expense" id="${income.id}">Edit</g:link></td>
            </tr>
        </g:each>
        </tbody>
    </table>

    <script>
        $(document).ready(function() {

            $("form").hide();
            $("#show").show();

            $('#show').click(function() {
                $("form").slideToggle();
            });

        });
    </script>


    <div class="newAccount">To Add new transaction click the button:-

        <button  type="button" id="show" class="btn-md btn-info "> Add Transaction</button>

    </div>

    <g:form class="form-horizontal" id="form" role="form" action="save" style="display: none; height: 550px" >
        <h4>Add Transaction</h4>

        <span class="transactionType" style="font-size: 19px; color: #1e7e34; font-family: 'Estrangelo Edessa'"><b>Select Transaction Type:</b>
        <g:radioGroup name="transactionType" class="radio_button"
                      labels="['Income','Expense']"
                      values="['income','expense']"
                      value="'expense'" >
            <ul style="background-color: #dddddd;"><li style="display: inline;">
            <p class="displaytablecell" style="color: #062c33">${it.label} ${it.radio} </p>
            </li>
            </ul>

        </g:radioGroup>
        </span>
        <label class="col-sm-3 control-label">Payee or Payer</label>
        <div class="col-sm-9">
            <g:textField name="payee" value="${payee}"  id="payee" placeholder="Payment Company.." class="form-control" list="company"/>
            <datalist id="company">
                <option value="MSRTC">
                <option value="MakeMyTrip">
                <option value="TajHotel">
                <option value="PMT">
                <option value="session mall">
                <option value="inGreen">
                <option value="Oberoi">
                <option value="Air India">
                <option value="SpiceJet">
            </datalist>
            <span class="help-block">name of bill company</span>
        </div>
        <label class="col-sm-3 control-label">Amount</label>
        <div class="col-sm-9">

            <g:textField name="amount" value="${amount}"  id="amount" placeholder="amount" class="form-control"/>
            <span class="help-block">amount</span>
        </div>
        <label class="col-sm-3 control-label">AccountPaidFrom</label>
        <div class="col-sm-9">
            <g:select id="bankName" class="form-control" value="${account}" name="bankName" from="${bankNames}">
            </g:select>
            <span class="help-block">Bank Name</span>
        </div>

        <label class="col-sm-3 control-label">Date</label>
        <div class="col-sm-9">
            <g:datePicker name="date" value="${date}" default="${new Date()}" relativeYears="[0..0]" precision="day" />
            <span class="help-block">date</span>
        </div>

    <div>
    <g:hiddenField name="userName" value="${session.user}"  class="form-control"/>
    </div>
        <label class="col-sm-3 control-label">Tag</label>
        <div class="col-sm-9">

            <g:textField name="tag" value="${tag}"  id="tag" placeholder="add tag.." class="form-control" list="tags"/>
            <datalist id="tags">
                <option value="Shopping">
                <option value="Entertainment">
                <option value="Movies">
                <option value="Dinner">
                <option value="Break Fast">
                <option value="Help">

            </datalist>
            <span class="help-block">tags</span>
        </div>

        <div class="col-sm-9 col-sm-offset-3">

            <g:submitButton class="btn btn-primary btn-block" value="save" name="save" controller="expense">add expense</g:submitButton>
        </div>


    </g:form>

<!--[ footer ] -->
    <div id="expensefooter">
        <div class="container">
            <p class="footer-block"> &copy; 2017 Personal Expense Analyzer

            &nbsp;&nbsp;&nbsp;&nbsp;

            Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
        </div>
    </div>
</div>

</body>
</html>
