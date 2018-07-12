package ru.javawebinar.topjava.util;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DateTimeUtil {
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");

    public static <T extends Comparable<T>> boolean isBetween(T dateOrTime, T start, T end) {
        if (start == null && end == null) return true;
        return start == null ?
                dateOrTime.compareTo(end) <= 0 :
                end == null ?
                        dateOrTime.compareTo(start) >= 0 :
                        dateOrTime.compareTo(start) >= 0 && dateOrTime.compareTo(end) <= 0;
    }

    public static String toString(LocalDateTime ldt) {
        return ldt == null ? "" : ldt.format(DATE_TIME_FORMATTER);
    }

}
