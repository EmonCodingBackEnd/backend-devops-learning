package com.coding.devops.dubbo.demo.provider;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.IOException;

public class MainProvider {

    // VM参数： -Djava.net.preferIPv4Stack=true
    public static void main(String[] args) throws IOException {
        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext(new String[] {"dubbo-provider.xml"});
        context.start();

        // press any key to exit
        System.in.read();
    }
}
