import 'package:app/features/presentation/widgets/bottom_nav.dart';
import 'package:app/features/presentation/widgets/home_screen_items_area.dart';
import 'package:app/features/presentation/widgets/nav_item.dart';
import 'package:app/features/presentation/widgets/top_image.dart';
import 'package:app/features/presentation/widgets/user_profile_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(),
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



