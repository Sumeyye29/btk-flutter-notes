Uygulamanın adını AndroidManifest.xml dosyası içinde değiştirebilirsin.(orada uygulamanın ayarları gibi değiştirebileceğin şeyler bulunur.)
----------------------------------------------------------------
 const MyWidget({super.key});    bu ne demek?

 Adım adım okuma
const MyWidget({Key? key}) : super(key: key);

const

Bu constructor’un sabit (const) bir constructor olduğunu söyler.
Yani uygun durumlarda const MyWidget() şeklinde kullanılabilir.
MyWidget(...)

Evet, bu satırda MyWidget constructor adı.
Sınıf adıyla aynı olan bu yapı bir constructor’dır.
({Key? key})

Buradaki parantez içinde key adlı bir parametre var.
{...} demek: bu parametreye isimle (named) ve isteğe bağlı (optional) erişebilirsin.
Key? demek: bu parametre null olabilir.
:

: Dart’ta constructor başlatıcı listesi demek.
Constructor gövdesinden önce çalışacak ifadeleri başlatır.
Bunlar çoğunlukla super(...) veya alan değer atamaları için kullanılır.
super(key: key)

super üst sınıfın constructor’ını çağırır.
Yani MyWidget sınıfı içinde gelen key değerini, üst sınıfa gönderiyor.
Burada sol taraf (key:) üst sınıfın parametresinin adı.
Sağ taraf (key) şu constructor’a gelen parametre.
Yani nasıl yorumlamalıyız?
MyWidget constructor’ı bir key parametresi alıyor.
Constructor başladığında önce super(key: key) çalışıyor.
Bu sayede widget’ınızın üst sınıfı da aynı Key bilgisiyle başlatılıyor.
Özet cümle
MyWidget constructor’ı key parametresini alır, ardından super(key: key) ile bu değeri üst sınıfa iletir.

-Key widget’ları ayırt etmeye yarar.
-Aynı tipte ve aynı konumda olan widget’lar varsa, Flutter onları tanımlamakta zorlanabilir.
-Bu durumda key ile her bir widget’a benzersiz kimlik verirsin.

Örnek
Aynı Text widget’ından iki tane olsa bile:

Text('Merhaba', key: ValueKey(1))
Text('Merhaba', key: ValueKey(2))

Flutter ikisini farklı olarak görür.
----------------------------------------------------------------
Flutter da overloading yoktur,onun yerine başka alternatifler var(overloading:aynı metod adıyla yazılmış metodlara farklı türde parametre gönderme)
----------------------------------------------------------------
NOT:

Flutter’da build() nasıl ve neden aşırı yüklenir?
1. build() nerede var?
StatelessWidget veya State<T> sınıfından türettiğin widget’ta build() metodunu yazarsın.
Bu metod widget’ın ekrana çizilecek içeriğini döndürür.

3. Neden @override kullanıyoruz?
@override yazmak, Dart’a bu metodun üst sınıftaki aynı isimdeki metodu yeniden tanımladığını söyler.
Flutter widget’ları için zorunlu değil ama kodun daha okunabilir ve güvenli olmasını sağlar.
4. build() neden önemli?
Flutter her UI güncellemesinde build() metodunu tekrar çağırır.
İçerik yeniden çizilir; bu yüzden burada sadece UI oluşturma kodu olmalı, ağır işlem olmamalı.
5. build() içinde ne yapılmaz?
Uzun hesaplamalar
dosya okuma/yazma
ağ isteği
sürekli setState()
Bunları initState(), async fonksiyonlar veya başka mantık katmanlarına koymak daha iyi.
6. Kısaca
build()’ü override ederek ekranını çizersin.
build() her yeniden çizimde çalışır.
Bu yüzden build()’ü sadece widget ağacını tanımlamak için kullan, ağır işi oraya koyma.



ÇOK ÖNEMLİ EK NOT:

birden fazla text kullanıp key kullanmamama rağmen fllutter hangi text i  uygulamada nereye yazacığını nasıl biliyodu o zaman?


Flutter bunu zaten konuma göre ayırıyor
Key bir ekstra kimlik.
Ama Flutter ilk başta widget’ları sadece key ile ayırmak zorunda değil.
Peki nasıl biliyor?
Flutter, widget ağacını runtimeType + pozisyon + parent ilişkisi ile eşler.
Yani bir Column içinde 3 tane Text varsa:
birincisi ilk çocuk,
ikincisi ikinci çocuk,
üçüncüsü üçüncü çocuk
olarak takip eder.

Column(
  children: [
    Text('A'),
    Text('B'),
    Text('C'),
  ],
)



Bu yapıda Flutter “A”, “B”, “C” yi pozisyonlarına göre bilir.
Eğer bu liste değişmezse Key kullanmaya gerek yok.
Ne zaman Key lazım?
Aynı tipte widget’lar bir listede yeniden sıralandığında
öğe eklenip silindiğinde
aynı tipte stateful widget’ların durumu korunmak istendiğinde
Örnek:

Text stateless olduğu için genelde sorun olmaz.
Ama StatefulWidget içeren bir listeyi karıştırırsan anahtar kullanmak gerekir.
Özet
Key olmadan Flutter, widget’ları ağaçtaki konumlarına göre takip eder.
Key sadece pozisyon değiştiğinde ya da aynı tipteki öğelerin karışma riski olduğunda devreye girer.
----------------------------------------------------------------
class CardListTileKullanimi extends StatefulWidget {
  const CardListTileKullanimi({super.key});

  @override
  State<CardListTileKullanimi> createState() => _CardListTileKullanimiState();
}

class _CardListTileKullanimiState extends State<CardListTileKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Bu kodu satır satır açıklayalım:

1) class CardListTileKullanimi extends StatefulWidget
class yeni bir sınıf tanımlar.
CardListTileKullanimi bu widget’ın adı.
extends StatefulWidget demek: bu widget “durumlu” bir widget yani kendi iç durumunu tutabilir.
2) const CardListTileKullanimi({super.key});
Bu, widget’ın constructor’ı.
const dersek widget sabit oluşturulabilir.
{super.key}:
key isteğe bağlı bir parametre.
super.key ile bu key değeri üst sınıfa (StatefulWidget) gönderilir.
Bu, Flutter’ın widget’ı doğru takip etmesi için kullanılır.
3) @override
Üst sınıftan gelen metodu yeniden tanımladığımızı bildirir.
Burada createState() metodunu ezip kendi versiyonumuzu kullanıyoruz.
4) createState() neden var?
const MyWidget({Key? key}) : super(key: key);
StatefulWidget kendisi sadece widget tanımıdır.
Gerçek “değişen veri” ve build() işini yapan sınıf başka bir sınıftır.
createState() ise bu stateli oluşturan metot:
widget için bir State nesnesi üretir.
Yani:

CardListTileKullanimi = widget tanımı
_CardListTileKullanimiState = bu widget’ın durumu ve ekranı
5) _CardListTileKullanimiState neden private?
Dart’ta başına _ koymak “private” demek.
Yani bu sınıf sadece aynı dosyada kullanılabilir.
Bu iyi pratiğe uyar:
dışarıdan doğrudan erişilmesini istemediğin iç detayları saklamak için
sadece widget’ın kendi iç mekanizması olduğunu belirtmek için
State sınıfının dışarıdan kullanılmasına genellikle gerek yok, bu yüzden private yapılır.




Stateful ile Stateless farkı
StatefulWidget
İçinde değişen veri olabilir.
setState() çağırarak UI’yi yeniden çizebilir.
Örnek: sayaç, buton tıklaması, form verisi, animasyon durumu.
StatelessWidget
Değişen hiç bir durum tutmaz.
Yalnızca constructor’dan gelen değerlerle ekranda çizim yapar.
build() bir kere çalışır; veriler değişince yeni widget yeniden oluşturulur.
Örnek fark:

StatelessWidget: sadece sabit görünüm.
StatefulWidget: kullanıcı etkileşimiyle veya async işlemle durumu değiştirir.
Özet
StatefulWidget iki parçadan oluşur: widget ve state.
Widget kısmı sabit bilgiyi taşır.
State kısmı UI mantığını ve değişen veriyi tutar.
StatelessWidget ise bu iki parçayı birleştirmeden sadece sabit görünüm sunar.




kendi iç durumunu tutabilir ne demek?
Evet, doğru: “ekranda bir şeyi değiştirebilen widget” demek.

StatefulWidget, kendi içinde değişebilecek bir veri veya durum tutar.
Örneğin bir sayaç, seçili kart, açık/kapalı buton durumu, metin alanındaki yazı vs.
Bu durum değiştiğinde setState() ile yeniden çizilir ve ekrandaki içerik güncellenir.
Yani:

StatelessWidget = sabit, değişmeyen içerik
StatefulWidget = değişebilen, iç durum yapan içerik



StatefulWidget ekranda değişiklik yapabilen widget demektir; ve o değişimi yapan asıl sınıf State içindedir.
----------------------------------------------------------------
NOT(nerede metot nerede ayrı class kullanmalıyız(ayrı dosya açarak)):
eğer aynı dosyada kullanılacak bir şeyse metot, projenin farklı dosyalarından da ulaşmak/kullanmak istersek ayrı dosyaya widget/class açarız.
----------------------------------------------------------------
flutter pub get:

pubspec.yaml Dosyasını Okur:
Projedeki pubspec.yaml dosyası senin ihtiyaç listendir (örneğin Google Fonts, HTTP istekleri, ikon paketleri vs.). flutter pub get dediğinde Flutter gider bu dosyaya bakar.

Paketleri İndirir:
Listede yazan paketleri pub.dev sitesinden bulur ve bilgisayarındaki önbelleğe (cache) indirir.

Projeye Bağlar:
İndirdiği bu paketleri projenin kodlarıyla ilişkilendirir. Böylece sen .dart dosyalarında import 'package:paket_adi/...' diyerek o hazır kodları kullanabilir hale gelirsin.

Ne Zaman Çalıştırmalısın?
pubspec.yaml dosyasına yeni bir paket (dependency) eklediğinde veya çıkardığında.

İnternetten/GitHub'dan hazır bir Flutter projesi indirdiğinde (çünkü projeyi paylaşan kişiler devasa paket klasörlerini yüklemezler, senin pub get yapıp indirmeni beklerler).

Kodda import ettiğin paketler kırmızı altı çizili uyarı verdiğinde.

İpucu: VS Code kullanıyorsan, pubspec.yaml dosyasını düzenleyip Ctrl + S yapıp kaydettiğinde VS Code arkada otomatik olarak flutter pub get komutunu çalıştırır. Terminalden elle yazmana her zaman gerek kalmaz!