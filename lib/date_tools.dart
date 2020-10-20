import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:persian_date/persian_date.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import 'string.dart';

/// This class uses [persian_date] and [persian_datetime_picker] packages for jalali dates.
class GabtimaticDateUtils {
  GabtimaticDateUtils({this.isJalali = false});

  bool isJalali;

  // Get Date times
  int nowTimeStamp({bool withTime = true}) =>
      nowDateTime(withTime: withTime).millisecondsSinceEpoch;

  DateTime nowDateTime({bool withTime = true}) => (withTime)
      ? DateTime.now()
      : DateTime.fromMillisecondsSinceEpoch(
          removeTimeFromDate(DateTime.now().millisecondsSinceEpoch));

  int removeTimeFromDate(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return DateTime(date.year, date.month, date.day).millisecondsSinceEpoch;
  }

  /// Returns an String like: 'Tuesday, 25 Oct, 2020'
  String dateTimeToFancyString(DateTime dateTime) {
    if (isJalali) {
      var persianDate = PersianDate(gregorian: dateTime.toString());
      return (persianDate.weekdayname +
          '، ' +
          persianDate.day.toString() +
          ' ' +
          persianDate.monthname +
          ' ' +
          persianDate.year.toString());
    } else
      return DateFormat('EEEE, d MMM, yyyy').format(dateTime);
  }

  String getTimeFromDateTime(DateTime dateTime) =>
      dateTime.hour.toString().gAddExtraZero +
      ':' +
      dateTime.minute.toString().gAddExtraZero;

  String getTimeFromTimeOfDay(TimeOfDay timeOfDay) =>
      timeOfDay.hour.toString().gAddExtraZero +
      ':' +
      timeOfDay.minute.toString().gAddExtraZero;

  // Timestamps
  String readTimestamp(int timestamp, {bool withTime = true}) => (isJalali)
      ? _readJalaliTimestamp(timestamp, withTime)
      : _readGregorianTimestamp(timestamp, withTime);

  String _readGregorianTimestamp(int timestamp, bool withTime) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return (withTime)
        ? (date.year.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.day.toString() +
            ', at ' +
            date.hour.toString().gAddExtraZero +
            ':' +
            date.minute.toString().gAddExtraZero)
        : (date.year.toString() +
            '/' +
            date.month.toString() +
            '/' +
            date.day.toString());
  }

  String _readJalaliTimestamp(int timestamp, bool withTime) {
    var persianDate = PersianDate(
        gregorian: DateTime.fromMillisecondsSinceEpoch(timestamp).toString());
    return (withTime)
        ? (persianDate.year.toString() +
            '/' +
            persianDate.month.toString() +
            '/' +
            persianDate.day.toString() +
            '، ' +
            persianDate.hour.toString().gAddExtraZero +
            ':' +
            persianDate.minute.toString().gAddExtraZero)
        : (persianDate.year.toString() +
            '/' +
            persianDate.month.toString() +
            '/' +
            persianDate.day.toString());
  }

  // Date pickers
  Future<DateTime> showDatePickerDateTime(BuildContext context,
          {DateTime initialDate,
          DateTime firstDate,
          DateTime lastDate}) async =>
      (isJalali)
          ? await _showJalaliDatePicker(
              context, initialDate, firstDate, lastDate)
          : await _showGregorianDatePicker(
              context, initialDate, firstDate, lastDate);

  Future<int> showDatePickerTimestamp(BuildContext context,
          {DateTime initialDate,
          DateTime firstDate,
          DateTime lastDate,
          bool forWeb}) async =>
      (await showDatePickerDateTime(context,
              initialDate: initialDate,
              firstDate: firstDate,
              lastDate: lastDate))
          .millisecondsSinceEpoch;

  Future<DateTime> _showGregorianDatePicker(BuildContext context,
      DateTime initialDate, DateTime firstDate, DateTime lastDate) async {
    var nowDate = DateTime.now();
    return (await showDatePicker(
        context: context,
        initialDate: initialDate ?? nowDate,
        firstDate:
            firstDate ?? DateTime(nowDate.year, nowDate.month, nowDate.day),
        lastDate: lastDate ?? DateTime(nowDate.year).add(Duration(days: 365)),
        builder: (ctx, child) => child));
  }

  Future<DateTime> _showJalaliDatePicker(BuildContext context,
      DateTime initialDate, DateTime firstDate, DateTime lastDate) async {
    var initialJalaliDate = PersianDate(
        gregorian: initialDate.toString().isEmpty
            ? DateTime.now().toString()
            : initialDate.toString());
    var firstJalaliDate = PersianDate(
        gregorian: firstDate.toString().isEmpty
            ? DateTime.now().toString()
            : initialDate.toString());
    var lastJalaliDate = PersianDate(
        gregorian:
            lastDate ?? DateTime.now().add(Duration(days: 365)).toString());

    String pickedDate;
    await showDialog(
        context: context,
        child: PersianDateTimePicker(
          initial:
              "${initialJalaliDate.year}/${initialJalaliDate.month}/${initialJalaliDate.day}",
          min:
              "${firstJalaliDate.year}/${firstJalaliDate.month}/${firstJalaliDate.day}",
          max:
              "${lastJalaliDate.year}/${lastJalaliDate.month}/${lastJalaliDate.day}",
          onSelect: (date) => pickedDate = date,
        ));

    if (pickedDate.gIsEmpty) return null;

    return PersianDate().jalaliToGregorian(pickedDate.replaceAll('/', '-'));
  }

  // Time picker
  Future<TimeOfDay> showTheTimePicker(BuildContext context,
      {bool use24HourFormat = true}) async {
    TimeOfDay picked = (await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext context, Widget child) => MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(alwaysUse24HourFormat: use24HourFormat),
            child: child)));
    if (picked == null) return null;
    return picked;
  }
}
