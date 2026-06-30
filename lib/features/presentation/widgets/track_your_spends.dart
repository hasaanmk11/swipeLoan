import 'package:app/features/presentation/widgets/home_screen_items_area.dart';
import 'package:app/features/presentation/widgets/spend_crad.dart';
import 'package:flutter/material.dart';

class TrackYourSpends extends StatelessWidget {
  const TrackYourSpends({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            children: [
              TextSpan(text: "Your Daily Spending Report Is\nReady For "),
              TextSpan(
                text: "5th May",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.amber,
                  decorationThickness: 2,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Row(
          children: [
            Expanded(
              child: spendCard(
                label: "Debit",
                labelColor: const Color(0xffE5484D),
                icon: Icons.arrow_downward,
                amount: "₹40,000",
                imageAsset: "assets/red_money_bag.png",
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: spendCard(
                label: "Credit",
                labelColor: const Color(0xff16C172),
                icon: Icons.arrow_upward,
                amount: "₹1,150,496",
                imageAsset: "assets/green_money_bag.png",
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Center(
            child: Text(
              "View Full Report",
              style: TextStyle(
                color: Color(0xff16C172),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
