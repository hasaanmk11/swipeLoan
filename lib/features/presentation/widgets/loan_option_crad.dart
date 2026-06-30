import 'package:app/features/core/colors/app_colors.dart';
import 'package:app/features/presentation/widgets/bullet_potin.dart';
import 'package:flutter/material.dart';

class LoanOptionForYouCrad extends StatelessWidget {
  const LoanOptionForYouCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffF3FBF6), Color(0xffE7F9ED)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xffD7F2E2)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Decorative dots
          Positioned(
            top: 0,
            right: 60,
            child: Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Color(0xffB9E4FF),
                shape: BoxShape.circle,
              ),
            ),
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left text content
              SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Loan Option For You",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff262626),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Text(
                          "Uto 1 Lakhs",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff16C172),
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.bolt, color: Color(0xff16C172), size: 18),
                      ],
                    ),
                    const SizedBox(height: 14),
                    bulletPoint("Hassle free process"),
                    const SizedBox(height: 4),
                    bulletPoint("instant transfer"),
                    const SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [appButtionColor, appBorderBgClr],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Apply Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Right illustration
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 220,
                  child: Image.asset(
                    "assets/bootm_image_coins.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
