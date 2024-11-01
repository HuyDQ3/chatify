import 'package:chatify/constant/chatify_app_constant.dart';

class BeginRepo {
  Future<void> initial() async {
    await Future.delayed(Duration(milliseconds: ChatifyAppConstant.initialMilliSecond));
  }

  Future<void> downloadResource() async {
    await Future.delayed(Duration(milliseconds: ChatifyAppConstant.loadingMilliSecond));
  }
}