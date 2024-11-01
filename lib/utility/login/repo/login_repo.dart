import 'package:chatify/constant/chatify_app_constant.dart';
import 'package:chatify/model/info/account_info.dart';
import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/service/error/custom_logger.dart';

class LoginRepo {
  static List<AccountInfo> accounts = [
    AccountInfo.huy,
    AccountInfo.nghia,
  ];

  Future<AccountInfo?> login(LoginInfo loginInfo) async {
    AccountInfo? currentAccount;
    try {
      await Future.delayed(Duration(milliseconds: ChatifyAppConstant.loadingMilliSecond), () {
        if (accounts.any((element) => loginInfo.isAuthenticated(element.loginInfo))) {
          currentAccount = accounts.firstWhere((element) => loginInfo.isAuthenticated(element.loginInfo));
          AccountInfo.currentLoginAccount = currentAccount;
        }
      },);
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
    }
    return currentAccount;
  }

  Future<void> logout() async {
    try {
      await Future.delayed(Duration(milliseconds: ChatifyAppConstant.loadingMilliSecond), () {
        AccountInfo.currentLoginAccount = null;
      },);
    } catch (e, s) {
      logger.log(error: e, stackTrace: s);
    }
  }
}