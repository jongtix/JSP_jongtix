package util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public static String format(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
		return sdf.format(date);
	}
}
