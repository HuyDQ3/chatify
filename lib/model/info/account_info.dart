import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/model/info/personal_info.dart';

class AccountInfo {
  LoginInfo? loginInfo;
  PersonalInfo? personalInfo;

  AccountInfo({this.loginInfo, this.personalInfo});
}