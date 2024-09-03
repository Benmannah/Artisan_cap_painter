// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:artisan_cap_painter/models/category_mode.dart';
import 'package:faker/faker.dart';

class UserModel {
  String? id;
  String? idNumber;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? image;
  String? userType;
  Map<String, dynamic>? location;
  String? gender;
  double? rating;
  double? latitude;
  double? longitude;
  bool? isOnline;
  bool? available;
  String? city;
  String? region;
  List<dynamic> images;
  int? createdAt;
  String? artisanCategory;

  UserModel({
    this.id,
    this.idNumber,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.userType,
    this.location,
    this.gender,
    this.rating = 2.0,
    this.latitude,
    this.longitude,
    this.isOnline,
    this.available = true,
    this.city,
    this.region,
    this.images = const [],
    this.createdAt,
    this.artisanCategory,
  });

  UserModel copyWith({
    ValueGetter<String?>? id,
    ValueGetter<String?>? idNumber,
    ValueGetter<String?>? name,
    ValueGetter<String?>? email,
    ValueGetter<String?>? phone,
    ValueGetter<String?>? address,
    ValueGetter<String?>? image,
    ValueGetter<String?>? userType,
    ValueGetter<Map<String, dynamic>?>? location,
    ValueGetter<String?>? gender,
    ValueGetter<double?>? rating,
    ValueGetter<double?>? latitude,
    ValueGetter<double?>? longitude,
    ValueGetter<bool?>? isOnline,
    ValueGetter<bool?>? available,
    ValueGetter<String?>? city,
    ValueGetter<String?>? region,
    List<dynamic>? images,
    ValueGetter<int?>? createdAt,
    ValueGetter<String?>? artisanCategory,
  }) {
    return UserModel(
      id: id != null ? id() : this.id,
      idNumber: idNumber != null ? idNumber() : this.idNumber,
      name: name != null ? name() : this.name,
      email: email != null ? email() : this.email,
      phone: phone != null ? phone() : this.phone,
      address: address != null ? address() : this.address,
      image: image != null ? image() : this.image,
      userType: userType != null ? userType() : this.userType,
      location: location != null ? location() : this.location,
      gender: gender != null ? gender() : this.gender,
      rating: rating != null ? rating() : this.rating,
      latitude: latitude != null ? latitude() : this.latitude,
      longitude: longitude != null ? longitude() : this.longitude,
      isOnline: isOnline != null ? isOnline() : this.isOnline,
      available: available != null ? available() : this.available,
      city: city != null ? city() : this.city,
      region: region != null ? region() : this.region,
      images: images ?? this.images,
      createdAt: createdAt != null ? createdAt() : this.createdAt,
      artisanCategory:
          artisanCategory != null ? artisanCategory() : this.artisanCategory,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idNumber': idNumber,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'userType': userType,
      'location': location,
      'gender': gender,
      'rating': rating,
      'latitude': latitude,
      'longitude': longitude,
      'isOnline': isOnline,
      'available': available,
      'city': city,
      'region': region,
      'images': images,
      'createdAt': createdAt,
      'artisanCategory': artisanCategory,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      idNumber: map['idNumber'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      address: map['address'],
      image: map['image'],
      userType: map['userType'],
      location:map['location']!=null? Map<String, dynamic>.from(map['location']):{},
      gender: map['gender'],
      rating: map['rating']?.toDouble(),
      latitude: map['latitude']?.toDouble(),
      longitude: map['longitude']?.toDouble(),
      isOnline: map['isOnline'],
      available: map['available'],
      city: map['city'],
      region: map['region'],
      images: List<dynamic>.from(map['images']),
      createdAt: map['createdAt']?.toInt(),
      artisanCategory: map['artisanCategory'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, idNumber: $idNumber, name: $name, email: $email, phone: $phone, address: $address, image: $image, userType: $userType, location: $location, gender: $gender, rating: $rating, latitude: $latitude, longitude: $longitude, isOnline: $isOnline, available: $available, city: $city, region: $region, images: $images, createdAt: $createdAt, artisanCategory: $artisanCategory)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.idNumber == idNumber &&
        other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.address == address &&
        other.image == image &&
        other.userType == userType &&
        mapEquals(other.location, location) &&
        other.gender == gender &&
        other.rating == rating &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.isOnline == isOnline &&
        other.available == available &&
        other.city == city &&
        other.region == region &&
        listEquals(other.images, images) &&
        other.createdAt == createdAt &&
        other.artisanCategory == artisanCategory;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        idNumber.hashCode ^
        name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        image.hashCode ^
        userType.hashCode ^
        location.hashCode ^
        gender.hashCode ^
        rating.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        isOnline.hashCode ^
        available.hashCode ^
        city.hashCode ^
        region.hashCode ^
        images.hashCode ^
        createdAt.hashCode ^
        artisanCategory.hashCode;
  }

  Map<String, dynamic> locationUpdateMap() {
    return <String, dynamic>{
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'region': region,
    };
  }
}

class DummyData {
  static final Random _random = Random();
  static List<String> ghanaianNames = [
    'Kwame Mensah',
    'Abena Osei',
    'Kofi Boateng',
    'Akua Acheampong',
    'Nana Asante',
    'Ama Adjei',
    'Kwaku Appiah',
    'Efua Ansah',
    'Yaw Amponsah',
    'Esi Adu',
    'Kojo Ampofo',
    'Afia Adomako',
    'Kwabena Boateng',
    'Akosua Darko',
    'Kodjo Nkrumah',
    'Abrafi Ansong',
    'Yaw Boateng',
    'Abena Mensah',
    'Kwame Asamoah',
    'Ama Owusu',
  ];
  static List<String> doctorsImages = [
    'https://www.iupat.org/wp-content/uploads/2023/09/Commercial-Painter-New-2-1440x1080.jpg',
    'https://www.pdcenterlv.com/wp-content/uploads/2023/07/construction-painter-painting-1024x683.jpg',
    'https://petethepainter.com.au/wp-content/uploads/2020/09/local_painting_img.jpg',
    'https://www.ziprecruiter.com/svc/fotomat/public-ziprecruiter/uploads/job_description_template/Carpenter.jpg=ws720x480',
    'https://www.shutterstock.com/image-photo/african-american-carpenter-man-use-600nw-2251271317.jpg',
    'https://media.sciencephoto.com/c0/37/54/64/c0375464-800px-wm.jpg'
  ];

  static List<String> doctorsEmails = [
    'kofimensah@gmail.com',
    'akomansah@gmail.com',
    'owusukwame@example.com',
    'amamensah@example.com',
    'nanaosei@example.com',
    'abenaappiah@example.com',
    'kwesiagyemang@example.com',
    'adwoaboateng@example.com',
    'kofiansah@example.com',
    'afuamensah@example.com',
    'koboateng@example.com',
    'yaadjei@example.com',
    'kwabenadarko@example.com',
    'akuaasante@example.com',
    'kwekuaddo@example.com',
    'efuaamoah@example.com',
    'kwamemensah@example.com',
    'abenaofori@example.com',
    'kofiadu@example.com',
    'akosuafrimpong@example.com',
    'nanakwame@example.com',
    'adwoaboateng@example.com',
    'kwabenaosei@example.com',
    'amaasare@example.com',
    'kofiantwi@example.com',
    'afiaowusu@example.com',
    'kojogyasi@example.com',
    'yaaansah@example.com',
    'kwesiamponsah@example.com',
    'akosuaasamoah@example.com',
  ];
  static List<String> doctorsAddresses = [
    'Block 5, Office 3, Accra',
    'Lapas, P.O. Box 234-4567, Accra',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
    'Kumasi, AK-234-4567',
    'Lapas, P.O. Box 234-4567, Accra',
    'Sunyani, BA-345-6789',
    'Tema, TP-789-0123',
  ];
  static List<String> doctorsPhoneNumbers = [
    '0248235689',
    '02458965656',
    '0557823456',
    '0245678921',
    '0509876543',
    '0278765432',
    '0263456789',
    '0234567890',
    '0541234567',
    '0209876543',
    '0556789012',
    '0245678901',
    '0557823456',
    '02458965656',
    '0509876543',
    '0278765432',
    '0263456789',
    '0234567890',
    '0541234567',
    '0209876543',
    '0556789012',
    '0245678901',
    '0557823456',
    '02458965656',
    '0509876543',
    '0278765432',
    '0263456789',
    '0234567890',
    '0541234567',
    '0209876543',
  ];

  static bool _getRandomBool() {
    return _random.nextBool();
  }

  static String _getRandomGender() {
    //rettuen random gender
    return ['Male', 'Female'][_random.nextInt(2)];
  }

  static String _getDoctorSpecialty() {
    //return random doctor specialty
    final doctorSpecialty = CategoryModel.dummyData;
    return doctorSpecialty[_random.nextInt(doctorSpecialty.length)].name!;
  }

  static String generateRandomId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    final random = Random();
    const idLength = 15;
    String id = '';

    for (int i = 0; i < idLength; i++) {
      id += chars[random.nextInt(chars.length)];
    }

    return id;
  }

  static List<UserModel> artisanList() {
    List<UserModel> artisans = [];
    Faker _faker = Faker();
  List<Map<String, dynamic>> kumasiLocations = [
      {
        'name': 'Manhyia Palace Museum',
        'latitude': 6.7038,
        'longitude': -1.6226
      },
      {'name': 'Kumasi City Mall', 'latitude': 6.7001, 'longitude': -1.6249},
      {
        'name': 'Komfo Anokye Teaching Hospital',
        'latitude': 6.6882,
        'longitude': -1.6161
      },
      {
        'name': 'Kwame Nkrumah University of Science and Technology (KNUST)',
        'latitude': 6.6745,
        'longitude': -1.5717
      },
      {'name': 'Kejetia Market', 'latitude': 6.6906, 'longitude': -1.6200},
      {'name': 'Baba Yara Stadium', 'latitude': 6.6878, 'longitude': -1.6112},
      {'name': 'Rattray Park', 'latitude': 6.6943, 'longitude': -1.6228},
      {
        'name': 'Kumasi Fort and Military Museum',
        'latitude': 6.6904,
        'longitude': -1.6217
      },
      {
        'name': 'Prempeh II Jubilee Museum',
        'latitude': 6.6931,
        'longitude': -1.6209
      },
      {
        'name': 'Centre for National Culture (Cultural Centre)',
        'latitude': 6.6914,
        'longitude': -1.6173
      },
      {'name': 'Asafo Market', 'latitude': 6.6853, 'longitude': -1.6180},
      {
        'name': 'Suame Magazine Industrial Area',
        'latitude': 6.7028,
        'longitude': -1.6235
      }
    ];

    for (int i = 0; i < doctorsImages.length; i++) {
      artisans.add(
        UserModel(
          name: ghanaianNames[i],
          email: doctorsEmails[i],
          address: doctorsAddresses[i],
          idNumber: generateRandomId(),
          gender: _getRandomGender(),
          phone: doctorsPhoneNumbers[i],
          location: {},
          userType: 'artisan',
          region: 'Ashanti Region',
          city: 'Kumasi',
          latitude: kumasiLocations[i]['latitude'],
          longitude: kumasiLocations[i]['longitude'],
          image: _faker.randomGenerator.element(doctorsImages),
          artisanCategory: _getDoctorSpecialty(),
          //return random double between 1.5 and 5.0
          rating: 1.5 + _random.nextDouble() * (5.0 - 1.5),
          isOnline: _getRandomBool(),
        ),
      );
    }
    return artisans;
  }
}
