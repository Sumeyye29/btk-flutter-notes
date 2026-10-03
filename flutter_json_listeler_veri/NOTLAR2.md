ListView.Builder sayesinde ekranda 1000 tane verili liste de olsa ekranda görünmeyen kısım hafızaya geri verilerek performans artımı sağlanır.(lazy loading)
------------------------------------------------------------------------
GestureDedector:card daki listedeki herhangi bi verite tıklanınca aksiyon almak için(ne bilm başka bi sayfaya yönlendirilmek için falan)
------------------------------------------------------------------------
GridView :düz liste değil de ızgara şeklinde liste yapabilmek için(galeri uygulaması mesela)
------------------------------------------------------------------------
MediaQuery(Medya Sorgusu): Kullanılan telefon/tablete özel kodlar yazarken kullanılır(mesela width 400 den büyükse şunu yap küçükse şunu yap gibi)(responsive tasarım yapmak için)
------------------------------------------------------------------------
listtile ile listview arasındaki farklar neler?

Kısaca:

ListTile: tek bir satır öğesi
ListView: bir liste ekranı / çoklu öğeleri barındıran yapı
Şöyle düşünebilirsin:

ListTile = “bir kart/öğe”
ListView = “bu öğeleri sıralayan konteyner”
Örnek:

ListTile(
  title: Text('Ali'),
)



ListView(
  children: [
    ListTile(title: Text('Ali')),
    ListTile(title: Text('Ayşe')),
    ListTile(title: Text('Mehmet')),
  ],
)