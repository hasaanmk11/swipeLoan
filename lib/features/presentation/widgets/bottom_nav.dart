import 'package:app/features/core/colors/app_colors.dart';
import 'package:app/features/presentation/widgets/nav_item.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85, // increased from 70
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        border: Border.all(color: Color(0xff16C172).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              navItem(
                Path: "assets/crad_icon.png",
                label: "Credit Card",
                isActive: false,
              ),
              navItem(
                Path: "assets/loan_icon.png",
                label: "Instant Loan",
                isActive: false,
              ),
              const SizedBox(width: 50), // space for center button
              navItem(
                Path: "assets/map_icon.png",
                label: "CIP",
                isActive: false,
              ),
              navItem(
                Path: "assets/other_loan.png",
                label: "Other Loan",
                isActive: true,
              ),
            ],
          ),

          // Center floating home button
          Positioned(
            top: -18, // adjusted slightly for new bar height
            child: Transform.rotate(
              angle: 0.785398, // 45 degrees
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff1A8C5A), Color(0xff6FD18B)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: appBorderBgClr.withOpacity(0.4),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Transform.rotate(
                  angle: -0.785398, // rotate icon back upright
                  child: const Icon(
                    Icons.home_filled,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
