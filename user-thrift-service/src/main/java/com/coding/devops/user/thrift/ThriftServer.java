package com.coding.devops.user.thrift;

import com.coding.devops.thrift.user.UserService;
import org.apache.thrift.TProcessor;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.server.TNonblockingServer;
import org.apache.thrift.server.TServer;
import org.apache.thrift.transport.TNonblockingServerSocket;
import org.apache.thrift.transport.TTransportException;
import org.apache.thrift.transport.layered.TFramedTransport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

import javax.annotation.PostConstruct;

@Configuration
public class ThriftServer {
    private static final Logger log = LoggerFactory.getLogger(ThriftServer.class);

    @Value("${server.port}")
    private int servicePort;

    @Autowired private UserService.Iface userService;

    @PostConstruct
    public void startThriftServer() {
        TProcessor processor = new UserService.Processor<>(userService);
        TNonblockingServerSocket socket;
        try {
            socket = new TNonblockingServerSocket(servicePort);
        } catch (TTransportException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }

        TNonblockingServer.Args args = new TNonblockingServer.Args(socket);
        args.processor(processor);
        args.transportFactory(new TFramedTransport.Factory());
        args.protocolFactory(new TBinaryProtocol.Factory());

        log.info("java thrift servre start at port:" + servicePort);
        TServer server = new TNonblockingServer(args);
        server.serve();
        log.info("java thrift servre exit");
    }
}
