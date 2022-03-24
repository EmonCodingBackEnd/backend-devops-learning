import smtplib
import sys
from email.header import Header
from email.mime.text import MIMEText

from thrift.protocol import TBinaryProtocol
from thrift.server import TServer
from thrift.transport import TSocket
from thrift.transport import TTransport

from message.api import MessageService

# sender = 'imoocd@163.com'
# authCode = 'aA111111'
sender = 'liming20110711@163.com'
authCode = 'LZDCGOJBYISXMTAT'


class MessageServiceHandler:
    def sendMobileMessage(self, mobile, message):
        print("sendMobileMessage, mobile:" + mobile + ", message:" + message)
        return True

    def sendEmailMessage(self, email, message):
        print("sendEmailMessage, email:" + email + ", message:" + message)
        messageObj = MIMEText(message, "plain", "utf-8")
        messageObj['From'] = sender
        messageObj['to'] = email
        messageObj['Subject'] = Header('慕课网邮件', 'utf-8')
        try:
            smtpObj = smtplib.SMTP('smtp.163.com')
            smtpObj.login(sender, authCode)
            smtpObj.sendmail(sender, [email], messageObj.as_string())
            print("send mail success")
            return True
        except smtplib.SMTPException as ex:
            print("send mail failed!")
            print(ex)
            return False


if __name__ == '__main__':
    print("Python版本", sys.version_info[0])
    handler = MessageServiceHandler()
    processor = MessageService.Processor(handler)
    transport = TSocket.TServerSocket("0.0.0.0", 9090)
    tfactory = TTransport.TFramedTransportFactory()
    pfactory = TBinaryProtocol.TBinaryProtocolFactory()

    server = TServer.TSimpleServer(processor, transport, tfactory, pfactory)
    print("python thrift servre start at port:9090")
    server.serve()
    print("python thrift servre exit")
