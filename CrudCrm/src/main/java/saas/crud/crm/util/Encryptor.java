package saas.crud.crm.util;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class Encryptor {
	
	// DB 양방향 암호화 MG 
	public static void main(String[] args) {
			StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
			        
			        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
			        pbeEnc.setPassword("jasyptPass"); // PBE 값(XML PASSWORD설정)
			        
			        String url = pbeEnc.encrypt("jdbc:mysql://125.129.242.156:3306/Crud_SaaS");
			        String username = pbeEnc.encrypt("root");
			        String password = pbeEnc.encrypt("crudsystem1008!");
			        
			        String url2 = pbeEnc.decrypt("/B3Ny5El/An4wUaLsCtKXz/vnwub/3KlikbSwpa0rpWRBGu6Dx8hP1dUdp1TSzji7MxezXQaQy0=");
			        System.out.println("URL= "+url);
			        System.out.println("USERNAME= "+username);
			        System.out.println("PASSWORD= "+password);
    }
	
}
