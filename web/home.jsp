<%@ page import="java.util.ArrayList" %>
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
        <div class="mt-2">
            <button type="button" class="btn" style="background-color: darkblue; color:white" data-bs-toggle="modal" data-bs-target="#exampleModal">
                +Add a task
            </button>

            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">New Task</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form action="/add" method="post">
                            <div class="modal-body" style="color:gray">

                                    <label>
                                        Name:
                                    </label><br>
                                    <input type="text" name="name"  placeholder="Name" class="form-control">
                                    <br>

                                    <label>
                                        Description:
                                    </label><br>
                                    <textarea name="description" placeholder="Description" class="form-control"></textarea>
                                    <br>

                                    <label>
                                        Deadline date:
                                    </label><br>
                                    <input type="date" name="deadlineDate"  class="form-control">
                                    <br>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Add</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <div class="row mt-5">
            <div class="col-sm-12">
                <table class="table">
                    <thead>
                        <tr style="font-weight:bold">
                            <td>ID</td>
                            <td>NAME</td>
                            <td>Deadline Date</td>
                            <td>Completed</td>
                            <td>Details</td>
                        </tr>
                    </thead>

                    <tbody>
                    <%
                        ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("zadachi");
                            for(Tasks task : tasks){
                                if(task !=null){
                    %>
                        <tr>
                            <td><%=task.getId()%></td>
                            <td><%=task.getName()%></td>
                            <td><%=task.getDeadlineDate()%></td>
                            <td><%
                                if(task.isCompleted()){
                                    out.print("YES");}
                                else{
                                    out.print("NO");
                                }
                            %></td>

                        <td><a href="/details?id=<%=task.getId()%>" class="btn btn-sm" style="background-color: darkblue; color:white">Details</a></td>
                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>


                </table>
            </div>
        </div>

    </div>

    <%@include file="vendor/footer.jsp"%>
</body>
</html>
