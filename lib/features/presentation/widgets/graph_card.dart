  // Requires: fl_chart: ^0.68.0 (add to pubspec.yaml)
  import 'package:app/features/presentation/widgets/build_value_bard.dart';
import 'package:flutter/material.dart';
  import 'package:fl_chart/fl_chart.dart';

  class GraphCard extends StatelessWidget {
    const GraphCard({super.key});

    @override
    Widget build(BuildContext context) {
      final List<FlSpot> solidSpots = const [
        FlSpot(0, 720),
        FlSpot(1, 750),
        FlSpot(2, 785),
        FlSpot(3, 805),
        FlSpot(4, 820),
      ];

      final List<FlSpot> dottedSpots = const [FlSpot(4, 820), FlSpot(5, 845)];

      final labels = ["720", "750", "785", "805", "820"];
      final labelColors = [
        const Color(0xffF8C9C9),
        const Color(0xffFCE3A4),
        const Color(0xffFCE3A4),
        const Color(0xffBEEBD0),
        const Color(0xff16C172),
      ];
      final labelTextColors = [
        const Color(0xffB23B3B),
        const Color(0xff8A6A1E),
        const Color(0xff8A6A1E),
        const Color(0xff1F7A4D),
        Colors.white,
      ];

      final dates = ["31 Dec", "31 Jan", "28 Feb", "31 Mar", "30 Apr", "31 May"];

      return Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Your Score Progress",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff262626),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Track your credit score improvement over time",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("6 Months", style: TextStyle(fontSize: 12)),
                      SizedBox(width: 4),
                      Icon(Icons.keyboard_arrow_down, size: 16),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Score labels above the points (manually positioned)
            SizedBox(
              height: 230,
              child: Stack(
                children: [
                  LineChart(
                    LineChartData(
                      minX: 0,
                      maxX: 5,
                      minY: 700,
                      maxY: 870,
                      gridData: FlGridData(
                        show: true,
                        drawVerticalLine: false,
                        horizontalInterval: 50,
                        getDrawingHorizontalLine: (value) =>
                            FlLine(color: Colors.grey.shade200, strokeWidth: 1),
                      ),
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 50,
                            reservedSize: 36,
                            getTitlesWidget: (value, meta) => Text(
                              value.toInt().toString(),
                              style: const TextStyle(
                                fontSize: 11,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            reservedSize: 28,
                            getTitlesWidget: (value, meta) {
                              final i = value.toInt();
                              if (i < 0 || i >= dates.length) {
                                return const SizedBox.shrink();
                              }
                              return Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(
                                  dates[i],
                                  style: const TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      lineBarsData: [
                        // Solid line with gradient fill
                        LineChartBarData(
                          spots: solidSpots,
                          isCurved: true,
                          color: const Color(0xff16C172),
                          barWidth: 2.5,
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, bar, index) {
                              final isLast = index == solidSpots.length - 1;
                              return FlDotCirclePainter(
                                radius: isLast ? 6 : 4,
                                color: const Color(0xff16C172),
                                strokeWidth: isLast ? 4 : 0,
                                strokeColor: const Color(0xffBEEBD0),
                              );
                            },
                          ),
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xff16C172).withOpacity(0.18),
                                const Color(0xff16C172).withOpacity(0.0),
                              ],
                            ),
                          ),
                        ),
                        // Dotted projection line
                        LineChartBarData(
                          spots: dottedSpots,
                          isCurved: true,
                          color: const Color(0xff16C172),
                          barWidth: 2,
                          dashArray: [5, 5],
                          dotData: FlDotData(
                            show: true,
                            getDotPainter: (spot, percent, bar, index) {
                              final isProjected = index == 1;
                              return FlDotCirclePainter(
                                radius: 4,
                                color: isProjected
                                    ? Colors.white
                                    : Colors.transparent,
                                strokeWidth: 1.5,
                                strokeColor: const Color(0xff16C172),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Manually placed value badges (since fl_chart doesn't support
                  // tooltips above dots out of the box without interaction)
                  ...buildValueBadges(labels, labelColors, labelTextColors),

                  Positioned(
                    right: 4,
                    top: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffE7F9ED),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xff16C172),
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Text(
                        "845",
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff16C172),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Bottom banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xffE7F9ED),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Container(
                    width: 34,
                    height: 34,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.trending_up,
                      color: Color(0xff16C172),
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(fontSize: 13, color: Color(0xff262626)),
                        children: [
                          TextSpan(text: "Your Score Improved By "),
                          TextSpan(
                            text: "100 Points!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xff16C172),
                            ),
                          ),
                          TextSpan(
                            text: "\nKeep up the great work!",
                            style: TextStyle(color: Colors.black54, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
    