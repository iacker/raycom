package io.raycom.components.mail;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import io.raycom.utils.string.StringUtils;

@Component
public class MailProperties {

	@Value("${email.host}")
	private  String mailHost;
	//25是smtp的默认端口号
	@Value("${email.port}")
	private  int mailPort = 25;
	private  String charSet = "utf-8";
	@Value("${email.sendFrom}")
	private  String mailFromAccount ;
	@Value("${email.account}")
	private  String mailAccount ;
	@Value("${email.username}")
	private  String mailUserName;
	@Value("${email.password}")
	private  String mailPassword;
	@Value("${email.isSSL}")
	private  String mailIsSSL;
	
	public String getMailIsSSL() {
		return mailIsSSL;
	}
	public void setMailIsSSL(String mailIsSSL) {
		this.mailIsSSL = mailIsSSL;
	}
	public String getMailHost() {
		return mailHost;
	}
	public void setMailHost(String mailHost) {
		this.mailHost = mailHost;
	}
	
	public int getMailPort() {
		return mailPort;
	}
	
	public void setMailPort(int mailPort) {
		this.mailPort = mailPort;
	}
	
	public String getCharSet() {
		return charSet;
	}
	
	public void setCharSet(String charSet) {
		this.charSet = charSet;
	}
	
	public String getMailAccount() {
		return mailAccount;
	}
	public void setMailAccount(String mailAccount) {
		this.mailAccount = mailAccount;
	}
	public String getMailUserName() {
		if(StringUtils.isEmpty(mailAccount))
			mailUserName = mailAccount;
		return mailUserName;
	}
	public void setMailUserName(String mailUserName) {
		this.mailUserName = mailUserName;
	}
	public String getMailPassword() {
		return mailPassword;
	}
	public void setMailPassword(String mailPassword) {
		this.mailPassword = mailPassword;
	}
	public String getMailFromAccount() {
		return mailFromAccount;
	}
	public void setMailFromAccount(String mailFromAccount) {
		this.mailFromAccount = mailFromAccount;
	}
	
}
