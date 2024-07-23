import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

abstract class PrintFinfgerController extends GetxController {
  Future<bool> isFingerPrintEnable();
  Future<bool> isAuth(String msg);
}

class PrintFinfgerControllerImp extends PrintFinfgerController {
  final LocalAuthentication _localAuthintication = LocalAuthentication();

  @override
  Future<bool> isFingerPrintEnable() async {
    try {
      bool fingerPrintEnable = await _localAuthintication
          .canCheckBiometrics; //check if device use finger print
      return fingerPrintEnable;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isAuth(String msg) async {
     bool auth = false ;
    try {
      if (await isFingerPrintEnable()) {
       auth =  await _localAuthintication.authenticate(
            localizedReason: msg,
            
            authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
            options: const AuthenticationOptions(
              useErrorDialogs: true,
                biometricOnly: true //i want use print finger only
                ));
        return auth;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
