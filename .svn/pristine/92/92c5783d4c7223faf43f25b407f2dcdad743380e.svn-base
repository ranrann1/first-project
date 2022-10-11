package ez_phone.util;

import java.security.MessageDigest;


import java.security.NoSuchAlgorithmException;
import java.util.Random;
import java.util.regex.Pattern;

//웹프로그램 작성에 필요한 부가적인 기능을 제공하기 위한 클래스
public class Utility {
	//문자열을 전달받아 암호화 처리하여 반환하는 메소드
	public static String encrypt(String source) {
		//암호화된 문자열을 저장하기 위한 변수 선언
		String password="";
		try {
			//MessageDigest 객체 : 암호화 처리 기능을 제공하는 객체
			//MessageDigest.getInstance(String algorithm) : 암호화 알고리즘이 저장된 MessageDigest 
			//객체를 생성하여 반환하는 메소드
			// => 매개변수에 잘못된 암호화 알고리즘을 전달할 경우 NoSuchAlgorithmException 발생
			//단방향 암호화 알고리즘 : MD5, SHA-1, SHA-256(권장), SHA-512 등
			//쌍방향 암호화 알고리즘 : AES-123, RSA 등
			MessageDigest messageDigest=MessageDigest.getInstance("SHA-256");
			
			//String.getBytes() : String 객체에 저장된 문자열을 원시데이타(byte 배열)로 변환하여 반환하는 메소드
			//MessageDigest.update(byte[] input) : MessageDigest 객체로 암호화 처리하기 위한 
			//값(byte 배열)을 저장하기 위한 메소드 
			messageDigest.update(source.getBytes());
			
			//MessageDigest.digest() : MessageDigest 객체에 저장된 암호화 알고리즘과 원시데이타를 
			//이용하여 암호화 처리된 값(byte 배열)을 반환하는 메소드
			byte[] digest=messageDigest.digest();
			
			//암호화 처리된 원시데이타(byte 배열)을 문자열(String 객체)로 변환하여 저장
			for(int i=0;i<digest.length;i++) {
				//Integer.toHexString(int i) : 숫자값을 16진수의 문자열로 변환하여 반환하는 메소드
				password+=Integer.toHexString(digest[i]&0xff);
			}
		} catch (NoSuchAlgorithmException e) {
			System.out.println("[에러]잘못된 암호화 알고리즘을 사용 하였습니다.");
		}
		return password;		
	}
	
	//문자열을 전달받아 태그 관련 문자열을 모두 제거하여 반환하는 메소드
	public static String stripTag(String source) {
		//Pattern : 정규표현식 관련 기능을 제공하는 클래스
		//Pattern.compile(String regEx) : 정규표현식이 저장된 Pattern 객체를 생성하여 반환하는 메소드
		Pattern htmlTag=Pattern.compile("\\<.*?\\>");
		
		//Pattern.matcher(CharSequence input) : Pattern 객체의 정규표현식과 입력값이 저장된
		//Matcher 객체를 생성하여 반환하는 메소드
		//Matcher 객체 : 정규표현식과 입력값을 비교 처리하기 위한 다양한 기능을 제공하는 객체 
		//Matcher.replaceAll(String replacement) : 입력값에서 정규표현식의 패턴과 같은 문자열을
		//모두 검색하여 치환 문장열로 변환하여 반환하는 메소드
		source=htmlTag.matcher(source).replaceAll("");//문자열에서 태그를 제거하여 반환
		
		return source;
	}
	
	//문자열을 전달받아 태그 관련 기호를 회피문자로 변환하여 반환하는 메소드
	public static String escapeTag(String source) {
		return source.replace("<", "&lt;").replace(">", "&gt;");
	}
	
	//임시비밀번호를 생성하여 반환하는 메소드
	public static String newPassword() {
		//Random 객체 : 난수값 관련 기능을 제공하기 위한 객체
		Random random=new Random(); 
		
		//비밀번호로 사용될 문자들로 구성된 문자열 생성
		String str="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		
		String password="";
		for(int i=1;i<=8;i++) {
			//String.chatAt(int index) : 문자열에 첨자(index)위치의 문자를 반환하는 메소드
			//String.length() : 문자열의 문자 갯수를 반환하는 메소드
			//Random.nextInt(int bound) : 0~bound-1 범위의 정수값을 무작위로 추출하여 반환하는 메소드 
			password+=str.charAt(random.nextInt(str.length()));
		}
		
		return password;
	}
}









