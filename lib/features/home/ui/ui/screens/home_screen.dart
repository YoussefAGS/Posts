
import 'package:flutter/material.dart';

import 'package:postapp/core/extensions/context_extension.dart';

import '../../../../../core/routes/app_route.dart';
import '../../../../../core/style/colors/colors.dart';
import '../../../../../core/style/text_styles/text_styles.dart';
import '../refactor/post_screen_body.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Home',
          style: TextStyles.font18Black700,
        ),
        centerTitle: true,
      ),
      body: PostScreenBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pushName(AppRoute.addPostScreen);
          // Add your action here
        },
        backgroundColor: ColorsManager.mainColor,
        // Adjust color to match the image
        shape: const CircleBorder(),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
}

