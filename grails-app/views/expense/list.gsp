<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 25-10-2017
  Time: PM 02:30
--%>

<%@ page import="pea.UserTransaction" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>PEA:Expense</title>
    <asset:stylesheet src="acc.css"/>
    <g:javascript library="jquery" />
    <asset:stylesheet src="pagination.css"/>
    <link rel="javascript" href="${resource(dir: 'javascripts', file: 'jquery-3.2.1.min.js')}" >
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'account.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'verticalMenu.css')}" type="text/css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div class="mainContainer">
    <div class="topHeader">
        <div class="logoHeader">
            <asset:image class="logo" src="personalLogo.PNG"></asset:image>
            <div class="projectTitle">Personal Expense Analyzer</div>
            <div class="navbar1">
                <a href="#">Welcome ${session.user}  |</a>
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
    <div class="expenseInfoTable">
              <g:render template="filter"/>
    </div>
<!--[ footer ] -->
    <div id="expensefooter">
        <div class="container">
            <p class="footer-block"> &copy; 2017 Personal Expense Analyzer
            Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
        </div>
    </div>
</div>
</body>
</html>
