package com.coding.devops.course.service;

import com.coding.devops.course.dto.CourseDTO;

import java.util.List;

public interface ICourseService {
    List<CourseDTO> courseList();
}
