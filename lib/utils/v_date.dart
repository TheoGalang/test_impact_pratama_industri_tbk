import 'package:intl/intl.dart';

class VDate {
  static String localFormat = "dd/MM/yyyy";
  static String localFormat2 = "dd-MM-yyyy";
  static String postFormat = "yyyy/MM/dd";
  static String dateDisplay = "d MMM yyyy";
  static String dateProfile = "d MMM yyyy";
  static String termConverter = "yyyy-MM-dd";
  static String tempDate = "yyyy-MM-dd HH:mm:ss";
  static String fullDateAlbum = "d MMMM yyyy, h:mm a";
  static String nonYear = "d MMMM";
  static String timeFormat = "HH:mm";
  static String dayFormat = "EEEE";
  static String fullDate = "EEEE, d MMMM yyyy";
  static String articleDate = "MMMM dd, yyyy";
  static const FORMAT_DD_MMMM_YYYY = "dd MMMM yyy";

  static String forDate(String date) {
    return DateFormat(articleDate).format(DateTime.parse(date).toLocal());
  }
  static String forDateTimeParse(String date) {
    return DateFormat(tempDate).format(DateTime.parse(date).toLocal());
  }

  static String forHour(String date) {
    return DateFormat(timeFormat).format(DateTime.parse(date).toLocal());
  }

  static String forDateTime(String date){
    return DateFormat("dd MMMM yyyy\t\u2022\tHH:mm").format(DateTime.parse(date).toLocal());
  }

  static bool isOutOfDate(String date) {
    return DateTime.parse(date).isBefore(DateTime.now());
  }

  static String compareWithNow(String date) {
    DateTime dataDate =
    DateTime.parse(date.isEmpty ? DateTime.now().toString() : date);
    DateTime now = DateTime.now();
    int seconds = now.difference(dataDate).inSeconds;
    if (seconds >= 60) {
      int minutes = now.difference(dataDate).inMinutes;
      if (minutes >= 60) {
        int hours = now.difference(dataDate).inHours;
        if (hours < 24) {
          return "$hours Jam yang lalu";
        } else {
          int days = now.difference(dataDate).inDays;
          if (days < 30) {
            return "$days Hari yang lalu";
          }
          else if (days >= 30) {
            int month = days ~/ 30;
            return "$month Bulan yang lalu";
          } else if (days >= 365) {
            int year = days ~/ 365;
            return "$year Tahun yang lalu";
          } else {
            return "";
          }
        }
      } else {
        return "$minutes Menit yang lalu";
      }
    } else {
      if (seconds == 0) {
        return "Baru saja";
      } else {
        return "${seconds.abs()} Detik yang lalu";
      }
    }
  }

  static String tempDateToDisplay(DateTime date) {
    return DateFormat(tempDate).format(date);
  }

  static String dateToDisplay(DateTime date) {
    return DateFormat(fullDate).format(date);
  }

  static String stringToDisplay(String date) {
    return DateFormat(dateDisplay).format(DateTime.parse(date));
  }

  static String stringToLocalFile(String date) {
    return DateFormat(fullDate, "id_ID").format(DateTime.parse(date).toLocal());
  }

  static String stringToLocalFormat(String date) {
    return DateFormat(localFormat, "id_ID").format(DateTime.parse(date).toLocal());
  }


  static String stringToDashDate(String date) {
    return DateFormat(termConverter).format(DateTime.parse(date));
  }

  static DateTime stringToDateTime(String date) {
    return DateTime.parse(date).toLocal();
  }

  static DateTime addDateFromNow(int count) {
    var date = DateTime.now().add(Duration(days: count));
    return date;
  }

  static String getDayStatus(DateTime then) {
    String result;
    bool isYesterday, isTomorrow, isToday;
    DateTime now = DateTime.now();
    isYesterday = now.subtract(Duration(days: 1)).day == then.day &&
        now.subtract(Duration(days: 1)).month == then.month;
    isToday = now.day == then.day && now.month == then.month;
    isTomorrow = now.add(Duration(days: 1)).day == then.day &&
        now.add(Duration(days: 1)).month == then.month;
    if (isToday) {
      result = "Today";
    } else if (isTomorrow) {
      result = "Tomorrow";
    } else if (isYesterday) {
      result = "Yesterday";
    } else {
      result = withoutYear(then);
    }
    return result;
  }

  static List<DateTime> getDaysFromNow(int count, DateTime now) {
    var sixtyDaysFromNow = now.add(Duration(days: count));
    List<DateTime> days = [];
    for (int i = 0; i < sixtyDaysFromNow.difference(now).inDays; i++) {
      days.add(now.add(Duration(days: i)));
    }
    return days;
  }

  static List<String> getDaysFromNowInString(List<DateTime> dates) {
    List<String> result = [];
    for (int i = 0; i < dates.length; i++) {
      result.add(withoutYear(dates[i]));
    }
    return result;
  }

  static String dateToFulldate(DateTime date) {
    return DateFormat(fullDate).format(date);
  }

  static String stringToProfileDisplay(String date) {
    DateTime formatter = DateFormat("dd-MM-yyyy").parse(date);
    return DateFormat(fullDate).format(formatter);
  }

  static String stringToTermConvert(String date) {
    DateTime formatter = DateFormat("dd-MM-yyyy").parse(date);
    return DateFormat(localFormat2).format(formatter);
  }

  static String withoutYear(DateTime date) {
    return DateFormat(nonYear).format(date);
  }

  static String dateToPostFormat(DateTime date) {
    return DateFormat(postFormat).format(date);
  }

  static String monthOnly(DateTime date) {
    return DateFormat("MMM").format(date);
  }

  static DateTime stringtoDateProfile(String date) {
    return DateTime.parse(date);
  }

  static String getDifferentYear(String src) {
    DateTime dateSrc = DateTime.parse(src);
    Duration dur = DateTime.now().difference(dateSrc);
    int different = (dur.inDays / 365).floor();
    String year = different > 1 ? "years" : "year";
    return different > 0
        ? different.toString() + " " + year + " old"
        : getDifferentMonth(src);
  }

  static String getDifferentMonth(String src) {
    DateTime dateSrc = DateTime.parse(src);
    Duration dur = DateTime.now().difference(dateSrc);
    int months = (dur.inDays / 365).floor() * 12;
    int fullmonths = (dur.inDays / 30).floor();
    int different = fullmonths - months;
    String month = different > 1 ? "months" : "month";
    return different > 0
        ? different.toString() + " " + month
        : getDifferentDays(src);
  }

  static String getDifferentDays(String src) {
    DateTime dateSrc = DateTime.parse(src);
    Duration dur = DateTime.now().difference(dateSrc);
    int days = (dur.inDays / 30).floor();
    int fulldays = (dur.inDays).floor();
    int different = fulldays - days;
    String day = different > 1 ? "days" : "day";
    return different > 0 ? different.toString() + " " + day : "";
  }

  // for thread screen



  static String getTimeForChat(DateTime src) {
    return DateFormat.jm().format(src);
  }



  static String convertDaysToMonth({int days = 0}) {
    if (days > 300) {
      return "1 Tahun";
    } else if (days > 29) {
      var month = days / 30;
      return "${month.toInt()} Bulan";
    } else {
      return "$days Hari";
    }
  }

  static String getDateDetailAlbum(String src) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    DateTime date = dateFormat.parse(
        src); //You will get date object relative to server/client timezone wherever it is parsed
    DateFormat formatter = DateFormat(
        "EEEE"); //If you ne need time just put specific format for time like 'HH:mm:ss'
    String dateStr = formatter.format(date);
    return dateStr;
  }

  static String getTimeForAlbum(String src) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    DateTime date = dateFormat.parse(
        src); //You will get date object relative to server/client timezone wherever it is parsed
    DateFormat formatter = DateFormat(
        "HH:mm:ss"); //If you ne need time just put specific format for time like 'HH:mm:ss'
    String dateStr = formatter.format(date);
    return dateStr;
  }

  static String getFullDateAlbumImage(String src) {
    return DateFormat(fullDateAlbum).format(DateTime.parse(src));
  }

  static String getTimeCheck(String src) {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
    DateTime date = dateFormat.parse(
        src); //You will get date object relative to server/client timezone wherever it is parsed
    DateFormat formatter = DateFormat(
        "yyyy-MM-dd'T'HH:mm:ss'Z'"); //If you ne need time just put specific format for time like 'HH:mm:ss'
    String dateStr = formatter.format(date);
    return dateStr;
  }

}