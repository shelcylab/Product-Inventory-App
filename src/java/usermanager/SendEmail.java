package usermanager;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

/**
 *
 * @author shelc
 */
public class SendEmail {

    private static String USER_NAME = "shelcy.shajit";  // Mail user name (just the part before "@gmail.com")
    private static String PASSWORD = " "; // password
    private static String RECIPIENT = "shelcy.shajit@gmail.com";

    public static void main(String[] args) {
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = {RECIPIENT}; // list of recipient email addresses
        String subject = "Test email of java application!!";
        String body = "Good Evening!!";

        sendFromGMail(from, pass, to, subject, body);
    }

    private static void sendFromGMail(String from, String pass, String[] to, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        // String host="localhost";
        // props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");
        // props.put("mail.smtp.host", host);
        props.put("mail.smtp.ssl.trust", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");//587
        props.put("mail.smtp.auth", "true");
        //System.out.println("success point 1");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            //System.out.println("success point 2");

            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];

            // To get the array of addresses
            for (int i = 0; i < to.length; i++) {
                toAddress[i] = new InternetAddress(to[i]);
            }

            for (int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }

            //System.out.println("success point 3");
            message.setSubject(subject);
            message.setText(body);
            // System.out.println("success point 4");

            Transport transport = session.getTransport("smtp");
            // System.out.println("success point 5");

            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            //System.out.println("success 6");
        } catch (AddressException ae) {
            ae.printStackTrace();
        } catch (MessagingException me) {
            me.printStackTrace();
        }
    }

}
