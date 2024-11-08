import 'package:equatable/equatable.dart';

import 'package:chat_repository/chat_repository.dart' as chat_repository;
import 'package:user_repository/user_repository.dart' as user_repository;

class PersonalInfo extends Equatable {
  String? name;
  String? phoneNumber;
  String? address;
  DateTime? dateOfBirth;

  PersonalInfo({this.name, this.phoneNumber, this.address, this.dateOfBirth});

  PersonalInfo.huy()
      : name = "diep quang huy",
        dateOfBirth = DateTime(1999, DateTime.may, 20),
        phoneNumber = "0942159066",
        address = "ha dong - ha noi";

  PersonalInfo.nghia()
      : name = "nguyen tuan nghia",
        dateOfBirth = DateTime(1999, DateTime.january, 1),
        phoneNumber = "0912111222",
        address = "my dinh - ha noi";

  PersonalInfo.test()
      : name = "test",
        dateOfBirth = DateTime(2024, DateTime.january, 1),
        phoneNumber = "0123456789",
        address = "test";

  @override
  List<Object?> get props => [name, phoneNumber, address, dateOfBirth];

  static PersonalInfo fromChatRepositoryPersonalInfo(chat_repository.PersonalInfo personalInfo) {
    return PersonalInfo(
      address: personalInfo.address,
      name: personalInfo.name,
      dateOfBirth: personalInfo.dateOfBirth,
      phoneNumber: personalInfo.phoneNumber,
    );
  }

  static chat_repository.PersonalInfo toChatRepositoryPersonalInfo(PersonalInfo personalInfo) {
    return chat_repository.PersonalInfo(
      address: personalInfo.address,
      name: personalInfo.name,
      dateOfBirth: personalInfo.dateOfBirth,
      phoneNumber: personalInfo.phoneNumber,
    );
  }

  static PersonalInfo fromUserRepositoryPersonalInfo(user_repository.PersonalInfo personalInfo) {
    return PersonalInfo(
      address: personalInfo.address,
      name: personalInfo.name,
      dateOfBirth: personalInfo.dateOfBirth,
      phoneNumber: personalInfo.phoneNumber,
    );
  }

  static user_repository.PersonalInfo toUserRepositoryPersonalInfo(PersonalInfo personalInfo) {
    return user_repository.PersonalInfo(
      address: personalInfo.address,
      name: personalInfo.name,
      dateOfBirth: personalInfo.dateOfBirth,
      phoneNumber: personalInfo.phoneNumber,
    );
  }
}
