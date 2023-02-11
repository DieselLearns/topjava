package ru.javawebinar.topjava.web;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import ru.javawebinar.topjava.model.MealTo;
import ru.javawebinar.topjava.util.MealsUtil;

public class MealServlet extends HttpServlet {

    private static Logger log = LoggerFactory.getLogger(MealServlet.class);

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        log.debug("redirect to meals");
        req.setAttribute("meals",getMeals());

        req.getRequestDispatcher("/meals.jsp").forward(req, resp);

//        resp.sendRedirect("meals.jsp");
    }

    private static List<MealTo> getMeals(){
        return MealsUtil.filteredByStreams(MealsUtil.mealsMock, LocalTime.MIN,LocalTime.MAX,MealsUtil.CALORIES_PER_DAY);
    }
}
