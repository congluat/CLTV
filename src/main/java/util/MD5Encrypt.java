package util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @17/04/2016
 * @author congluat
 */
public class MD5Encrypt {
	
	/**
	 * {@link http://www.mkyong.com/java/java-md5-hashing-example/}
	 * @param input a string that you want to hash
	 * @return a string with length 32.
	 */
	public static String hashString(String input) {
		try {
			MessageDigest md;
			md = MessageDigest.getInstance("MD5");
			md.update(input.getBytes());
			byte byteData[] = md.digest();

			// convert the byte to hex format method 1
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}

			// convert the byte to hex format method 2
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1)
					hexString.append('0');
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {

			e.printStackTrace();
		}
		return null;
	}
}
