package com.utbm.lo54.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import com.utbm.lo54.project.entity.Client;


@Service
public class NotificationService {
	
	private JavaMailSender javaMailSender;

	@Autowired
	public NotificationService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void sendNotification(Client client) throws MailException {
		SimpleMailMessage mail = new SimpleMailMessage();
		
		mail.setTo(client.getEmail());
		mail.setFrom("lo54.p2019@gmail.com");
		mail.setSubject("Confirmation inscription.");
		mail.setText("Nous vous confirmons votre inscription avec succès au cours.");
		
		javaMailSender.send(mail);
	}
}
