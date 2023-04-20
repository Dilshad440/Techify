import 'package:flutter/material.dart';

class AppUtility {
  static String getTimeFromDate(String? date) {
    if (date == null) {
      return "";
    } else {
      DateTime now = DateTime.parse(date);
      Duration diff = DateTime.now().difference(now);
      if (diff.inDays > 365) {
        return "${(diff.inDays / 365).floor()} ${(diff.inDays / 365).floor() == 1 ? "year" : "years"} ago";
      }
      if (diff.inDays > 30) {
        return "${(diff.inDays / 30).floor()} ${(diff.inDays / 30).floor() == 1 ? "month" : "months"} ago";
      }
      if (diff.inDays > 7) {
        return "${(diff.inDays / 7).floor()} ${(diff.inDays / 7).floor() == 1 ? "week" : "weeks"} ago";
      }
      if (diff.inDays > 0) {
        return "${diff.inDays} ${diff.inDays == 1 ? "day" : "days"} ago";
      }
      if (diff.inHours > 0) {
        return "${diff.inHours} ${diff.inHours == 1 ? "hour" : "hours"} ago";
      }
      if (diff.inMinutes > 0) {
        return "${diff.inMinutes} ${diff.inMinutes == 1 ? "minute" : "minutes"} ago";
      }
      return "just now";
    }
  }

  static void showInSnackBar({required String msg, required BuildContext context}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        content: Text(
          msg,
        ),
        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
        elevation: 8,
      ),
    );
  }
}
