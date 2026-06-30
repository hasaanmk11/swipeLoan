import 'package:flutter/material.dart';

class ExploreWithLoan extends StatelessWidget {
  const ExploreWithLoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Explore More With SwipeLoan",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff262626),
            ),
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 190,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final items = [
                  {
                    "asset": "assets/icdicator.png",
                    "title": "Score Predictor",
                    "subtitle": "Check your score\nfactors for free",
                  },
                  {
                    "asset": "assets/calculator.png",
                    "title": "Score Predictor",
                    "subtitle": "Check your score\nfactors for free",
                  },
                  {
                    "asset": "assets/money_bag.png",
                    "title": "Score Predictor",
                    "subtitle": "Check your score\nfactors for free",
                  },
                ];
                final item = items[index];

                return Container(
                  width: 140,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xffE0F2E9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(item["asset"]!, width: 44, height: 44),
                      const SizedBox(height: 10),
                      Text(
                        item["title"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xff262626),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item["subtitle"]!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                          height: 1.3,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        width: 26,
                        height: 26,
                        decoration: const BoxDecoration(
                          color: Color(0xffE7F9ED),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 14,
                          color: Color(0xff16C172),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
