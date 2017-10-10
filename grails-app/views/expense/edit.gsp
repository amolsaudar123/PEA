<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 27-09-2017
  Time: PM 03:27
--%>

<%@ page import="pea.Account" contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PEA:Expense_Edit</title>
    <asset:stylesheet src="acc.css"/>
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'account.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'verticalMenu.css')}" type="text/css">

    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Cherry Swash' rel='stylesheet'>
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
        <div class="container-fluid">
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
    <div class="expense">Edit Expenses</div>



    <g:form class="form-horizontal"  role="form" action="update">
        <h4>Edit Transaction </h4>

        <label class="col-sm-3 control-label">Payee</label>
        <div class="col-sm-9">
            <g:textField name="payee" value="${editExpense.payee}"  id="payee" placeholder="Payment Company.." class="form-control" list="company"/>
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

            <g:textField name="amount" value="${editExpense.amount}"  id="amount" placeholder="amount" class="form-control"/>
            <span class="help-block">amount</span>
        </div>
        <label class="col-sm-3 control-label">AccountPaidFrom</label>
        <div class="col-sm-9">
            <g:select id="bankName" class="form-control" value="${editExpense.account}" name="bankName" from="${bankNames}">
            </g:select>
            <span class="help-block">Bank Name</span>
        </div>

        <label class="col-sm-3 control-label">Date</label>
        <div class="col-sm-9">

            <g:datePicker name="date" value="${editExpense.date}"
                          default="${new Date()}" relativeYears="[0..0]" precision="day"/>
            <span class="help-block">date</span>
        </div>
        <div>
            <g:hiddenField name="userName" value="${session.user}"  class="form-control"/>
        </div>
        <g:hiddenField name="id" value="${id}"  class="form-control"/>
        <label class="col-sm-3 control-label">Tag</label>
        <div class="col-sm-9">

            <g:textField name="tag" value="${editExpense.tag}"  id="tag" placeholder="add tag.." class="form-control" list="tags"/>
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

            <g:submitButton class="btn btn-primary btn-block" value="update" name="update" controller="expense"/>
        </div>


    </g:form>

<!--[ footer ] -->
    <div id="expenseEditfooter">
        <div class="container">
            <p class="footer-block"> &copy; 2017 Personal Expense Analyzer

            &nbsp;&nbsp;&nbsp;&nbsp;

            Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
        </div>
    </div>
</div>

</body>
</html>
