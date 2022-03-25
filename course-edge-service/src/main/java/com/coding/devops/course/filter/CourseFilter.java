package com.coding.devops.course.filter;

import com.coding.devops.thrift.user.dto.UserDTO;
import com.coding.devops.user.client.LoginFilter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Component
public class CourseFilter extends LoginFilter {
    @Value("${user.edge.service.addr}")
    private String userEdgeServiceAddr;

    @Override
    protected String userEdgeServiceAddr() {
        return userEdgeServiceAddr;
    }

    @Override
    protected void login(
            HttpServletRequest request, HttpServletResponse response, UserDTO userDTO) {
        request.setAttribute("user", userDTO);
    }
}
