import 'package:app/features/presentation/widgets/graph_card.dart';
import 'package:flutter/material.dart';

class LastUpdatedBar extends StatelessWidget {
  const LastUpdatedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SwipeableIndicatorSection();
  }
}

class SwipeableIndicatorSection extends StatefulWidget {
  const SwipeableIndicatorSection({super.key});

  @override
  State<SwipeableIndicatorSection> createState() =>
      _SwipeableIndicatorSectionState();
}

class _SwipeableIndicatorSectionState extends State<SwipeableIndicatorSection> {
  final PageController _controller = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier<int>(0);

  final int pageCount = 2;

  @override
  void dispose() {
    _controller.dispose();
    _currentPage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 450, // tall enough to fit either page fully; tune on device
          child: PageView(
            controller: _controller,
            onPageChanged: (index) => _currentPage.value = index,
            children: const [_ScoreSummaryPage(), GraphCard()],
          ),
        ),
        const SizedBox(height: 12),
        ValueListenableBuilder<int>(
          valueListenable: _currentPage,
          builder: (context, current, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pageCount, (index) {
                final isActive = index == current;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: isActive ? 28 : 8,
                  height: isActive ? 6 : 8,
                  decoration: BoxDecoration(
                    color: isActive
                        ? const Color(0xff16C172)
                        : const Color(0xffD8D8D8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            );
          },
        ),
      ],
    );
  }
}

// Page 1 — your original active badge / circular score / text content
class _ScoreSummaryPage extends StatelessWidget {
  const _ScoreSummaryPage();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          // Active Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xffE7F9ED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Color(0xff25B869), size: 16),
                SizedBox(width: 5),
                Text(
                  "Score Improvement Plan Active",
                  style: TextStyle(
                    color: Color(0xff2D2D2D),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Score
              SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      width: 130,
                      height: 130,
                      child: CircularProgressIndicator(
                        value: 0,
                        strokeWidth: 12,
                        color: Colors.green,
                        backgroundColor: Color(0xffEFEFEF),
                      ),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "-1",
                          style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0A1033),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Last Updated",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "12 May 2026",
                          style: TextStyle(
                            color: Color(0xff5E77A4),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 18),

              // Right Side
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Score Improvement Plan",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff313131),
                      ),
                    ),

                    const SizedBox(height: 18),

                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "0%",
                            style: TextStyle(
                              color: Color(0xff16C172),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: " Completed",
                            style: TextStyle(color: Colors.black, fontSize: 22),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0,
                        minHeight: 6,
                        backgroundColor: Color(0xffDDDDDD),
                        color: Color(0xff16C172),
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "May 2025",
                      style: TextStyle(color: Colors.grey),
                    ),

                    const SizedBox(height: 18),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xff16C172)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Refresh my Score",
                              style: TextStyle(
                                color: Color(0xff16C172),
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Color(0xff16C172),
                              size: 18,
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

          const SizedBox(height: 35),

          const Align(
            alignment: Alignment.center,
            child: Text(
              "Your Credit Score Is -1",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff262626),
              ),
            ),
          ),

          const SizedBox(height: 6),

          const Align(
            alignment: Alignment.center,
            child: Text(
              "You Have Not Taken Any Loan Till Now.",
              style: TextStyle(fontSize: 18, color: Color(0xff313131)),
            ),
          ),
        ],
      ),
    );
  }
}
