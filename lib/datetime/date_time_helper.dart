String convertDateTimeToString(DateTime dateTime) {
  // year in the form of yyyy
  String year = dateTime.year.toString();

  // month in the form of mm
  String month = dateTime.month.toString();
  if (month.length == 1) {
    month = "0" + month;
  }

  // day in the form of dd
  String day = dateTime.day.toString();
  if (day.length == 1) {
    day = "0" + day;
  }

  // final string in the form of yyyy-mm-dd
  String yyymmdd = year + month + day;
  return yyymmdd;
}
