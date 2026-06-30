import 'package:app/features/presentation/widgets/home_screen_items_area.dart';
import 'package:app/features/presentation/widgets/top_image.dart';
import 'package:app/features/presentation/widgets/user_profile_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _navItem(
                  Path: "assets/crad_icon.png",
                  label: "Credit Card",
                  isActive: false,
                ),
                _navItem(
                  Path: "assets/loan_icon.png",
                  label: "Instant Loan",
                  isActive: false,
                ),
                const SizedBox(width: 50), // space for center button
                _navItem(
                  Path: "assets/map_icon.png",
                  label: "CIP",
                  isActive: false,
                ),
                _navItem(
                  Path: "assets/crad_icon.png",
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
                        color: const Color(0xff16C172).withOpacity(0.4),
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
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background Image
                  const TopImage(),

                  // Greeting overlaid on the image
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: UserPrifieAppBar(),
                  ),
                ],
              ),

              // Pull the white card up so it overlaps the bottom of the image
              Transform.translate(
                offset: const Offset(0, -50),
                child: const HomeScreenItemsParts(),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _navItem({
  required String Path,
  required String label,
  required bool isActive,
}) {
  final color = isActive ? const Color(0xff16C172) : Colors.black87;
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(Path),
      const SizedBox(height: 4),
      Text(
        label,
        style: TextStyle(
          fontSize: 8,
          color: color,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    ],
  );
}
