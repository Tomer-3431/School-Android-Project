import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:school_application/sidebar.dart';

class Analytics extends StatelessWidget {
  int showingTooltip = -1;

  BarChartGroupData generateGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: showingTooltip == x ? [0] : [],
      barRods: [BarChartRodData(toY: y)],
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    drawer: Sidebar.get(context),
    body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            SizedBox(height: 15),

            Center(
              child: Text(
                "Analytics",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            // LineChart(
            //   LineChartData(
            //     lineTouchData: LineTouchData(
            //       handleBuiltInTouches: true,
            //       touchTooltipData: LineTouchTooltipData(
            //         getTooltipColor: (touchedSpot) =>
            //             Colors.blueGrey.withValues(alpha: 0.8),
            //       ),
            //     ),
            //     gridData: FlGridData(show: false),
            //     titlesData: FlTitlesData(
            //       bottomTitles: AxisTitles(
            //         sideTitles: SideTitles(
            //           showTitles: true,
            //           reservedSize: 32,
            //           interval: 1,
            //           getTitlesWidget: (double value, TitleMeta meta) {
            //             const style = TextStyle(
            //               fontWeight: FontWeight.bold,
            //               fontSize: 16,
            //             );
            //             String text = switch (value.toInt()) {
            //               2 => 'SEPT',
            //               7 => 'OCT',
            //               12 => 'DEC',
            //               _ => '',
            //             };

            //             return SideTitleWidget(
            //               meta: meta,
            //               space: 10,
            //               child: Text(text, style: style),
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     borderData: FlBorderData(
            //       show: true,
            //       border: Border(
            //         bottom: BorderSide(color: Colors.purple),
            //         left: BorderSide(color: Colors.transparent),
            //         right: BorderSide(color: Colors.transparent),
            //         top: BorderSide(color: Colors.transparent),
            //       ),
            //     ),
            //     lineBarsData: [
            //       LineChartBarData(
            //         isCurved: true,
            //         color: Colors.green,
            //         barWidth: 8,
            //         isStrokeCapRound: true,
            //         dotData: FlDotData(show: false),
            //         belowBarData: BarAreaData(show: false),
            //         spots: [
            //           FlSpot(1, 1),
            //           FlSpot(3, 1.5),
            //           FlSpot(5, 1.4),
            //           FlSpot(7, 3.4),
            //           FlSpot(10, 2),
            //           FlSpot(12, 2.2),
            //           FlSpot(13, 1.8),
            //         ],
            //       ),
            //       LineChartBarData(
            //         isCurved: true,
            //         color: Colors.pink,
            //         barWidth: 8,
            //         isStrokeCapRound: true,
            //         dotData: const FlDotData(show: false),
            //         belowBarData: BarAreaData(
            //           show: false,
            //           color: Colors.pink.withValues(alpha: 0),
            //         ),
            //         spots: const [
            //           FlSpot(1, 1),
            //           FlSpot(3, 2.8),
            //           FlSpot(7, 1.2),
            //           FlSpot(10, 2.8),
            //           FlSpot(12, 2.6),
            //           FlSpot(13, 3.9),
            //         ],
            //       ),
            //       LineChartBarData(
            //         isCurved: true,
            //         color: Colors.cyan,
            //         barWidth: 8,
            //         isStrokeCapRound: true,
            //         dotData: const FlDotData(show: false),
            //         belowBarData: BarAreaData(show: false),
            //         spots: const [
            //           FlSpot(1, 2.8),
            //           FlSpot(3, 1.9),
            //           FlSpot(6, 3),
            //           FlSpot(10, 1.3),
            //           FlSpot(13, 2.5),
            //         ],
            //       ),
            //     ],
            //     minX: 0,
            //     maxX: 14,
            //     maxY: 4,
            //     minY: 0,
            //   ),
            //   duration: const Duration(milliseconds: 250),
            // ),
            Divider(),
            SizedBox(height: 50,),
            Image.asset("assets/Graph1.png"),
            Image.asset("assets/Graph2.png"),
          ],
        ),
      ),
    ),
  );
}
