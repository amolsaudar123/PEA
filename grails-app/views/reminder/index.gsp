<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 05-09-2017
  Time: PM 01:11
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>PEA:Reminder</title>
    <asset:stylesheet src="reminder.css"/>
    <link rel="stylesheet" href="${resource(dir: 'stylesheets', file: 'mainPage.css')}" type="text/css">

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

                <a href="#">Welcome ${session.user}  |</a>
            </div>
        </div>
    </div>
    <!--LeftSide Menu Starts-->
    <nav class="navbar navbar-default sidebar" role="navigation">
        <div class="container-fluid" id="reminderContainer">
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
                    <li style="height: 70px; font-size: 18px"><g:link action="index" controller="account">Account<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
                    <li style="height: 70px; font-size: 18px"><g:link action="index1" controller="expense"> Expense<span style="font-size:19px; " class="pull-right hidden-xs showopacity glyphicon glyphicon-paperclip"></span></g:link></li>
                    <li  class="active" style="height: 70px; font-size: 18px; "><g:link controller="reminder" action="index">Reminder<span style="font-size:19px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-dashboard"></span></g:link></li>
                    <li  style="height: 70px; font-size: 18px; "><g:link controller="dashboard" action="profile">Profile<span style="font-size:19px; " class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></g:link></li>

                </ul>
            </div>
        </div>
    </nav>
    <!--LeftSide Menu End-->
    <div class="reminderDetail">Reminder</div>
    <div class="subTitle"><b>Old Reminders:-</b></div>
    <table class="table-two" border="1" id="reminderTable">
        <thead>
        <tr style="height: 40px;">
            <th class="heading2">Title</th>
            <th class="heading2">Description</th>

            <th class="heading2">Delete</th>
           </tr>
        </thead>
        <tbody>

        <g:each in="${reminder}" status="i" var="reminders">
            <tr style="height: 40px;">
                <td >${reminders.title}</td>
                <td>${reminders.description}</td>

                <td><g:link action="delete"  controller="reminder" id="${reminders.id}">Delete</g:link></td>
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

    <div class="newReminder">To Add new reminder click the button:-
        <button  type="button" id="show" class="btn-md btn-info "> Add Reminder</button>

    </div>

    <g:form class="form-horizontal" id="form" role="form" action="save" style="display: none">
        <h4>Add Reminder</h4>

        <label class="col-sm-3 control-label">Title</label>
        <div class="col-sm-9">
         <g:textField name="title" value="${title}"  id="title" placeholder="title for reminder.." class="form-control"/>

            <span class="help-block">MyFirstReminder, NotifyReminder. etc...</span>
        </div>


        <label class="col-sm-3 control-label">Description</label>
        <div class="col-sm-9">
            <g:textArea id="description" class="form-control" value="${description}" name="description"/>

            <span class="help-block">description</span>
        </div>
        <div>
            <g:hiddenField name="userName" value="${session.user}"  class="form-control"/>
        </div>

        <div class="col-sm-9 col-sm-offset-3">

            <g:submitButton class="btn btn-primary btn-block" value="save" name="save"/>
        </div>


    </g:form>

    <div id="reminderFooter">
        <div class="container">
            <p class="footer-block"> &copy; 2017 Personal Expense Analyzer

            &nbsp;&nbsp;&nbsp;&nbsp;

            Design by Amol <a HREF="www.sptr.co"> (SyS +)</a></p>
        </div>
    </div>

</div>
</body>
</html>
