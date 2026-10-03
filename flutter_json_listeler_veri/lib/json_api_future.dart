import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:flutter_json_listeler_veri/models/person_model.dart';

class JsonApiFutureBuilder extends StatefulWidget {
  const JsonApiFutureBuilder({super.key});

  @override
  State<JsonApiFutureBuilder> createState() => _JsonApiFutureBuilderState();
}

class _JsonApiFutureBuilderState extends State<JsonApiFutureBuilder> {
  @override
  void initState() {
    super.initState();
    _loadJson();
  }

  Future<List<Person>> _loadJson() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final jsonString = await rootBundle.loadString('assets/data.json');
      Map<String, dynamic> jsonMap = json.decode(jsonString);

      // debugPrint(jsonMap["persons"][1]["address"][0]["state"].toString());

      List<dynamic> jsonList = jsonMap["persons"];
      List<Person> persons = jsonList
          .map((eleman) => Person.fromJson(eleman))
          .toList();
/*JSON → Map → Person nesnesi.

JSON’da bir kişi:

{
  "id": 1,
  "name": "Ali",
  "email": "ali@mail.com"
}
Bu veriyi doğrudan Map ile kullanınca:
jsonMap['name']

Ama sınıf ile kullanınca:
person.name ->Bu daha anlaşılır ve daha profesyonel görünür.*/


      /*
Bu iki satır aslında çok basit bir dönüşüm yapıyor.
İlk satır
List<dynamic> jsonList = jsonMap["persons"];
Şunu yapıyor:

jsonMap içinde "persons" adında bir bölüm var
onu alıyor
ve onu bir listeye dönüştürüyor
Yani:

JSON içindeki persons dizisini çekiyor
bunu Dart'ta kullanılabilir bir liste haline getiriyor
Örnek mantık:
{
  "persons": [
    { "name": "Ali" },
    { "name": "Ayşe" }
  ]
}
Burada:

jsonMap["persons"] → listeyi verir
İkinci satır
List<Person> persons = jsonList.map((eleman) => Person.fromJson(eleman)).toList();
Bunu yapıyor:

jsonList içindeki her öğeyi tek tek alıyor
her bir öğeyi Person nesnesine dönüştürüyor
sonra bunları tekrar bir liste haline getiriyor
Şu anlama gelir:

"persons" listesindeki her obje → Person sınıfına çevriliyor
Yani:

map() = her elemanı işle
Person.fromJson(eleman) = o elemanı Person modeline dönüştür
toList() = sonucu tekrar liste yap
Kısaca özet:

İlk satır: JSON içindeki listeyi al
İkinci satır: o listedeki her bir veriyi Person nesnesine çevir
Daha sade şekilde:
for (var item in jsonList) {
  persons.add(Person.fromJson(item));
}
Bu da aynı işi yapar.



 }*/

      for (var person in persons) {
        debugPrint(person.name);
      }
      return persons;
    } catch (e) {
      debugPrint(e.toString());
      return Future.error(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Person>>(
      future: _loadJson(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text('HATA VAR'));
        } else if (snapshot.hasData) {
          var myPersonList = snapshot
              .data!; //! null safety için kullanılır. snapshot.data null olamaz demek istiyoruz.

          return ListView.builder(
            itemCount: myPersonList.length,
            itemBuilder: (context, index) {
              var tekperson = myPersonList[index];
              return ListTile(
                title: Text(tekperson.name),
                leading: CircleAvatar(child: Text(tekperson.id.toString())),
              );
            },
          );
          /*builder her bir satırı json dan gelen verilere göre tek tek çiziyor. yani tek tek listeliyor. listtile ise bu verileri ekranda gösteriyor*/
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          ); //data gelirken ekrana ne gösterileceğini belirler
        }
      },
    );
    /*builder: (context, snapshot) :bu satır ne demek,napıyor?

    Bu satır, FutureBuilder’ın “iş bittiğinde ne göstermem gerektiğini” anlatan parçadır.

Kısaca:

builder = bir fonksiyon
context = mevcut widget bağlamı
snapshot = gelecekteki işlemin durumunu taşıyan nesne
Yani bu:
builder: (context, snapshot) {
  ...
}şunu söylüyor:

“Bu widget, veri yüklendiğinde/yüklenirken/hata olduğunda nasıl görünür, onu bana söyle.”
Ne yapıyor?

snapshot sayesinde şunları kontrol edebilirsin:
snapshot.hasData → veri geldi mi?
snapshot.hasError → hata oldu mu?
snapshot.connectionState → yükleniyor mu?
Burada:

builder içindeki kod, veri durumu değiştikçe çalışır
yani ekranın ne gösterileceğini belirler
Kısacası:

builder = “duruma göre UI oluşturma kısmı”
context = widget ortamı
snapshot = veri yükleme durumu*/
  }
}

/*Neden stataless widget değil de stateful widget kullandık?
Çünkü initState() metodu stateful widgetlarda kullanılır. initState() metodu widget oluşturulduğunda bir kez çağrılır ve burada JSON verilerini yüklemek için kullanılır. Statelss widgetlarda initState() metodu bulunmadığı için stateful widget tercih edilmiştir.

statefull widget kullanmamızın bir diğer nedeni de, JSON verilerini yükledikten sonra widgetin yeniden çizilmesini sağlamak için setState() metodunu kullanabilmektir. Bu sayede veriler yüklendikten sonra kullanıcı arayüzü güncellenebilir.

Eğer stateless widget kullanarak yapsaydık:class JsonApiFutureBuilder extends StatelessWidget {
  const JsonApiFutureBuilder({super.key});

  Future<void> _loadJson() async {
    final jsonString = await rootBundle.loadString('assets/data.json');
    final jsonMap = json.decode(jsonString);

    debugPrint(jsonMap.toString());
  }

  @override
  Widget build(BuildContext context) {
    _loadJson(); // Bu şekilde çağırmak, her build çağrıldığında JSON'u yükler ve performans sorunlarına yol açabilir.
    return Container();
  }
}
*/



/* listview da kaynağımız hazırken future builder da hazır değildir,önce veri yüklenir sonra ekrana basılır. bu yüzden future builder kullanılır. listview de ise veriler hazırdır ve ekrana basılır.*/



/*ÇOK ÖNEMLİ!
bu dosyada setstate kullanmadan nasılk verileri ekrana yazabiliyoruz?

Çünkü burada setState kullanmadan da veriler ekrana çıkabiliyor.

Neden?

FutureBuilder zaten veri geldiğinde widget’ı tekrar oluşturuyor.
Yani FutureBuilder kendi içinde “bekliyor / geldi / hata” durumlarını takip ediyor.
Veri yüklendiğinde, builder kısmı yeniden çalışıyor ve ekranda yeni görünüm oluşuyor.
Özet mantık:

_loadJson() veriyi yükler
FutureBuilder bu işlemin sonucunu bekler
işlem bitince snapshot.hasData true olur
builder tekrar çalışır
ListView.builder ile veriler ekrana basılır
Bu yüzden setState’e gerek yok.

Kısaca:

setState = sen elle “yeniden çiz” diye söylüyorsun
FutureBuilder = veri değişince otomatik olarak yeniden çiziyor
Yani bu dosyada:

veriyi yükleyen şey _loadJson()
ekranı güncelleyen şey FutureBuilder
setState kullanmaya gerek yok*/