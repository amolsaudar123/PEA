<%--
  Created by IntelliJ IDEA.
  User: amol.saudar
  Date: 31-08-2017
  Time: PM 03:44
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <asset:stylesheet src="acc.css"/>
    <title>PEA:Account</title>
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
                    <li style="height: 70px; font-size: 18px"><g:link action="onLogin" controller="dashboard">Dashboard<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home "></span></g:link> </li>
                    <li class="active" style="height: 70px; font-size: 18px"><g:link action="index" controller="account">Account<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index1" controller="expense">Expense<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-paperclip"></span></g:link> </li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index" controller="reminder">Reminder<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-dashboard"></span></g:link></li>
                    <li  style="height: 70px; font-size: 18px; "><g:link controller="dashboard" action="profile">Profile<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></g:link></li>
                </ul>
            </div>
        </div>
    </nav>
    <!--LeftSide Menu End-->
    <div class="accountDetail">Accounts</div>
    <table class="table-four" border="2">
        <thead>
        <tr >
            <th class="heading1">Bank Name</th>
            %{--<th class="heading1">Account Number</th>--}%
            <th class="heading1">Account Type</th>
            <th class="heading1">Initial Balance<span style="color: white; margin-left: 7px; ">( <i class="fa fa-inr" > )</i></span></th>
            <th class="heading1">Delete</th>
            <th class="heading1">Edit Account</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${account}" status="i" var="accounts">
            <tr>
                <td>${accounts.bankName}</td>
                %{--<td>${accounts.accountNumber}</td>--}%
                <td>${accounts.accountType}</td>
                <td>${accounts.initialBalance}</td>
                <td><g:link action="delete"  controller="account" id="${accounts.id}">Delete</g:link></td>
                <td><g:link action="edit"  controller="account" id="${accounts.id}">Edit</g:link></td>
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


<div class="newAccount">To Add new account click the button:-
     <button  type="button" id="show" class="btn-md btn-info "> Add Account</button>

   </div>

    <g:form class="form-horizontal" id="form" role="form" action="save" style="display: none">
        <h4>Add Account</h4>

        <label class="col-sm-3 control-label">Account Name</label>
        <div class="col-sm-9">
             <g:textField name="bankName" value="${bankName}"  id="bankName" placeholder="Account Name" class="form-control" list="account"/>
            <datalist id="account">
            <option value="Cash">
                <option value="SBI">
                <option value="HDFC">
                <option value="ICICI">
                <option value="canara bank">
                <option value="dbs">
            </datalist>
            <span class="help-block">account name eg.: HDFC, SBI, ICICI, etc.</span>
        </div>

        <label class="col-sm-3 control-label">Account Number</label>
        <div class="col-sm-9">
            <g:textField id="accountNumber" class="form-control" value="${accountNumber}" name="accountNumber">
            </g:textField>
            <span class="help-block">account number</span>
        </div>



        <label class="col-sm-3 control-label">Account Type</label>
        <div class="col-sm-9">
            <g:select id="accountType" class="form-control" value="${accountType}" name="accountType" from="${['Credit', 'Cash', 'Saving', 'Deposit', 'Salary']}">
                     </g:select>
            <span class="help-block">account type</span>
        </div>


        <label class="col-sm-3 control-label">Balance</label>
        <div class="col-sm-9">
            <g:textField name="initialBalance" value="${initialBalance}"  id="initialBalance" placeholder="balance" class="form-control"/>
            <span class="help-block">initialBalance</span>
        </div>


                 <div>
                <g:hiddenField name="userName" value="${session.user}"  class="form-control"/>
            </div>
        <div class="col-sm-9 col-sm-offset-3">

            <g:submitButton class="btn btn-primary btn-block" value="save" name="save">add account</g:submitButton>
        </div>


    </g:form>
</div>

<!--[ footer ] -->
<div id="accountFooter">
    <div class="container">
        <p class="footer-block"> &copy; 2017 Personal Expense Analyzer

        &nbsp;&nbsp;&nbsp;&nbsp;

        Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
    </div>
</div>
</body>
</html>
