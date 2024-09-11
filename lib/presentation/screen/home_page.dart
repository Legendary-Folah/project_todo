import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/presentation/onboarding/onboarding_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final onboardingItem = OnboardingItem();
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // skip
            TextButton(
              onPressed: () {},
              child: const Text('Skip'),
            ),

            // indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: onboardingItem.items.length,
              effect: const ExpandingDotsEffect(
                activeDotColor: ColorsConst.purple,
                dotColor: ColorsConst.grey,
                dotHeight: 8.0,
              ),
            ),

            // next
            TextButton(
              onPressed: () {},
              child: const Text('Next'),
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: PageView.builder(
            itemCount: onboardingItem.items.length,
            controller: _pageController,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    onboardingItem.items[index].image,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    onboardingItem.items[index].title,
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardingItem.items[index].description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: ColorsConst.grey,
                      fontSize: 17,
                      letterSpacing: 2.0,
                    ),
                  )
                ],
              );
            },
          ),
        ));
  }
}
