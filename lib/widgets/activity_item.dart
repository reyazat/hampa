import 'package:fitness/models/activity.dart';
import 'package:fitness/utils/num_api.dart';
import 'package:fitness/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityItem extends StatelessWidget {
  final bool expanded;
  final ActivityModel activity;
  final void Function() onTap;

  const ActivityItem({required this.activity, required this.expanded, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 15,
        fontFamily: 'Shabnam',
        fontWeight: FontWeight.w600,
        color: MainColors.grayDarkest,
      ),
      child: AnimatedContainer(
        height: expanded ? 200 : 50,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 250),
        margin: EdgeInsets.only(bottom: expanded ? 10 : 0),
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: expanded ? 15 : 0,
        ),
        decoration: BoxDecoration(
          color: expanded ? MainColors.grayLightest : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Row(
                children: <Widget>[
                  Icon(activity.icon, color: MainColors.primaryColor),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        activity.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: MainColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Text(activity.amount.toFaString()),
                  const SizedBox(width: 5),
                  Text(activity.unit),
                ],
              ),
              Visibility(
                visible: expanded,
                child: Expanded(
                  // height: 150,
                  child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    primaryXAxis: CategoryAxis(
                      labelStyle: const TextStyle(color: MainColors.grayDarkest, fontFamily: 'Shabnam'),
                      axisLine: const AxisLine(width: 0),
                      labelPosition: ChartDataLabelPosition.outside,
                      majorTickLines: const MajorTickLines(width: 0),
                      majorGridLines: const MajorGridLines(width: 0),
                    ),
                    primaryYAxis: NumericAxis(isVisible: false),
                    series: activity.columnSeries,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
