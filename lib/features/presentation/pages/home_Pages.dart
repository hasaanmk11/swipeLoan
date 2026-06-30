import 'package:app/features/presentation/widgets/home_screen_items_area.dart';
import 'package:app/features/presentation/widgets/top_image.dart';
import 'package:app/features/presentation/widgets/user_profile_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Background Image
                  TopImage(),

                  // Greeting
                  UserPrifieAppBar(),

                  // White Card
                  HomeScreenItemsParts(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

