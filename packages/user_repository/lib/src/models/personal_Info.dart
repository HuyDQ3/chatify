import 'package:equatable/equatable.dart';

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
}
