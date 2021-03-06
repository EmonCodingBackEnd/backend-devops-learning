package com.coding.devops.course.service;

import com.coding.devops.course.dto.CourseDTO;
import com.coding.devops.course.mapper.CourseMapper;
import com.coding.devops.course.thrift.ThriftServiceProvider;
import com.coding.devops.thrift.user.UserInfo;
import com.coding.devops.thrift.user.dto.TeacherDTO;
import org.apache.dubbo.config.annotation.DubboService;
import org.apache.thrift.TException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@DubboService
public class CourseServiceImpl implements ICourseService {

    @Autowired private CourseMapper courseMapper;
    @Autowired private ThriftServiceProvider thriftServiceProvider;

    @Override
    public List<CourseDTO> courseList() {
        List<CourseDTO> courseDTOS = courseMapper.listCourse();
        if (courseDTOS != null) {
            for (CourseDTO courseDTO : courseDTOS) {
                Integer teacherId = courseMapper.getCourseTeacher(courseDTO.getId());
                if (teacherId != null) {
                    try {
                        UserInfo userInfo =
                                thriftServiceProvider.getUserService().getTeacherById(teacherId);
                        courseDTO.setTeacher(trans2Teacher(userInfo));
                    } catch (TException e) {
                        e.printStackTrace();
                        return null;
                    }
                }
            }
        }
        return courseDTOS;
    }

    private TeacherDTO trans2Teacher(UserInfo userInfo) {
        TeacherDTO teacherDTO = new TeacherDTO();
        BeanUtils.copyProperties(userInfo, teacherDTO);
        return teacherDTO;
    }
}
