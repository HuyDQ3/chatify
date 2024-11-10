import 'package:equatable/equatable.dart';

class UserRepositoryPersonalInfo extends Equatable {
  String? name;
  String? phoneNumber;
  String? address;
  DateTime? dateOfBirth;

  UserRepositoryPersonalInfo({this.name, this.phoneNumber, this.address, this.dateOfBirth});

  UserRepositoryPersonalInfo.huy()
      : name = "diep quang huy",
        dateOfBirth = DateTime(1999, DateTime.may, 20),
        phoneNumber = "0942159066",
        address = "ha dong - ha noi";

  UserRepositoryPersonalInfo.nghia()
      : name = "nguyen tuan nghia",
        dateOfBirth = DateTime(1999, DateTime.january, 1),
        phoneNumber = "0912111222",
        address = "my dinh - ha noi";

  UserRepositoryPersonalInfo.test()
      : name = "test",
        dateOfBirth = DateTime(2024, DateTime.january, 1),
        phoneNumber = "0123456789",
        address = "test";

  @override
  List<Object?> get props => [name, phoneNumber, address, dateOfBirth];
}
