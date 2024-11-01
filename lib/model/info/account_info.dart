import 'package:chatify/model/info/login_info.dart';
import 'package:chatify/model/info/personal_info.dart';

class AccountInfo {
  String id;
  LoginInfo loginInfo;
  PersonalInfo personalInfo;

  AccountInfo({
    required this.id,
    required this.loginInfo,
    required this.personalInfo,
  });

  static AccountInfo? currentLoginAccount;

  static AccountInfo get huy {
    return AccountInfo(
      id: "acc0",
      loginInfo: const LoginInfo(
        account: "huy",
        password: "huy123",
      ),
      personalInfo: PersonalInfo(
        id: "h1",
        name: "diep quang huy",
        dateOfBirth: DateTime(1999, DateTime.may, 20),
        phoneNumber: "0942159066",
        address: "ha dong - ha noi",
      ),
    );
  }

  static AccountInfo get nghia {
    return AccountInfo(
      id: "acc34234",
      loginInfo: const LoginInfo(
        account: "nghia",
        password: "nghia465",
      ),
      personalInfo: PersonalInfo(
        id: "n9",
        name: "nguyen tuan nghia",
        dateOfBirth: DateTime(1999, DateTime.january, 1),
        phoneNumber: "0912111222",
        address: "my dinh - ha noi",
      ),
    );
  }

  bool isCurrentLoginAccount(String personalId) {
    return personalInfo.id.compareTo(personalId) == 0;
  }
}
