import 'package:app/features/core/colors/app_colors.dart';
import 'package:app/features/presentation/widgets/bottom_card.dart';
import 'package:app/features/presentation/widgets/credit_crad.dart';
import 'package:app/features/presentation/widgets/eligible_crad.dart';
import 'package:app/features/presentation/widgets/explore_card.dart';
import 'package:app/features/presentation/widgets/last_updated_bar.dart';
import 'package:app/features/presentation/widgets/loan_option_crad.dart';
import 'package:app/features/presentation/widgets/track_your_spends.dart';
import 'package:flutter/material.dart';

class HomeScreenItemsParts extends StatelessWidget {
  const HomeScreenItemsParts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: LastUpdatedBar(),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: appBorderBgClr),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                // Gift Icon
                SizedBox(
                  width: 46,
                  height: 40,
                  child: Image.asset("assets/git_icons.png"),
                ),

                const SizedBox(width: 16),

                // Text
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Earn 100 Coins",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff333333),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Complete actions and earn rewards",
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Arrow
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: appBorderBgClr,
                  size: 20,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          CreditCrad(),
          const SizedBox(height: 20),
          LoanEligibleScrolableCrad(),
          SizedBox(height: 20),
          LoanOptionForYouCrad(),
          SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text(
                      "Track Your Spends",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff262626),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "05 May",
                          style: TextStyle(fontSize: 13, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xff1A8C5A), Color(0xff6FD18B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TrackYourSpends(),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ExploreWithLoan(),
          BottomCrad(),
        ],
      ),
    );
  }
}
