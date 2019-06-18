package com.utbm.lo54.project.service;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import com.utbm.lo54.project.entity.Client;

@Service
public class NotificationService {
	
	private JavaMailSender javaMailSender;

	@Autowired
	public NotificationService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void sendNotification(Client client) throws MailException, MessagingException {
		/*SimpleMailMessage mail = new SimpleMailMessage();
		
		mail.setTo(client.getEmail());
		mail.setFrom("lo54.p2019@gmail.com");
		mail.setSubject("Confirmation inscription.");
		
		String htmlMessage = "<h1>Bonjour " + client.getFirstName() + "</h1>, <br>nous vous confirmons votre inscription avec succès à la session N°"+ client.getCourseSession().getId() +"concernant le cours : <strong>" + client.getCourseSession().getCourse().getTitle()+"</strong>";
		mail.setText(htmlMessage);
		
		javaMailSender.send(mail);*/
		
		MimeMessage mail = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(mail, true);
		
		helper.setTo(client.getEmail());
		helper.setFrom("contact@lo54.utbm.fr");
		helper.setSubject("Confirmation de votre inscription au cours : "+client.getCourseSession().getCourse().getTitle());
		
		String htmlMessage = "<h1>Bonjour " + client.getFirstName() + ",</h1> <h3>Nous vous confirmons votre inscription avec succès à la session N°"+ client.getCourseSession().getId() +" concernant le cours : <strong>" + client.getCourseSession().getCourse().getTitle()+"</strong>.<br>Bien cordialement,</h3><hr>L'équipe pédagogique de LO54-P2019.<br><br><hr><em>Message généré automatiquement, merci de ne pas y répondre.</em>";
	
		helper.setText(htmlMessage, true);
		
		javaMailSender.send(mail); 
		
	}
}
