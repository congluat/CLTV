package util;

import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

public class DateTimeUtil {
	public static Date getCurrentGMTTime(){
		TimeZone timeZone = TimeZone.getTimeZone("GMT");
		Calendar calendar = Calendar.getInstance(timeZone);
		return calendar.getTime();
	}
}
