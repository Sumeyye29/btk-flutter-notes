setState(){}    ile kodda yapılan değişiklik ekranda da gözükür(build metotunu tetikleyerek)

-------------------------------------------------------------------------------------------------------------------------------------------------------------
Hot Reload/Restart Farkı:
-Hot Reload da main metodu çalışmaz,yani maine kütüphane eklemek gibi büyük değişikliklerde restart yapmmak gerekiyor.  
-Hot Reload da state teki veriler korunurken restart ta korunmaz ve en baştan başladığı için sıfırlanır.
-setState çalıştığında sadece ilgili widget ın build metotu çalışır.
-stateler (değişkenler) buildin içinde değil class ın içinde tanımlanır.
-------------------------------------------------------------------------------------------------------------------------------------------------------------
context:
-context, “bu widget hangi ağaçta, hangi konumda duruyor?” bilgisini tutan bir nesnedir.

Theme.of(context).textTheme.labelLarge
-Buradaki context sayesinde HomePage üst widget ındaki temayı kullanabilir(MaterialApp)

Contextsiz kullanım:
style: ThemeData.light().textTheme.labelLarge
-Burada kendi temamızı kendimiz oluşturuyoruz,böylelikle widget ağacındaki konumumuzu bilmemize ve context kullanmamıza gerek kalmıyor.

NOT:
Eğer contex i kullandığın widget ın üst widget ında theme parametresi yoksa default tema kullanılır.
--------------------------------------------------------------------------------------------------------------------------------------------------------------
NOT:
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.purple,
    useMaterial3: false,
    textTheme: TextTheme(labelLarge: TextStyle(fontSize: 24)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.yellow,
    ),
  ),
  home: HomePage(),
)

-Buradaki theme parametreyken ThemeData MaterialApp in nesnesidir.(Yani üstteki tema, MaterialApp’in theme parametresine verdiğin ThemeData nesnesidir.)


--------------------------------------------------------------------------------------------------------------------------------------------------------------
Projeme kütüphane eklemek istediğimde(mesela toast ları kullanmak istiyorum ve bunun için kütüphane indirmeliyim.):
1.inte pub dev yazıyoruz.
2.İlgili paketin adını aratıp benim projeme uygunluğuna bakıyoruz.
3.installing seçeneğine gelerek seçeneklerden birine uyarak paketi indiriyoruz(meselaa pubspec.yaml a ekleyerek denedim,sonra sağ üstte çıkan indirme butonuna tıkladım,aynı zamanda sitedeki View/report issues a tıklayarak o paketle ilgili daha önce yaşanmış problemleri ve çözümlerini görebilirsin)
4.Example seçeneğiyle örnek kullanımı görüntüleyebilirsin.(aynı şekilde bağlamsız olarak readme den)
5.kütüphaneyi import etmeyi unutma.
6.kütüphaneyi ekledikten sonra projeyi kapatıp aç.

--------------------------------------------------------------------------------------------------------------------------------------------------------------

İki Method kullanımı farkı: 
1. _renginKodunuGoster (Metod Referansı / Function Tear-off)

onPressed: _renginKodunuGoster,

Nasıl Çalışır? Metodun sonuna parantez () koymadan, doğrudan ismini verirsin. Tıklama anında Flutter bu fonksiyonu kendisi tetikler.

Avantajı: Çok daha temiz, okunaklı ve kısadır.

Şartı: Bu şekilde kullanabilmen için _renginKodunuGoster metodunun hiçbir parametre almaması (yani onPressed'in beklediği void Function() imzasına birebir uyması) gerekir.

_containerSekliniDegistir (Anonim Fonksiyon İçinde Çağrı)

onPressed: () {
  _containerSekliniDegistir();
}

Nasıl Çalışır? onPressed'e süslü parantezlerle boş bir anonim fonksiyon () { ... } verirsin ve onun gövdesi içinde metodunu parantez () ile çağırırsın.

Avantajı / Farkı:

Parametre Gönderebilirsin: Eğer bu metod parametre alıyor olsaydı (örn: _containerSekliniDegistir(true)), bunu sadece bu yöntemle çağırabilirdin.

Birden Fazla İşlem Yapabilirsin: Butona basıldığında tek bir metod değil, sırayla birden fazla işlem yaptırmak istiyorsan bu yöntemi kullanman gerekir.

Dezavantajı: Bu örnekteki gibi parametresiz ve tek satırlık bir metod çağrısı için fazladan kod (boilerplate) yazmış olursun.

Özet Karşılaştırma:

Özellik,_renginKodunuGoster,() { _containerSekliniDegistir(); }
Teknik Adı,Method / Function Tear-off,Anonymous Function / Lambda
Parametre Gönderimi,İmkansız (Parametre almayan metotlar için),Mümkün (Örn: _metod(5))
Çoklu Satır / İşlem,Desteklemez,Destekler
Kod Temizliği,Daha kısa ve sade,Biraz daha uzun

--------------------------------------------------------------------------------------------------------------------------------------------------------------
REFACTOR: Başka kullanıcılar kodlara baktığında kolaylıkla anlamalı(klasörleme mantığı kullanılır:lib içine pages,theme klasörleri açılarak main.dart ın uzunluğu kısaltılmış ve kod bölümlere ayrılarak yapılması gereken değişikliklerin daha kısa zamanda ve kolaylıkla yapılmasını sağlar.)