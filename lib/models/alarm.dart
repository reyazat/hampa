class AlarmModel {
  final int hour;
  final int min;
  final String title;
  final bool enabled;
  final Map<String, bool> selectedDays;

  AlarmModel({
    this.enabled = true,
    required this.hour,
    required this.min,
    required this.title,
    required this.selectedDays,
  });
}
