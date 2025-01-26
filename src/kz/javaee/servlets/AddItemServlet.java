package kz.javaee.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.javaee.db.DBManager;
import kz.javaee.db.Tasks;

import java.io.IOException;

@WebServlet(value="/add")
public class AddItemServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String description = req.getParameter("description");
        String deadLineDate = req.getParameter("deadlineDate");

        Tasks task = new Tasks();
        task.setName(name);
        task.setDescription(description);
        task.setDeadlineDate(deadLineDate);
        task.setCompleted(false);

        DBManager.addTask(task);
        resp.sendRedirect("/home?success");
    }
}
