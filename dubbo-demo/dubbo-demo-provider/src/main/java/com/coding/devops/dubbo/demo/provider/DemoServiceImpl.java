package com.coding.devops.dubbo.demo.provider;

import com.coding.devops.dubbo.demo.DemoService;

public class DemoServiceImpl implements DemoService {
    @Override
    public String sayHello(String name) {
        return "Hello " + name;
    }
}
