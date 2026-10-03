/* bu dosyadaki kodlar sayesinde JSON verilerini Dart nesnelerine dönüştürebiliriz,yani diğer dosyalarda mesela direkt fromJson fonksiyonunu kullanabiliriz. çünkü burada tanımlanmış.json dosyasındaki verileri kopyalayıp https://quicktype.io/dart adresinden model oluşturabiliriz ve buraya yapıştırabiliriz. */

import 'dart:convert';

class Person {
    int id;
    String name;
    String email;
    List<Address> address;

    Person({
        required this.id,
        required this.name,
        required this.email,
        required this.address,
    });

    factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        address: List<Address>.from(json["address"].map((x) => Address.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "address": List<dynamic>.from(address.map((x) => x.toJson())),
    };
}

class Address {
    String street;
    String city;
    String state;
    String zip;
    String turu;

    Address({
        required this.street,
        required this.city,
        required this.state,
        required this.zip,
        required this.turu,
    });

    factory Address.fromRawJson(String str) => Address.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        city: json["city"],
        state: json["state"],
        zip: json["zip"],
        turu: json["turu"],
    );

    Map<String, dynamic> toJson() => {
        "street": street,
        "city": city,
        "state": state,
        "zip": zip,
        "turu": turu,
    };
}
