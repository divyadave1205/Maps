// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SparkArea extends StatefulWidget {
  const SparkArea({Key? key}) : super(key: key);

  @override
  _SparkAreaState createState() => _SparkAreaState();
}

class _SparkAreaState extends State<SparkArea> {
  List<SalesData> data = [
    SalesData("Jan", 35),
    SalesData("Feb", 28),
    SalesData("Mar", 34),
    SalesData("Apr", 32),
    SalesData("May", 40),
    SalesData("Jun", 50),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Circular Charts",
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                SfSparkAreaChart(
                  data: <double>[10, 6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10],
                ),
                SizedBox(
                  height: 40,
                ),
                SfSparkLineChart(
                  data: <double>[10, 6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10],
                ),
                SizedBox(
                  height: 40,
                ),
                SfSparkAreaChart.custom(
                  xValueMapper: (int index) => data[index].month,
                  yValueMapper: (int index) => data[index].sales,
                  dataCount: 5,
                ),
                SizedBox(
                  height: 40,
                ),
                SfSparkBarChart(
                  negativePointColor: Colors.purple,
                  firstPointColor: Colors.orange,
                  lastPointColor: Colors.pink,
                  highPointColor: Colors.green,
                  lowPointColor: Colors.red,
                  axisLineDashArray: [2, 2, 2, 2, 2],
                  axisLineColor: Colors.red,
                  trackball: SparkChartTrackball(color: Colors.red),
                  data: <double>[10, 6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10],
                ),
                SizedBox(
                  height: 40,
                ),
                SfSparkWinLossChart(
                  data: <double>[10, 6, 8, -5, 11, 5, -2, 7, -3, 6, 8, 10],
                  tiePointColor: Colors.yellow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
