<%@ page import="kz.javaee.db.Tasks" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@include file="vendor/head.jsp"%>
</head>
<body>
    <%@include file="vendor/navbar.jsp"%>

    <div class="container">
        <form action="/update" method="post">
            <%
                Tasks task = (Tasks) request.getAttribute("taskDetails");
            %>
            <input type="hidden" name="id" value="<%=task.getId()%>">

            <label>Name:</label>
            <input type="text" name="name" class="form-control" value="<%=task.getName()%>" >
            <br>

            <label>Description:</label>
            <textarea  name="description" class="form-control"><%=task.getDescription()%></textarea>
            <br>

            <label>
                Deadline date:
            </label><br>
            <input name="deadlineDate" value="<%=task.getDeadlineDate()%>" class="form-control">
            <br>
            <label>
                Completed:
            </label><br>
            <select name="completed" class="form-control">
                <option value="true" selected>YES</option>
                <option value="false" <%if(!task.isCompleted()){%>selected<%}%>>NO</option>
            </select>
            <br>

            <button type="submit" class="btn btn-success">SAVE</button>

            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">DELETE</button>
        </form>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class = "modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Delete Task</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                            <form action="/delete" method="post">
                                <input type="hidden" name="id" value="<%=task.getId()%>">
                                <div class="modal-body" >
                                    <h2 style="text-align:center">Do you want to delete?</h2>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                    <button type="submit" class="btn btn-danger">Yes</button>
                                </div>
                            </form>
                    </div>
                </div>
            </div>
    </div>

<%@include file="vendor/footer.jsp"%>

</body>
</html>
