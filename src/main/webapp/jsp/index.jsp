<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">All participants</a></li>
                <li><a href="newParticipant">New Participant</a></li>
            </ul>
        </div>
    </nav>

    <div class="container">
        <c:choose>
            <c:when test="${mode == 'PARTICIPANT_VIEW'}">
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Level</th>
                            <th>Primary Skill</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="participant" items="${participants}">
                            <tr>
                                <td>${participant.id}</td>
                                <td>${participant.name}</td>
                                <td>${participant.email}</td>
                                <td>${participant.level}</td>
                                <td>${participant.primarySkill}</td>
                                <td><a href="update?id=${participant.id}">Edit</a></td>
                                <td><a href="delete?id=${participant.id}">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:when test="${mode == 'PARTICIPANT_CREATE' || 'PARTICIPANT_EDIT'}">
                <form method="POST" class="form-horizontal" action="save">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="name">Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" value="${participant.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Email:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="Enter email" name="email" value="${participant.email}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="level">Level:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="level" placeholder="Enter level" name="level" value="${participant.level}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="skill">Primary skill:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="skill" placeholder="Enter primary skill" name="skill" value="${participant.primarySkill}">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </div>
                </form>
            </c:when>
        </c:choose>
    </div>
</body>
</html>
