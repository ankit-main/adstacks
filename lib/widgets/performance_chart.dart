import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          35, // extra bottom space
        ),
        child: LineChart(
          LineChartData(
            gridData: const FlGridData(show: true),

            borderData: FlBorderData(
              show: true,
            ),

            titlesData: FlTitlesData(
              topTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),

              rightTitles: const AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                ),
              ),

              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 30,
                  getTitlesWidget:
                      (value, meta) {
                    switch (value.toInt()) {
                      case 0:
                        return const Text("Jan");
                      case 1:
                        return const Text("Feb");
                      case 2:
                        return const Text("Mar");
                      case 3:
                        return const Text("Apr");
                      case 4:
                        return const Text("May");
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),

            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                barWidth: 4,
                spots: const [
                  FlSpot(0, 20),
                  FlSpot(1, 40),
                  FlSpot(2, 10),
                  FlSpot(3, 50),
                  FlSpot(4, 30),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}