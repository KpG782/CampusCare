import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> generateListOfNames(
  String authUserName,
  String otherUserName,
) {
  return [authUserName, otherUserName];
}

List<DocumentReference> generateNewListofUsers(
  DocumentReference authUser,
  DocumentReference otherUser,
) {
  return [authUser, otherUser];
}

String getOtherUserName(
  List<String> listOfNames,
  String authUserName,
) {
  return authUserName == listOfNames.first
      ? listOfNames.last
      : listOfNames.first;
}

DocumentReference getOtherUserRef(
  List<DocumentReference> listOfUserRefs,
  DocumentReference authUserRef,
) {
  return authUserRef == listOfUserRefs.first
      ? listOfUserRefs.last
      : listOfUserRefs.first;
}

List<DateTime>? getAvailableSlots(
  List<DateTime> bookings,
  DateTime dateArg,
  List<AvailabilityStruct> availability,
) {
  final now = DateTime.now();
  final twoWeeksFromNow = now.add(Duration(days: 14));

  // Return empty list if the requested date is in the past or beyond two weeks
  if (dateArg.isBefore(now) || dateArg.isAfter(twoWeeksFromNow)) {
    return [];
  }

  List<DateTime> availableSlots = [];

  for (var avail in availability) {
    if (avail.dayofWeek == DateFormat('EEEE').format(dateArg)) {
      if (avail.hasStartTime() && avail.hasEndTime()) {
        DateTime startTime = DateTime(
          dateArg.year,
          dateArg.month,
          dateArg.day,
          avail.startTime!.hour,
          avail.startTime!.minute,
        );
        DateTime endTime = DateTime(
          dateArg.year,
          dateArg.month,
          dateArg.day,
          avail.endTime!.hour,
          avail.endTime!.minute,
        );

        while (startTime.isBefore(endTime)) {
          // Skip past slots and already booked slots
          if (startTime.isAfter(now) && !bookings.contains(startTime)) {
            availableSlots.add(startTime);
          }
          startTime = startTime.add(Duration(hours: 2));
        }
      }
    }
  }

  return availableSlots;
}

List<AvailabilityStruct>? initialAvailability() {
  // generate 7 random array for each day of the week
  final List<AvailabilityStruct> availability = [];

  final List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];

  for (final day in daysOfWeek) {
    // final startTime = DateTime(2023, 1, daysOfWeek.indexOf(day) + 2, 0, 0);
    // final endTime = DateTime(2023, 1, daysOfWeek.indexOf(day) + 2, 0, 0);
    availability.add(
        AvailabilityStruct(dayofWeek: day, startTime: null, endTime: null));
  }

  return availability;
}

DateTime? stringtoTime(
  String? hourArg,
  DateTime? dateArg,
) {
  // output the combinatioon of date from dateArg and hourArg (HH:mm format)
  if (hourArg == null || dateArg == null) {
    return null;
  }

  final List<String> parts = hourArg.split(':');
  if (parts.length != 2) {
    return null;
  }

  final int hour = int.tryParse(parts[0]) ?? 0;
  final int minute = int.tryParse(parts[1]) ?? 0;

  return DateTime(dateArg.year, dateArg.month, dateArg.day, hour, minute);
}

DateTime addTwoHours(DateTime startTime) {
  // Add two hours to the provided DateTime
  return DateTime(
    startTime.year,
    startTime.month,
    startTime.day,
    startTime.hour + 1,
    startTime.minute,
    startTime.second,
    startTime.millisecond,
    startTime.microsecond,
  );
}

DateTime? currentTwoWeeks(DateTime? currentTime) {
  // make a function that add two weeks to the time added
  if (currentTime == null) {
    return null;
  }

  return currentTime.add(Duration(days: 14));
}

String? createUid(String? sessionType) {
  // // create a code that generates and id that starts with 001 then adds the first letter of the sessionType making it like a format of 001-F for example then it must be 002 for the next, so it will be unique also make sure that the old id will not be used
  // Initialize a variable to hold the last generated ID
  String lastId = '000';

  // Check if the last ID is not null and has the correct format
  if (lastId != null && lastId.length == 3) {
    // Extract the numeric part of the last ID
    int lastNum = int.tryParse(lastId) ?? 0;

    // Increment the numeric part by 1
    lastNum++;

    // Format the numeric part to have leading zeros
    String newNum = lastNum.toString().padLeft(3, '0');

    // Create the new ID by combining the numeric part and the first letter of sessionType
    String newId = '$newNum-${sessionType?[0].toUpperCase()}';

    return newId;
  }

  return null;
}

String? convertToUid(DocumentReference? bookRef) {
// make a function that converts the argument bookref to string
  if (bookRef != null) {
    return bookRef.id;
  } else {
    return null;
  }
}

String? convertToText(dynamic json) {
  if (json == null) return null;

  if (json is String) {
    return json; // Already a string, return as is
  } else if (json is Map<String, dynamic>) {
    return json.toString(); // Convert Map to string representation
  } else if (json is List) {
    return json
        .map((e) => e.toString())
        .join(", "); // Convert list elements to string
  } else {
    return json.toString(); // Convert other types to string
  }
}

String? getRandomQuoteCopy() {
  // List of quote categories.
  List<String> categories = [
    "Confidence",
    "Motivation",
    "Mindfulness",
    "Gratitude",
    "Resilience"
  ];

  // Create a random instance and shuffle the list for randomness.
  final random = math.Random();
  categories.shuffle(random);

  String? selectedCategory;

  // Loop through the shuffled list.
  for (var category in categories) {
    // If the category starts with 'M', skip this iteration.
    if (category.startsWith('M')) {
      continue;
    }
    // Select the first category that doesn't start with 'M'
    selectedCategory = category;
    // Break out of the loop once a valid category is chosen.
    break;
  }

  // Fallback: if no valid category was found in the loop, return a random category.
  return selectedCategory ?? categories[random.nextInt(categories.length)];
}

String? getRandomQuote() {
  // List of categories
  List<String> categories = [
    "Confidence",
    "Motivation",
    "Mindfulness",
    "Gratitude",
    "Resilience"
  ];

  // Select a random category
  final random = math.Random();
  return categories[random.nextInt(categories.length)];
}

int? calculateReview(int? ratings) {
  List<int> ratings = [5, 4, 3, 5, 4];
  int total = 0;

  for (int i = 0; i < ratings.length; i++) {
    total += ratings[i];
  }
  return total;
}

DateTime? getStartOfMonth() {
  final date = DateTime.now();
  return DateTime(date.year, date.month, 1);
}

DateTime? getStartOfNextMonth() {
  final date = DateTime.now();
  if (date.month == 12) {
    return DateTime(date.year + 1, 1, 1);
  } else {
    return DateTime(date.year, date.month + 1, 1);
  }
}

DateTime? getSevenDaysAgo() {
  DateTime? getSevenDaysAgo() {
    final now = DateTime.now();
    return now.subtract(const Duration(days: 7));
  }
}

List<String> combineActivitiesFromMoodLogs(List<MoodLogRecord> moodLogs) {
  final List<String> allActivities = [];

  for (final moodLog in moodLogs) {
    final activities = moodLog.activities;
    if (activities != null && activities.isNotEmpty) {
      allActivities.addAll(
        activities.where((activity) => activity.trim().isNotEmpty),
      );
    }
  }

  return allActivities;
}

List<String>? countOccurrencesInActivityList() {
  int countOccurrencesInActivityList(
      List<String> actLogs, String targetActivity) {
    return actLogs
        .where((activity) =>
            activity.trim().toLowerCase() ==
            targetActivity.trim().toLowerCase())
        .length;
  }
}

List<double> countWeeklyMoods(List<MoodLogRecord> logs) {
  final labels = ['sadness', 'joy', 'love', 'anger', 'fear', 'surprise'];
  final counts = List<double>.filled(labels.length, 0.0);
  final cutoff = DateTime.now().subtract(Duration(days: 7));

  for (final rec in logs) {
    if (rec.date != null && rec.date!.isAfter(cutoff)) {
      final idx = labels.indexOf(rec.moodLabel ?? '');
      if (idx >= 0) {
        counts[idx] += 1;
      }
    }
  }
  return counts;
}

String? getDominantMood(List<double>? weeklyMoodCounts) {
  if (weeklyMoodCounts == null || weeklyMoodCounts.isEmpty) return null;

  // Mood labels corresponding to chart positions
  final moodLabels = ['Sadness', 'Joy', 'Love', 'Anger', 'Fear', 'Surprise'];

  // Find the index of the max value
  int maxIndex = 0;
  for (int i = 1; i < weeklyMoodCounts.length; i++) {
    if (weeklyMoodCounts[i] > weeklyMoodCounts[maxIndex]) {
      maxIndex = i;
    }
  }

  return moodLabels[maxIndex];
}

DateTime getDateDaysAgo(int days) {
  return DateTime.now().subtract(Duration(days: days));
}
