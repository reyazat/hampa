import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityModel {
  final String title;
  final IconData icon;
  final int amount;
  final String unit;
  final List<ChartData> history;

  ActivityModel({
    required this.title,
    required this.icon,
    required this.amount,
    required this.unit,
    required this.history,
  });

  List<ColumnSeries<ChartData, String>> get columnSeries {
    return <ColumnSeries<ChartData, String>>[
      ColumnSeries<ChartData, String>(
        dataSource: history,
        color: MainColors.primaryColor,
        dataLabelSettings: const DataLabelSettings(
          isVisible: true,
          labelAlignment: ChartDataLabelAlignment.top,
        ),
        borderRadius: BorderRadius.circular(10),
        xValueMapper: (ChartData sales, _) => sales.x,
        yValueMapper: (ChartData sales, _) => sales.y,
      ),
    ];
  }
}

class ChartData {
  final String x;
  final num y;

  ChartData({required this.x, required this.y});
}
