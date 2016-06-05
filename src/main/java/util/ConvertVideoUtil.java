package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

public class ConvertVideoUtil {
	public static boolean toSegments(String fileName, String input,String output, int type) {
		output = output+"\\"+fileName.replace(".mp4", "").replace(".", "");
		File f = new File(output);
		
		if (f.exists() && f.isDirectory()) {
			
		}else{
			f.mkdir();
		}	
		String statement="ffmpeg -i "+input+"\\"+fileName+" -codec copy -map 0 -f segment -segment_list "+output+"\\"+"playlist.m3u8  "+output+"\\out%03d.ts";
		System.out.println(statement);
		return executeCmd(statement);
		
	}
	
	public static boolean executeCmd(String statement){
		try {
			/*ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c",
					"cd \"C:\\Program Files\\Microsoft SQL Server\" && dir");*/
			ProcessBuilder builder = new ProcessBuilder("cmd.exe", "/c",
					statement);
			builder.redirectErrorStream(true);
			Process p = builder.start();
			BufferedReader r = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String line;
			while (true) {
				line = r.readLine();
				if (line == null) {	
					break;	
				}
				System.out.println(line);
				if(line.toLowerCase().contains("failed")){
					return false;
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
