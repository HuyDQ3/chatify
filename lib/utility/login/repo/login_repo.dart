import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/model/info/personal_info.dart';
import 'package:chatify/service/error/custom_logger.dart';

class LoginRepo {
  static List<AccountInfo> accounts = [
    AccountInfo.huy,
    AccountInfo.nghia,
  ];

  Future<AccountInfo?> login(LoginInfo loginInfo) async {
    AccountInfo? currentLoginAccount;
    try {
      await Future.delayed(const Duration(seconds: 1), () {
        if (accounts.any((element) => loginInfo.isAuthenticated(element.loginInfo))) {
          currentLoginAccount = accounts.firstWhere((element) => loginInfo.isAuthenticated(element.loginInfo));
        }
      },);
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
    }
    return currentLoginAccount;
  }
}