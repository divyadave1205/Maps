// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class PyramidCharts extends StatefulWidget {
  const PyramidCharts({Key? key}) : super(key: key);

  @override
  _PyramidChartsState createState() => _PyramidChartsState();
}

class _PyramidChartsState extends State<PyramidCharts> {
  List<ChartData> chartData = [
    ChartData("Jan", 35),
    ChartData("Feb", 28),
    ChartData("Mar", 34),
    ChartData("Apr", 32),
    ChartData("May", 40),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Circular Charts",
        ),
      ),
      body: Center(
        child: Container(
          child: SfPyramidChart(
            backgroundColor: Colors.yellow[300],
            selectionGesture: ActivationMode.longPress,
            borderColor: Colors.black, borderWidth: 3,
            enableMultiSelection: false,
            // ignore: prefer_const_literals_to_create_immutables
            palette: [
              Colors.yellow,
              Colors.blue,
              Colors.limeAccent[400]!,
              Colors.green,
              Colors.red,
            ],
            title: ChartTitle(text: "Half Yearly Sales Analysis"),
            legend: Legend(
              //it shows fields of chart.
              isVisible: true,
              alignment: ChartAlignment.center,
              backgroundColor: Colors.blue,
              borderWidth: 2,
              height: "100",
              iconBorderColor: Colors.white,
              iconBorderWidth: 2,
              isResponsive: true,
              position: LegendPosition.bottom,
              iconHeight: 10,
              opacity: 0.9,
              overflowMode: LegendItemOverflowMode.scroll,
              orientation: LegendItemOrientation.vertical,
            ),
            tooltipBehavior: TooltipBehavior(
              animationDuration: 20,
              enable: true,
            ),
            series: PyramidSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
