// exp on string

import 'package:dio/dio.dart';
import 'package:todolist/data/network/failure.dart';
import 'package:todolist/data/responses/responses.dart';

import '/locale/app_locale_init.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../app/constant.dart';
import 'dart:convert';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return EMPTY;
    } else {
      return this!;
    }
  }
}

extension htmlTag on String {
  String removeHtmlTags() {
    final RegExp exp = RegExp(r'<[^>]*>');
    return this.replaceAll(exp, '');
  }
}

extension AmountString on num? {
  String toAmount() {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return "GH₵ ${myFormat.format(this)}";
  }
}

extension AmountStringWithoutCurrenty on num? {
  String toAmountStringWithoutCurrenty() {
    NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
    return "${myFormat.format(this)}";
  }
}

//ext for int

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return ZERO;
    } else {
      return this!;
    }
  }
}

extension LocaleString on String {
  String localeString(BuildContext? context) {
    return context == null
        ? EMPTY
        : ApplicationLocalizations.of(context)?.translate(this) ?? EMPTY;
  }
}

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

extension DateConvertString on DateTime {
  String toDateString() {
    return DateFormat.yMMMd().format(this);
  }
}

extension DateMonthYearConvertString on DateTime {
  String toDateMonthYearString() {
    return "${DateFormat.MMM().format(this)} ${DateFormat.y().format(this)}";
  }
}

extension DateString on DateTime {
  String toDateMonthString() {
    return DateFormat.MMM().format(this);
  }
}

extension DateMonthConvertString on DateTime {
  String toDateMonthString() {
    return DateFormat.MMM().format(this);
  }
}

extension ToJsonString on Map<String, dynamic> {
  String toJsonRequest() {
    return jsonEncode(this);
  }
}

extension PhoneIndiaValidator on String {
  bool isValidPhone() {
    return RegExp(
            r'^(\+\d{1,2}\s?)?1?\-?\.?\s?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$')
        .hasMatch(this);
  }
}

extension DIAERROMSG on DioError {
  Failure setDioError() {
    final res = this.response.toString();
    final decriptValue = jsonDecode(res.substring(1, res.length - 1));
    final response = CommonResponse.fromJson(decriptValue);
    return Failure(response.status, response.message);
  }
}

extension MailIndiaValidator on String {
  bool isValidMail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }
}
