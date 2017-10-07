<%--
  Created by IntelliJ IDEA.
  User: Amol.Saudar
  Date: 11-09-2017
  Time: PM 07:03
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>UserProfile</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href='https://fonts.googleapis.com/css?family=Cherry Swash' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    .card {
        box-shadow: 0 4px 8px 0 rgba(2, 0, 0, 0.2);
        background: rgba(7, 0, 0, 0.2);
        width: 300px;
        height: 350px;
        margin: auto;
        text-align: center;
        font-family: arial;
    }

    .title {
        color: grey;
        font-size: 18px;
    }

    button {
        border: none;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
        font-size: 18px;
    }

    a {
        text-decoration: none;
        font-size: 22px;
        color: black;
    }

    button:hover,
    a:hover {
        opacity: 0.7;
    }
    </style>

</head>

<body>
<h2 style="text-align:center">My Profile</h2>


<div class="card">


    <g:img uri="${session.photo}" alt="img" style="width:40%"/>
    <h1>${session.user}</h1>
    <p class="title">${session.email}</p>
    <p></p>

    <ul class="nav navbar-nav">
        <li style="height: 50px; font-size: 15px"><g:link action="onLogin" controller="dashboard"> Dashboard<span style="font-size:15px; margin-left: 10px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-home "></span></g:link></li>
        <li style="height: 50px; font-size: 15px"><g:link action="index" controller="account">Account<span style="font-size:15px; margin-left: 10px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-th-list"></span></g:link></li>
        <li style="height: 50px; font-size: 15px"><g:link action="index1" controller="expense"> Expense<span style="font-size:15px; margin-left: 10px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-paperclip"></span></g:link></li>
        <li   style="height: 50px; font-size: 15px; "><g:link controller="reminder" action="index">Reminder<span style="font-size:15px; margin-left: 10px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-dashboard"></span></g:link></li>

    </ul>
</div>
</body>
</html>