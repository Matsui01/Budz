// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budz/src/domain/models/user.dart';

import '../pet.dart';

class ProfileResponse {
  final User user;
  final List<Pet> pets;
  ProfileResponse({required this.user, required this.pets});

  factory ProfileResponse.fromMap(Map<String, dynamic> map) {
    return ProfileResponse(
      user: map['user'],
      pets: List<Pet>.from(map['pets'].map<Pet>(
        (pet) => Pet.fromMap(pet as Map<String, dynamic>),
      )),
    );
  }
}
/*
{
    "pets": [
        {
            "id": "48E792A6-EF69-467E-B9FB-E4C272AE23AF"
        },
        {
            "id": "B05C4E66-4E5E-4B4D-8BDE-B7AFC9F476FF"
        }
    ],
    "user": {
        "email": "j@teste.com",
        "generalPetID": "B05C4E66-4E5E-4B4D-8BDE-B7AFC9F476FF",
        "thirdPartyLoginIdToken": null,
        "pushAllow": null,
        "fullname": "J",
        "thirdPartyLoginServerAuthCode": null,
        "photoUrl": null,
        "updatedDate": "2023-09-14T00:00:00Z",
        "createdDate": "2023-09-14T00:00:00Z",
        "isThirdPartyLogin": null,
        "phoneNumber": null,
        "id": "48E792A6-EF69-467E-B9FB-E4C272AE23AF",
        "nickname": "J",
        "birthdate": null,
        "gender": null,
        "password": "$2b$12$W1oIUW75/caReXs66OsCS.nj/ldR/cVc2L91wLVAnTweXn8ZNP5lu"
    },
    "subscription": {
        "userType": "free",
        "createdAt": null,
        "userId": "48E792A6-EF69-467E-B9FB-E4C272AE23AF",
        "updatedAt": null,
        "subscriptionStatus": "free",
        "id": "92D3775C-8B7D-44ED-A413-313B9CFB96B2",
        "subscriptionType": "free"
    }
}
*/