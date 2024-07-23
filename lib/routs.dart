import 'package:active_app/core/constant/app_route.dart';
import 'package:active_app/core/middleware/mymiddleware.dart';
import 'package:active_app/feature/about/screen/about_us.dart';
import 'package:active_app/feature/about/screen/notifi_page.dart';
import 'package:active_app/feature/auth/screen/login_page.dart';
import 'package:active_app/feature/auth/screen/socila_media_login.dart';
import 'package:active_app/feature/auth/screen/signup_page.dart';
import 'package:active_app/feature/auth/screen/succes_signup.dart';
import 'package:active_app/feature/auth/screen/vrefycode_signup.dart';
import 'package:active_app/feature/client_details/screen/barcode_input.dart';
import 'package:active_app/feature/client_details/screen/branch_details.dart';
import 'package:active_app/feature/client_details/screen/branch_selection.dart';
import 'package:active_app/feature/client_details/screen/client_selection.dart';
import 'package:active_app/feature/client_details/screen/physical_details.dart';
import 'package:active_app/feature/client_details/screen/trainer_selection.dart';
import 'package:active_app/feature/fogetpassword/check_email.dart';
import 'package:active_app/feature/fogetpassword/reset_pass.dart';
import 'package:active_app/feature/fogetpassword/sucsess_reset.dart';
import 'package:active_app/feature/fogetpassword/verfy_code.dart';
import 'package:active_app/feature/home/screen/home_page.dart';
import 'package:active_app/feature/home/screen/home_screen.dart';
import 'package:active_app/feature/home/screen/trainer_home_screen.dart';
import 'package:active_app/feature/language/screen/language.dart';
import 'package:active_app/feature/nutrition/screen/food_ingredients.dart';
import 'package:active_app/feature/offers/screen/payment_page.dart';
import 'package:active_app/feature/offers/screen/vodafone_cash_input.dart';
import 'package:active_app/feature/onboarding/onboarding.dart';
import 'package:active_app/feature/profile/profile_page.dart';
import 'package:active_app/feature/training/screen/add_traing.dart';
import 'package:active_app/feature/training/screen/training_day.dart';
import 'package:active_app/feature/training/screen/training_details.dart';
import 'package:active_app/feature/training/screen/training_week.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routs = [
  GetPage(
      name: AppRoute.languageId,
      page: () => const LanguagePage(),
      middlewares: [MyMiddleWare()]),
  GetPage(
    name: AppRoute.onboardingId,
    page: () => const OnBoardingPage(),
  ),
  //auth
  GetPage(name: AppRoute.socailId, page: () => const SocialMediaLogin()),
  GetPage(name: AppRoute.loginId, page: () => const LoginPage()),
  GetPage(name: AppRoute.signUpId, page: () => const SignUp()),
  GetPage(name: AppRoute.checkEmailId, page: () => const CheckEmail()),
  GetPage(name: AppRoute.verfyid, page: () => const Verfycode()),
  GetPage(name: AppRoute.resetId, page: () => const ResetPass()),
  GetPage(name: AppRoute.successResetId, page: () => const SuccessResetPass()),
  GetPage(name: AppRoute.successSignUpId, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.veryfyCodeSignUpId, page: () => const VeryfyCodeSignUp()),
  //client details
  GetPage(
      name: AppRoute.physicalDetailsId, page: () => const PhysicalDetails()),
  GetPage(
      name: AppRoute.branshSelectionId, page: () => const BranshSelection()),
  GetPage(name: AppRoute.branshDetailsId, page: () => const BranchDetails()),
  GetPage(
      name: AppRoute.trainerSelectionId, page: () => const TrainerSelection()),
  GetPage(name: AppRoute.barcodeInputId, page: () => const BarcodeInput()),
  GetPage(name: AppRoute.homeId, page: () => const HomePage(title: "تفاصيل عنك",)),
  GetPage(name: AppRoute.homeScreenId, page: () => const HomeScreen()),
  GetPage(name: AppRoute.trainingweekId, page: () => const TrainingWeek()),
  GetPage(name: AppRoute.trainingDayId, page: () => const TrainingDay()),
  GetPage(name: AppRoute.trainingdetailsId, page: () => ExerciseDetailPage()),
  GetPage(
      name: AppRoute.foodIngredientsId, page: () => const FoodIngredients()),
  GetPage(name: AppRoute.paymentPageId, page: () => const PaymentPage()),
  GetPage(
      name: AppRoute.vodafoneCashInputId,
      page: () => const VodafoneCashInput()),
  GetPage(name: AppRoute.profilePageId, page: () => const ProfilePage()),
  GetPage(name: AppRoute.aboutUsId, page: () => const AboutUs()),
  GetPage(name: AppRoute.notificationId, page: () => const NotificationPage()),

  //trainer app
  GetPage(name: AppRoute.trainerHomeScreenId, page: () => const TrainerHomeScreen()),
  GetPage(name: AppRoute.clienSelelectionId, page: () => const ClienSelelection()),
  GetPage(name: AppRoute.addtrainingId, page: () => const AddTraining()),
];
