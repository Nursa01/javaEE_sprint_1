package kz.javaee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.javaee.db.DBManager;
import kz.javaee.db.Tasks;

import java.io.IOException;

@WebServlet(value="/update")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long id = Long.parseLong(req.getParameter("id"));
        String name=req.getParameter("name");
        String description=req.getParameter("description");
        String deadlineDate = req.getParameter("deadLineDate");
        boolean completed = Boolean.parseBoolean(req.getParameter("completed"));

        Tasks task = DBManager.getTask(id);
        if(task!=null){
            task = new Tasks(id, name, description, deadlineDate,completed);
            DBManager.updateTask(task);
        }

        resp.sendRedirect("/home");
    }
}
