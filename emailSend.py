import os
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.application import MIMEApplication

def email_send(email,password,verify):
    msg = MIMEMultipart()
    msg["From"] = 'vishavmahajan96@gmail.com'
    msg['To'] = email
    msg['Subject'] = 'Registration on AdRENTure'
    #filename = "Rahul.txt"
    #with open(filename,'r') as f:
     #   message = MIMEText(f.read(),_subtype = 'txt')
        #msg.add_header('Content-disposition','attatchment', filename = filename)
        #msg.attach(message)
    body = 'Thanks For Registering With us \n'+"\n"+"Your Login Credentials are :- \n"\
    +"Username: "+ email +"\n"+ "Password: "+password+"\n"+"\n"+"Please Verify your email address by clicking on the link below to access your Account\n"+\
           "\n"+"Your Verification Link is \n" + verify

    msg.attach(MIMEText(body,'plain'))
    server = smtplib.SMTP('smtp.gmail.com',587)
    server.starttls()
    server.login('vishavmahajan96@gmail.com','vishav@123')
    text = msg.as_string()
    server.sendmail(msg["From"],msg['To'],text)
    server.quit()
    print('mail sent')

def otp_send(email,otp, subject, message,type):
        msg = MIMEMultipart()
        msg["From"] = 'vishavmahajan96@gmail.com'
        msg['To'] = email
        msg['Subject'] = subject
        #filename = "Rahul.txt"
        #with open(filename,'r') as f:
         #   message = MIMEText(f.read(),_subtype = 'txt')
            #msg.add_header('Content-disposition','attatchment', filename = filename)
            #msg.attach(message)
        body ="Your " + message + " Credentials are :- \n"\
        +"Username: "+ email +"\n"+ type+": " + str(otp)

        msg.attach(MIMEText(body,'plain'))
        server = smtplib.SMTP('smtp.gmail.com',587)
        server.starttls()
        server.login('vishavmahajan96@gmail.com','vishav@123')
        text = msg.as_string()
        server.sendmail(msg["From"],msg['To'],text)
        server.quit()


def email_invoice(email,invoice):
    msg = MIMEMultipart()
    msg["From"] = 'vishavmahajan96@gmail.com'
    msg['To'] = email
    msg['Subject'] = 'Booking Invoice #'+invoice




    filename = "AdRENTureDashboard.pdf"
    with open(filename,'rb') as f:
        message = MIMEApplication(f.read(), _subtype='pdf')
        msg.add_header('Content-disposition','inline', filename = filename)
        msg.attach(message)


    body = 'Thanks For Booking \n'+"\n"+"Your Invoice is attached below :- \n"\
    "\n"

    msg.attach(MIMEText(body,'plain'))
    server = smtplib.SMTP('smtp.gmail.com',587)
    server.starttls()
    server.login('vishavmahajan96@gmail.com','vishav@123')
    text = msg.as_string()
    server.sendmail(msg["From"],msg['To'],text)
    server.quit()
    print('mail sent')


#email_invoice("sanyamm02@gmail.com","327638")