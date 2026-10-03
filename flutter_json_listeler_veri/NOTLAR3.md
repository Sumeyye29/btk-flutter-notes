FLUTTER DA JSON/API 

json objelerinin dart dilindeki karşılığına map deriz.

JSON nesnesi (object) ile Dart dilindeki Map veri tipi birebir aynı mantıkla çalışır: Her ikisi de verileri key: value (anahtar: değer) çiftleri şeklinde tutar.

Karşılaştırmalı Örnek
1. JSON Objesi (Düz Metin):

JSON
{
  "isim": "Sümeyye",
  "yas": 22,
  "ogrenciMi": true
}
2. Dart Dili Karşılığı (Map):

Dart
Map<String, dynamic> kullanici = {
  "isim": "Sümeyye",
  "yas": 22,
  "ogrenciMi": true
};
Küçük Bir Teknik Detay: Map<String, dynamic>
Flutter/Dart projelerinde bir API'den JSON aldığında veya jsonDecode() yaptığında Dart bunu otomatik olarak Map<String, dynamic> tipine dönüştürür.

String (Key / Anahtar): JSON'daki tüm anahtarlar ("isim", "yas") her zaman metindir (string).

dynamic (Value / Değer): Karşısındaki değer ise sayı (22), metin ("Sümeyye"), bool (true), hatta başka bir liste veya Map olabilir (yani dinamiktir).
-------------------------------------------------------------------
GENEL NOT:hazır apı kullansam da yine de backend yazmam gerekiyOR mu?

Hayır, her zaman backend yazman gerekmez.Hazır API kullanmanın en büyük amacı zaten seni kendi sunucunu (backend) kurma ve yönetme zahmetinden kurtarmaktır. Ancak projenin mimarisine ve ne yapmak istediğine göre bu durum değişir.
İşte 3 farklı senaryo ile ne zaman backend yazman gerekip gerekmediği:

1. Backend Yazmana HİÇ Gerek Olmayan Durum (Doğrudan API Kullanımı)

Eğer uygulaman sadece var olan açık/hazır verileri okuyorsa veya hazır servislerin sunduğu SDK'ları kullanıyorsa doğrudan Flutter (Frontend) $\rightarrow$ Hazır API şeklinde çalışabilirsin.Örnekler: Hava durumu uygulaması (OpenWeather API), döviz kurları (Fixer API), haber uygulaması (NewsAPI), harita ve konum servisleri.Nasıl Çalışır? Flutter kodunun içinden (http veya dio paketi ile) doğrudan hazır API'ye istek atarsın, gelen JSON verisini Map yapısına çevirip ekranda gösterirsin. Araya hiçbir kendi sunucunu koymazsın.

2. Sıfırdan Backend Yazmak Yerine BaaS (Backend-as-a-Service) Kullanımı

Eğer uygulaman kullanıcı kaydı (Auth), veritabanı (Database), resim yükleme (Storage) gibi özellikler istiyorsa ama PHP/Python/Node.js ile backend yazmak istemiyorsan hazır backend platformları kullanabilirsin.Örnekler: Firebase, Supabase, Appwrite.Nasıl Çalışır? Bu servisler sana hazır backend ve API sunar. Flutter proğramına Firebase SDK'sını eklersin ve tek satır kodla kullanıcı kaydı yaparsın (FirebaseAuth.instance.createUser...). Tek satır backend kodu yazmamış olursun.

3. Hazır API Olsa Bile Kendi Backend'ini Yazmanın Gerekli Olduğu Durumlar

Hazır API kullansan dahi aşağıdaki durumlarda araya kendi yazacağın küçük bir backend (Node.js, Python, PHP vb.) koyman gerekir:Güvenlik / Gizli API Anahtarları (Secret Keys): Kullanacağın hazır API ödeme sistemi (Stripe, Iyzico gibi) veya kullanıcı başına ücret kesen bir yapay zeka servisi (OpenAI API) ise, API Key'i doğrudan Flutter kodunun içine koyamazsın. (Uygulamayı decompile eden biri anahtarını çalar). İsteği önce kendi backend'ine atarsın, backend hazır API ile konuşur.Özel İş Mantığı (Business Logic): Hazır API'den gelen veriyi Flutter'a göndermeden önce değiştirmek, filtrelemek veya kendi veritabanındaki verilerle birleştirmek (merge etmek) istiyorsan.Birden Fazla API'yi Birleştirme: Örneğin aynı anda hem hava durumu hem döviz API'sini tek bir istekte birleştirip Flutter'a tek parça veri sunmak istiyorsan.

Özet Karar Tablosu

Senaryo,Kendi Backend'ini Yazmalı mısın?,Ne Kullanmalısın?

"Sadece veri gösterme (Hava durumu, Döviz, Haberler)",❌ Hayır,Doğrudan Flutter http paketi ile API çağrısı

"Kullanıcı Girişi, Veritabanı, Bildirimler",❌ Hayır (Sıfırdan yazma),Firebase veya Supabase

"Güvenli ödeme, Gizli API anahtarları, Özel iş yükü",Evet,"Node.js, Python (FastAPI/Flask), PHP vb."

(FastAPI = Python + Hızlı Backend + Otomatik Dokümantasyon,Python'la ön yüze veri besleyen o süper hızlı API kütüphanesi)

------------------------------------------------------------------
Flask ile FastAPI ın farkı(fast daha iyi her yönden):

Flask ile FastAPI arasındaki temel fark şudur: Flask daha eski, minimal ve esnek bir "web mikro-çatısı" (micro-framework) iken; FastAPI, özellikle API ve mikroservisler yazmak için tasarlanmış modern, aşırı hızlı ve tip kontrollü bir çatıdır.

İki aracı yan yana koyduğumuzda aralarındaki belirgin farklar şunlardır:

1. Hız ve Asenkron (Async) Desteği
Flask: Geleneksel olarak senkron (sync) çalışır. Yani aynı anda tek bir isteği işler, diğeri sıraya girer. Asenkron destek sonradan eklense de FastAPI kadar doğal ve performanslı değildir.

FastAPI: Doğuştan asenkron (async/await) mimariye sahiptir. Node.js veya Go gibi yüksek eşzamanlı (concurrency) istekleri çok rahat kaldırır ve Flask'a göre kat kat daha hızlıdır.

2. Veri Doğrulama ve Tip Kontrolü (Data Validation)
Flask: Gelen JSON verisinin doğru tipte olup olmadığını (örneğin yas bilgisinin int gelip gelmediğini) kontrol etmek için manuel if/else yazman veya ekstra eklentiler (Marshmallow vb.) kurman gerekir.

FastAPI: Python'ın Pydantic kütüphanesini kullanır. Fonksiyona yas: int yazdığın an gelen veriyi otomatik doğrular. Hatalı veri gelirse geliştiriciye detaylı hatayı kendisi döner.

3. Otomatik Dokümantasyon (Swagger)
Flask: API dokümantasyonu çıkarmak için Flasgger gibi harici kütüphaneler kurup uğraşman gerekir.

FastAPI: Kodu yazdığın an Swagger UI (/docs) ve ReDoc (/redoc) sayfalarını otomatik oluşturur. Tarayıcıya girip API'lerini anında test edebilirsin.

4. Kullanım Amacı ve Felsefe
Flask: "İçinde HTML şablonları (Jinja2) da olsun, gerekirse tam teşekküllü bir web sitesi de yapayım, ihtiyacım olan eklentileri kendim seçip ekleyeyim" diyen esnek bir yapıdadır.

FastAPI: "Ben HTML ile uğraşmayacağım; Flutter, React veya başka bir ön yüze sadece JSON basan ultra hızlı ve güvenli bir backend/API yazacağım" felsefesiyle üretilmiştir.

------------------------------------------------------------------
HATIRLATMA NOTU:

RESTful API, istemci (Frontend / örn. Flutter, React) ile sunucu (Backend / örn. FastAPI, Node.js) arasındaki veri alışverişinin belirli standartlara ve kurallara göre yapıldığı web mimarisidir.

REST (Representational State Transfer) prensiplerine uygun olarak tasarlanan API'lere RESTful API denir.

En basit zihinsel benzetmeyle: RESTful API, ön yüz ile arka yüz arasındaki "ortak garson" gibidir. İstemci mutfaktan (sunucudan) ne istediğini standart bir dille söyler, garson da yemeği (JSON verisini) getirir.

RESTful API'nin 3 Temel Anayasası

Bir API'nin "RESTful" olabilmesi için temel olarak şu 3 kurala uyması gerekir:

1. Kaynak Temelli URL (Resource-Based URLs)
REST'te her veri bir kaynaktır (resource) ve URL'ler eylemleri değil, isimleri (nesneleri) temsil eder.

❌ Kötü (RESTful Değil): /kullanicilariGetir, /kullaniciSil?id=5 (Eylem içeriyor)

✅ İyi (RESTful): /kullanicilar, /kullanicilar/5 (Sadece nesne ismi içeriyor)

2. Standart HTTP Metotları (Eylemler)
Ne yapılacağı URL içinde yazmaz; yapmak istediğin eylemi HTTP metodu belirler:

HTTP Metodu,Ne İşe Yarar?,Örnek RESTful Kullanım
GET,Veri çekmek / okumak için,GET /urunler (Tüm ürünleri getir)
POST,Yeni veri oluşturmak için,POST /urunler (Yeni ürün ekle)
PUT / PATCH,Var olan veriyi güncellemek için,PUT /urunler/12 (12 id'li ürünü güncelle)
DELETE,Veri silmek için,DELETE /urunler/12 (12 id'li ürünü sil)

3. Durumsuzluk (Statelessness)
Sunucu (Backend), istemcinin geçmişini veya önceki isteklerini hafızasında tutmaz (session saklamaz).
Atılan her istek kendi içinde bağımsızdır ve gerekli tüm bilgileri (örneğin kullanıcı yetki token'ı / Bearer Token) yanında taşımalıdır.

Özetle

RESTful API, sistemlerin birbiriyle konuşurken karmaşa yaşamaması için "URL'de ismi söyle, HTTP metodunda ne yapacağını belirt, yanıtı da JSON olarak döndür" düzenini kuran evrensel bir standarttır.
----------------------------------------------
NOT:

Yazılımda Iterable (Türkçesi: Yinelenebilir veya Kapsamında Gezilebilir Nesne), elemanları üzerinde teker teker gezilebilen (döngüye sokulabilen) veri yapılarına verilen genel isimdir.

Bir nesnenin iterable olması; onun içindeki elemanlara sırayla (örneğin bir for döngüsü ile) erişebileceğiniz anlamına gelir.