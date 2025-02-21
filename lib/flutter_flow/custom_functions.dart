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
    startTime.hour + 2,
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
