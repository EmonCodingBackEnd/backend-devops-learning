package com.coding.devops.dubbo.demo;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

public class MainConsumer {

    // VM参数： -Djava.net.preferIPv4Stack=true
    public static void main(String[] args) throws IOException {
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext(new String[] {"dubbo-consumer.xml"});
        context.start();

        // obtain proxy object for remote invocation
        DemoService demoService = (DemoService) context.getBean("demoService");

        // execute remote invocation
        String hello = demoService.sayHello("world");

        // show the result
        System.out.println(hello);
    }
}
