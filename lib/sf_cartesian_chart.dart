// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class FlutterCharts extends StatefulWidget {
  const FlutterCharts({Key? key}) : super(key: key);

  @override
  _FlutterChartsState createState() => _FlutterChartsState();
}

class _FlutterChartsState extends State<FlutterCharts> {
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
          "Syncfusion Flutter Charts",
        ),
      ),
      body: Column(
        children: [
          SfCartesianChart(
            primaryXAxis: CategoryAxis(),
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
            series: <ChartSeries<SalesData, String>>[
              LineSeries(
                trendlines: [
                  Trendline(
                    color: Colors.green,
                  ),
                ],
                xAxisName: "sales",
                markerSettings: MarkerSettings(
                  color: Colors.red,
                  isVisible: true,
                ),
                emptyPointSettings: EmptyPointSettings(
                  color: Colors.green,
                  borderColor: Colors.lightGreen,
                  mode: EmptyPointMode.drop,
                  borderWidth: 3,
                ),
                yAxisName: "month",
                dashArray: [
                  20,
                  20,
                  20,
                ],
                color: Colors.yellow[900],
                isVisible: true,
                isVisibleInLegend: true,
                animationDelay: 70,
                legendIconType: LegendIconType.circle,
                dataSource: data,
                xValueMapper: (SalesData sales, _) => sales.month,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: "Sales",
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SfSparkLineChart.custom(
                lowPointColor: Colors.red,
                highPointColor: Colors.green,
                firstPointColor: Colors.blue,
                lastPointColor: Colors.blue,
                isInversed: false,
                plotBand: SparkChartPlotBand(
                  color: Colors.yellow[300]!,
                ),
                color: Colors.yellow[900]!,
                trackball: SparkChartTrackball(
                  color: Colors.black,
                  backgroundColor: Colors.black,
                  shouldAlwaysShow: true,
                  activationMode: SparkChartActivationMode.tap,
                ),
                marker: SparkChartMarker(
                  shape: SparkChartMarkerShape.square,
                  displayMode: SparkChartMarkerDisplayMode.all,
                ),
                labelDisplayMode: SparkChartLabelDisplayMode.all,
                xValueMapper: (int index) => data[index].month,
                yValueMapper: (int index) => data[index].sales,
                dataCount: 6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;
}
