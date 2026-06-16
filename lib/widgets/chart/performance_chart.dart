import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.navy,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
          Row(
            children: [
              const Text(
                "Performance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              Icon(
                Icons.more_horiz,
                color: Colors.white.withOpacity(.8),
              ),
            ],
          ),

          const SizedBox(height: 25),

          /// LEGEND
          Row(
            children: [
              _legend(
                Colors.deepPurpleAccent,
                "Pending Done",
              ),
              const SizedBox(width: 20),
              _legend(
                Colors.pinkAccent,
                "Project Done",
              ),
            ],
          ),

          const SizedBox(height: 25),

          Expanded(
            child: LineChart(
              _chartData(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legend(Color color, String title) {
    return Row(
      children: [
        Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  LineChartData _chartData() {
    return LineChartData(
      minY: 0,
      maxY: 100,

      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        horizontalInterval: 20,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),

      borderData: FlBorderData(show: false),

      titlesData: FlTitlesData(
        topTitles: const AxisTitles(
          sideTitles:
              SideTitles(showTitles: false),
        ),

        rightTitles: const AxisTitles(
          sideTitles:
              SideTitles(showTitles: false),
        ),

        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            getTitlesWidget:
                (value, meta) {
              return Text(
                value.toInt().toString(),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 10,
                ),
              );
            },
          ),
        ),

        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget:
                (value, meta) {
              const months = [
                "Jan",
                "Feb",
                "Mar",
                "Apr",
                "May",
                "Jun"
              ];

              if (value.toInt() >=
                  months.length) {
                return const SizedBox();
              }

              return Padding(
                padding:
                    const EdgeInsets.only(
                  top: 10,
                ),
                child: Text(
                  months[value.toInt()],
                  style:
                      const TextStyle(
                    color:
                        Colors.white54,
                  ),
                ),
              );
            },
          ),
        ),
      ),

      lineTouchData: LineTouchData(
        enabled: true,
        touchTooltipData:
            LineTouchTooltipData(
          tooltipRoundedRadius: 12,
        ),
      ),

      lineBarsData: [
        LineChartBarData(
          isCurved: true,

          color:
              Colors.deepPurpleAccent,

          barWidth: 4,

          dotData:
              const FlDotData(show: false),

          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurpleAccent
                    .withOpacity(.4),
                Colors.transparent,
              ],
            ),
          ),

          spots: const [
            FlSpot(0, 20),
            FlSpot(1, 40),
            FlSpot(2, 35),
            FlSpot(3, 70),
            FlSpot(4, 60),
            FlSpot(5, 90),
          ],
        ),

        LineChartBarData(
          isCurved: true,

          color: Colors.pinkAccent,

          barWidth: 4,

          dotData:
              const FlDotData(show: false),

          spots: const [
            FlSpot(0, 10),
            FlSpot(1, 30),
            FlSpot(2, 55),
            FlSpot(3, 40),
            FlSpot(4, 75),
            FlSpot(5, 65),
          ],
        ),
      ],
    );
  }
}