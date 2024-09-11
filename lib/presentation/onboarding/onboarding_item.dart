import 'package:project_todo/constants/string_const/string_const.dart';
import 'package:project_todo/presentation/onboarding/onboarding_model.dart';

class OnboardingItem {
  List<OnboardingModel> items = [
    OnboardingModel(
      title: 'Welcome!',
      description:
          'Welcome to Your_ToDo. Express yourself in the best way possible and do not worry about getting lost data',
      image: StringConst.man,
    ),
    OnboardingModel(
      title: 'Be Yourself',
      description: 'Be the best version of yourself.',
      image: StringConst.stickynotes,
    ),
    OnboardingModel(
      title: 'Express Your Mind',
      description: 'Just You and Your Thoughts on Here.',
      image: StringConst.note,
    ),
  ];
}
