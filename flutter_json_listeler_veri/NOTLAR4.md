meta.data kütüp ü ne için kullanılır?

@immutable, @required, @mustCallSuper gibi annotation’lar sağlar
Yani bir paket olarak kullanıldığında, kodun daha düzenli ve daha güvenli yazılmasına yardımcı olur.

Örnek:

import 'package:meta/meta.dart';

class User {
  final String name;

  User({@required this.name});
}

Ama modern Dart/Flutter sürümlerinde @required gibi şeyler artık yerini required anahtar sözcüğüne bıraktı. Yani bu paket eskiden çok kullanılırdı, şimdi daha az ihtiyaç duyuluyor.

Kısaca:

meta paketi = “Dart için ek annotation’lar sunan paket”
temel amaç = kodu daha net ve daha kontrollü yazmak
----------------------------------------------------------------

meta kelimesi “meta data” yani “verinin verisi” anlamına gelir.

Örnek olarak:

bir kişinin adı, soyadı, yaşı → veri
ama “bu veri ne zaman oluşturuldu, kim tarafından eklendi, hangi formatta” gibi bilgiler → metadata
Flutter/Flutter projesinde ise meta kelimesi genelde:

API’dan gelen ek bilgileri
bir nesnenin açıklama/etiket/ek özelliklerini
ya da bir model içinde “extra bilgi” tutmak için kullanılır
Örnek:

class User {
  final String name;
  final Map<String, dynamic> meta;

  User({required this.name, required this.meta});
}

Burada meta içinde şeyler saklayabilirsin:

{
  "createdAt": "2024-01-01",
  "source": "api"
}

Kısaca:

meta = ek bilgiler
metadata = verinin yanında gelen tanımlayıcı/ek bilgiler
Eğer kastın “Flutter’de meta paketi” ise o farklıdır; ama genel anlamda “meta data” = “meta veriler” demektir.

---------------------------------------
FLUTTER JSON VE DİĞER VERİ MODELLERİ TEMELİ:

1.JSON
Metin formatındadır
Süslü parantez ve tırnaklarla yazılır
İnsan okuyabilir
Örnek:

{
  "name": "Ali",
  "id": 1
}

2.Dart Map(JSON dan farkı çift tırnak değil tek tırnak kullanılır.)
Dart programı içinde kullanılan anahtar/değer yapısıdır
key: value şeklinde tutulur
Örnek:

{
  'name': 'Ali',
  'id': 1
}

3.List
Birden fazla eleman tutan dizi gibi yapıdır
Örnek:

[
  {'name': 'Ali', 'id': 1},
  {'name': 'Ayşe', 'id': 2}
]

4.Sınıf modeli
Senin kendi oluşturduğun nesne yapısıdır
Özellikleri vardır, örneğin name, id
Örnek:

class Person {
  final String name;
  final int id;

  Person({required this.name, required this.id});
}

Ve bir kişi nesnesi:
Person(name: 'Ali', id: 1)

Kısaca farkı şöyle hatırla:

JSON: dışarıdan gelen ham veri formatı
Map: Dart’ın anlayabildiği anahtar/değer yapısı
List: birden fazla verinin toplandığı yapı
Sınıf modeli: uygulama içinde çalışan nesne yapısı