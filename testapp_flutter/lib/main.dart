//BÜTÜN WİDGETLERİ BURADA YAZIYORUZ VE DİĞER KLASÖRLERDE (İOS,ANDROİD...) SADECE ONLARA ÖZEL KODLAR YAZIYORUZ*/
//BÜTÜN UYGULAMA BURADAN BAŞLAR

/*-------------------BTK BÖLÜM 2-------------------*/


/*import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const TestApp());
}

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var myvarContainer = Container(
      /*F2 ile adını değiştirebilirsin*/
      color: Colors.green,
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        /*main row olduğu için main row olur ve cross column olur(column olduğubu için main column olur ve cross row olur)*/
        crossAxisAlignment: CrossAxisAlignment.center,
        /*parent row olduğu için main odur ve cross column olur(column olduğubu için main column olur ve cross row olur)*/
        children: [myContainer(), myContainer()],
      ),
    );
    return MaterialApp(
      //home:Text("Merhaba Flutter",)
      home: Scaffold(
        //VARSAYILAN AYARLARLA BOŞ BİR SAYFA OLUŞTURUR
        appBar: AppBar(
          backgroundColor: Colors.red,
          toolbarHeight: 50,
          /*colors static olduğu için direkt sınıf üzerinden nesneye ulaşabildik*/
          title: const Text(
            "Test App",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        //body: myColumnMethod(myvarContainer),
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              /*flexeble ile expanded arasındaki fark:flexeble ile ekrana sığdırmak istediğimiz widgetın boyutunu ayarlayabiliriz(width ile) ama expanded ile ekrana sığdırmak istediğimiz widgetın boyutunu ayarlayamayız,tüm ekrana yayılır*/
              fit: FlexFit.tight,
              /*expanded gibi davranır*/
              flex:
                  1, //Varsayılan olarak 1 gelir, yani ekrana sığdırmak istediğimiz widgetın boyutu 1 birim olur
              child: Container(color: Colors.red, width: 300, height: 300),
            ),
            Flexible(
              flex: 1,
              /*Varsayılan olarak 1 gelir, yani ekrana sığdırmak istediğimiz widgetın boyutu 1 birim olur(kırmızıyla yeşil ekranı yarı yarıya paylaşır 1 e 1 old. için)*/
              child: Container(color: Colors.green, width: 30, height: 300),
            ),
          ],
        ),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            debugPrint("Butona Tıklandı");
          },

          backgroundColor: Colors.red,
          child: const Icon(Icons.add_home_work, color: Colors.black, size: 30),
        ),
      ),
    );
  }

  List<Widget> get expandedAnlatimi {
    return <Widget>[
      Expanded(
        /*önce yellow ve pink containerlar ekrana sığdırılır sonra red container ekrana sığdırılır(kalan kısma sığdırılır)*/ flex:
            1,
        child: Container(color: Colors.red, height: 150),
      ),
      Expanded(
        flex:
            2, //flex tamamen bir orandır 1+2+1=4 oranına göre ekrana sığdırılır
        child: Container(color: Colors.yellow, height: 150),
      ),
      Expanded(flex: 1, child: Container(color: Colors.pink, height: 150)),
    ];
  }

  Column myColumnMethod(Container myvarContainer) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [myvarContainer, myvarContainer],
    );
  }

  Container myContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      padding: const EdgeInsets.all(30),
      width: 150,
      height: 150,
      alignment: Alignment.center,
      color: Colors.yellow,
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        color: Colors.blue,
        child: const Text("Merhaba", style: TextStyle(fontSize: 15)),
      ),
    );
  }
}*/


/*-------------------BTK BÖLÜM 3-------------------*/


import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final url =
      "https://www.adobe.com/tr/products/firefly/features/ai-face-generator/media_14f22f14a841ced8983e87e46e2ed66ff536dcfce.png?width=750&format=png&optimize=medium";

Widget _buildItem(String value,String label){
return Expanded(
                          child: Column(
                            children: <Widget>[
                              Text(
                                value,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(label),
                            ],
                          ),
                        );

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: Text("Profil Sayfası")),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(url),
                ),

                SizedBox(height: 20),

                Text(
                  "Sümeyye Köse",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Flutter Geliştiricisi",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                SizedBox(height: 20),

                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: <Widget>[
                        _buildItem("1.5k", "Takipçi"),
                        _buildItem("2.5k", "Takip"),
                        _buildItem("150", "Gönderi"),
                        
                      ],
                    ),
                  ),
                ),
SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Hakkımda",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Flutter geliştiricisi olarak mobil uygulama geliştirme konusunda deneyim sahibiyim. Flutter ile hızlı ve etkili çözümler üretebilirim.",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


