import 'package:flutter/material.dart';
import 'package:project_todo/presentation/onboarding/onboarding_item.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late OnboardingItem onboardingItem;
  late PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
      itemCount: onboardingItem.items.length,
      controller: pageController,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset(
              // width: 200,
              // height: 300,
              onboardingItem.items[index].image,
            )
          ],
        );
      },
    ));
  }
}
