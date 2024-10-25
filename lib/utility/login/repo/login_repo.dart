import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/model/info/personal_info.dart';
import 'package:chatify/service/error/custom_logger.dart';

class LoginRepo {
  List<AccountInfo> accounts = [
    AccountInfo(
      loginInfo: const LoginInfo(
        account: "huy",
        password: "huy123",
      ),
      personalInfo: PersonalInfo(
        name: "diep quang huy",
        dateOfBirth: DateTime(1999, DateTime.may, 20),
        phoneNumber: "0942159066",
        address: "ha dong - ha noi",
      ),
    ),
    AccountInfo(
      loginInfo: const LoginInfo(
        account: "nghia",
        password: "nghia465",
      ),
      personalInfo: PersonalInfo(
        name: "nguyen tuan nghia",
        dateOfBirth: DateTime(1999, DateTime.january, 1),
        phoneNumber: "0912111222",
        address: "my dinh - ha noi",
      ),
    ),
  ];

  Future<AccountInfo?> login(LoginInfo loginInfo) async {
    AccountInfo? currentLoginAccount;
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        currentLoginAccount = accounts.firstWhere((element) => identical(element, loginInfo));
      },);
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
    }
    return currentLoginAccount;
  }
}