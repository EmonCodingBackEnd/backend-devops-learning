package com.coding.devops.course.controller;

import com.coding.devops.course.dto.CourseDTO;
import com.coding.devops.course.service.ICourseService;
import com.coding.devops.thrift.user.dto.UserDTO;
import org.apache.dubbo.config.annotation.DubboReference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class CourseController {

    @DubboReference private ICourseService courseService;

    @RequestMapping(value = "/courseList", method = RequestMethod.GET)
    @ResponseBody
    public List<CourseDTO> courseList(HttpServletRequest request) {
        UserDTO userDTO = (UserDTO) request.getAttribute("user");
        System.out.println(userDTO.toString());
        return courseService.courseList();
    }
}
