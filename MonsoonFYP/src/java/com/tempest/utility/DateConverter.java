package com.tempest.utility;

import java.text.ParseException;
import java.util.Date;
import java.text.SimpleDateFormat;

public class DateConverter {

    /**
     * Formats a valid String representation of the date to a Date object
     *
     * @param dateString Date of type String
     * @return Returns a Date object
     * @throws ParseException if a Parse error occurs
     * 
     */
    public static Date yearMonthDay(String dateString) throws ParseException {
        SimpleDateFormat dateFmt = new SimpleDateFormat("yyyyMMdd");
        // dateString passed in must follow the format "yyyyMMdd" strictly
        dateFmt.setLenient(false);
        Date d = dateFmt.parse(dateString);
        return d;
    }

    /**
     * Formats a valid Date object into a String
     *
     * @param dateString Date of type String
     * @return Returns a String representation of the date
     * @throws ParseException if a Parse error occurs
     * 
     */
    public static String yearMonthDay(Date dateString) throws ParseException {
        SimpleDateFormat dateFmt = new SimpleDateFormat("yyyyMMdd");
        String d = dateFmt.format(dateString);
        return d;
    }

    /**
     * Formats time of String object into a Date object
     *
     * @param timeString Time of type String
     * @return Returns a Date object
     * @throws ParseException if a Parse error occurs
     * 
     */
    public static Date formatTimeHoursMins(String timeString) throws ParseException {
        SimpleDateFormat startFmt = new SimpleDateFormat("H:mm");
        // timeString passed in must follow the format "H:mm" strictly
        startFmt.setLenient(false);
        Date d = startFmt.parse(timeString);
        return d;
    }

    /**
     * Formats a Date object to type String
     *
     * @param dateString Date object
     * @return Returns a String representation of the Date object
     * @throws ParseException if a Parse error occurs
     */
    public static String formatDateToString(Date dateString) throws ParseException {
        SimpleDateFormat dateFmt = new SimpleDateFormat("H:mm");
        String s = dateFmt.format(dateString);
        return s;
    }

    /**
     * Formats a Date object into a String
     *
     * @param dateString Date object
     * @return Returns the date as a String object
     * @throws ParseException if a Parse error occurs
     */
    public static String formatDateToStringForJSON(Date dateString) throws ParseException {
        SimpleDateFormat dateFmt = new SimpleDateFormat("H:mm");
        String s = dateFmt.format(dateString);
        s = s.replaceAll(":", "");
        return s;
    }

    /**
     * Returns the date as a String
     *
     * @return Returns the date of type String
     */
    public static String getDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date resultdate = new Date(System.currentTimeMillis());
        return format.format(resultdate);
    }

    /**
     * Converts the Integer representation of a day to a String
     *
     * @param num The day of type Integer
     * @return Returns the name of the day as a String
     */
    public static String numberConvertToDay(int num) {
        switch (num) {
            case 1:
                return "Monday";
            case 2:
                return "Tuesday";
            case 3:
                return "Wednesday";
            case 4:
                return "Thursday";
            case 5:
                return "Friday";
            case 6:
                return "Saturday";
            case 7:
                return "Sunday";
            default:
                return null;
        }
    }
    
    public static String numberConvertToDayForTimetable(int num) {
        switch (num) {
            case 1:
                return "Mon";
            case 2:
                return "Tue";
            case 3:
                return "Wed";
            case 4:
                return "Thu";
            case 5:
                return "Fri";
            case 6:
                return "Sat";
            case 7:
                return "Sun";
            default:
                return null;
        }
    }
    
}
