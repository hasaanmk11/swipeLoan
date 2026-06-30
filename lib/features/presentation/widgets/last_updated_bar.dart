import 'package:app/features/presentation/widgets/graph_card.dart';
import 'package:app/features/presentation/widgets/score_summary.dart';
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
            children: const [ScoreSummaryPage(), GraphCard()],
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

