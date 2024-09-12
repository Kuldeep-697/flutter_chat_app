import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_app/components/appbar.dart';
import 'package:social_app/config/app_icons.dart';
import 'package:social_app/config/app_strings.dart';
import '../components/post_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppStrings.homePage,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.location,
              width: 24,
              height: 24,
            ),
          ),
        ],
      ),
      body : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal :  24.0),
          child: Column(
            children: const [
              PostItem(),
              SizedBox(height: 12),
              PostItem(),
              SizedBox(height: 12),
              PostItem(),
              SizedBox(height: 12),
              PostItem(),
            ],
          ),
        ),
      )
    );
  }
}