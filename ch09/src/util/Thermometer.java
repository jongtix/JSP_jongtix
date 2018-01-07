package util;

import java.util.HashMap;
import java.util.Map;

public class Thermometer {
	private Map<String, Double> locationCelsius = new HashMap<>();

	public void setCelsius(String location, Double value) {
		locationCelsius.put(location, value);
	}

	public Double getCelsius(String location) {
		return locationCelsius.get(location);
	}

	public Double getFahrenheit(String location) {
		Double celsius = getCelsius(location);
		if (celsius == null) {
			return null;
		}
		return celsius.doubleValue() * 1.8 + 32.0;
	}

	public String getInfo() {
		return "온도계 변환기 1.1";
	}
}