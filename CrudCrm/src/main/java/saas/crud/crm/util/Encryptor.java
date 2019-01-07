package saas.crud.crm.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class Encryptor {
	
	// DB 양방향 암호화 MG 
	public static void main(String[] args) {
			StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
			        
			        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
			        pbeEnc.setPassword("jasyptPass"); // PBE 값(XML PASSWORD설정)
			        
			        String url = pbeEnc.encrypt("jdbc:sqlserver://211.233.81.186:3306/Crud_SaaS");
			        String username = pbeEnc.encrypt("root");
			        String password = pbeEnc.encrypt("crudsystem1008!");
			        
			        String url2 = pbeEnc.decrypt("a8IzRdzVpQ+iPwrR4N4jpBEORCa0UyP9ENsh1fnNgAYLZs4gT3V5ZDpA3eflSKgXo1RSPG4R/YEOix10xDBCE32rmsoU5UoR");
			        System.out.println("URL= "+url);
			        System.out.println("USERNAME= "+username);
			        System.out.println("PASSWORD= "+password);
    }
	
}
