import 'package:flutter/material.dart';

class EventModel {
  final String imageUrl;
  final String title;
  final String description;
  final bool isRepetitive;
  final DateTime? startDate;
  final DateTime? endDate;
  final TimeOfDay? repeatTime;

  EventModel({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.isRepetitive,
    this.startDate,
    this.endDate,
    this.repeatTime,
  });
}
