package com.hxy.util.jms;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * @desc Json处理java对象到json格式转换的日期处理类
 * 
 */
public class JsonDateValueProcessor implements JsonValueProcessor {
	private String datePattern = "yyyy-MM-dd HH:mm:ss";// 日期格式

	public JsonDateValueProcessor() {
		super();
	}

	// 构造函数
	public JsonDateValueProcessor(String format) {
		super();
		this.datePattern = format;
	}

	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	public Object processObjectValue(String key, Object value,
			JsonConfig jsonConfig) {
		return process(value);
	}

	private Object process(Object value) {
		try {
			if (value instanceof Date) {
				SimpleDateFormat sdf = new SimpleDateFormat(datePattern,
						Locale.UK);
				return sdf.format((Date) value);
			}
			return value == null ? "" : value.toString();
		} catch (Exception e) {
			return "";
		}
	}

	public String getDatePattern() {
		return datePattern;
	}

	public void setDatePattern(String datePaterns) {
		this.datePattern = datePaterns;
	}

}