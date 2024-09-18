import 'package:flutter/material.dart';
import 'package:project_todo/constants/colors/colors.dart';
import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/login/login.dart';
import 'package:project_todo/presentation/onboarding/onboarding_item.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final onboardingItem = OnboardingItem();
  final _pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: ColorsConst.white,
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 10,
        ),
        child: isLastPage
            ? getStarted()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // skip
                  TextButton(
                    onPressed: () {
                      _pageController
                          .jumpToPage(onboardingItem.items.length - 1);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: ColorsConst.purple,
                        fontSize: 14,
                      ),
                    ),
                  ),

                  // indicator
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: onboardingItem.items.length,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: ColorsConst.purple,
                      dotColor: ColorsConst.grey,
                      dotHeight: 8.0,
                      dotWidth: 20.0,
                    ),
                  ),

                  // next
                  TextButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceInOut,
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          color: ColorsConst.purple,
                          fontSize: 14,
                        ),
                      )),
                ],
              ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              isLastPage = onboardingItem.items.length - 1 == index;
            });
          },
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
      ),
    );
  }

  Widget getStarted() {
    return Container(
      width: MediaQuery.of(context).size.width * .9,
      height: 55,
      decoration: BoxDecoration(
        color: ColorsConst.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextButton(
        onPressed: () async {
          final pres = await SharedPreferences.getInstance();
          pres.setBool(StringConst.onboardingKey, true);

          if (!mounted) return;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ),
          );
        },
        child: const Text(
          "Get Started",
          style: TextStyle(
            color: ColorsConst.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
