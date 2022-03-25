package com.coding.devops.course.thrift;

import com.coding.devops.thrift.user.UserService;
import org.apache.thrift.protocol.TBinaryProtocol;
import org.apache.thrift.protocol.TProtocol;
import org.apache.thrift.transport.TSocket;
import org.apache.thrift.transport.TTransport;
import org.apache.thrift.transport.TTransportException;
import org.apache.thrift.transport.layered.TFramedTransport;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class ThriftServiceProvider {

    @Value("${thrift.user.ip}")
    private String userServerIp;

    @Value("${thrift.user.port}")
    private int userServerPort;

    public UserService.Client getUserService() throws TTransportException {
        TProtocol protocol = gettProtocol(userServerIp, userServerPort);
        if (protocol == null) return null;
        return new UserService.Client(protocol);
    }

    private TProtocol gettProtocol(String serverIp, int serverPort) throws TTransportException {
        TSocket socket = new TSocket(serverIp, serverPort, 3000);
        TTransport transport = new TFramedTransport(socket);
        try {
            transport.open();
        } catch (TTransportException e) {
            e.printStackTrace();
            return null;
        }

        return new TBinaryProtocol(transport);
    }
}
