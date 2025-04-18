import '../../../core/app_export.dart';

/// This class defines the variables used in the [onboarding_one_screen],
import 'eightyeight_item_model.dart';

/// and is typically used to hold data that is passed between different parts of the application.
class OnboardingOneModel {
  static List<EightyeightItemModel> getOnboardingData() {
    return [
      EightyeightItemModel(
          ImageConstant.onboardingbg1,
          ImageConstant.onboardingbg1Player,
          "The community for sports players",
          "We helps sports players find each other organize activities and play more."),
      EightyeightItemModel(
          ImageConstant.onboardingbg2,
          ImageConstant.onboardingbg2Player,
          "Get better at your sports",
          "Played a good game? Track the score, exchanges badges and compete in a friendly leaderboard."),
      EightyeightItemModel(
          ImageConstant.onboardingbg3,
          ImageConstant.onboardingbg3Player,
          "The easier way to organize activates",
          "Played a good game? Track the score, exchanges badges and compete in a friendly leaderboard."),
      EightyeightItemModel(
          ImageConstant.onboardingbg3,
          ImageConstant.onboardingbg3Player,
          "Find the sport buddies near you",
          "Find the people at your skill level.Join a sports group to organize activities and inspire each other to be more activies."),
    ];
  }
}
