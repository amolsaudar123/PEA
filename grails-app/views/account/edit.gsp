<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 27-09-2017
  Time: PM 12:13
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <asset:stylesheet src="acc.css"/>
    <title>PEA:Account_edit</title>
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

<script type="text/javascript">
var inlineData=[
    ['Category', 'Amount'],
    ['Entertainment', 800],
    ['Shopping', 2000],
    ['Food', 2500],
    ['Health', 350],
    ['Travel', 2000],
    ['EMI', 1700]
];
    $(document).ready(function() {
        // Load google charts
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        $.ajax({
            type: 'GET',
            url: '/PEA/api/expenses',
            dataType: "json",
//            async:false,
            success: function(data) {
                console.log(data);
                var result = data.aggregatedExpenses;
                var resultData = [];
                resultData.push(['Category','Amount']);
                var keys = Object.keys(data.aggregatedExpenses);
                console.log(keys);

                keys.forEach(function(element) {
                    console.log(element);
                    resultData.push([element,aggregatedExpenses[element]]);
                });

                console.log(resultData);
                inlineData = resultData;
                drawChart();

            }

        });
    });

    function drawChart() {

if(google.visualization){
    var data = google.visualization.arrayToDataTable(inlineData);

    // Optional; add a title and set the width and height of the chart
    var options = {'title':'Categorywise Expenses', 'width':400, 'height':300};

    // Display the chart inside the <div> element with id="piechart"
    var chart = new google.visualization.PieChart(document.getElementById('piechart'));
    chart.draw(data, options);
}

    }

$(document).ready(function() {
    var msg = new SpeechSynthesisUtterance('Hello World');
    window.speechSynthesis.speak(msg);
});

</script>
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
    <div class="accountDetail">Edit Accounts</div>
    <g:form class="form-horizontal"  role="form" action="update">
        <h4>Edits Account</h4>

        <label class="col-sm-3 control-label">Account Name</label>
        <div class="col-sm-9">
            <g:textField name="bankName" value="${editAccount.bankName}"   placeholder="Account Name" class="form-control" list="account"/>
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
            <g:textField  class="form-control" value="${editAccount.accountNumber}" name="accountNumber">
            </g:textField>
            <span class="help-block">account number</span>
        </div>



        <label class="col-sm-3 control-label">Account Type</label>
        <div class="col-sm-9">
            <g:select class="form-control" value="${editAccount.accountType}" name="accountType" from="${['Credit', 'Cash', 'Saving', 'Deposit', 'Salary']}">
            </g:select>
            <span class="help-block">account type</span>
        </div>


        <label class="col-sm-3 control-label">Balance</label>
        <div class="col-sm-9">
            <g:textField name="initialBalance" value="${editAccount.initialBalance}"   placeholder="balance" class="form-control"/>
            <span class="help-block">initialBalance</span>
        </div>


        <div>
            <g:hiddenField name="userName" value="${session.user}"  class="form-control"/>
            <g:hiddenField name="id" value="${id}"  class="form-control"/>
        </div>

        <div class="col-sm-9 col-sm-offset-3">

            <g:submitButton class="btn btn-primary btn-block" value="update" name="update"/>
        </div>

    </g:form>


    <div id="piechart"></div>
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
