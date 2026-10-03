import 'package:flutter/material.dart';

class ButonTurleri extends StatelessWidget {
  const ButonTurleri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buton Türleri")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.star),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              onLongPress: () {
                debugPrint("Butona uzun basıldı.");
              },
              child: Text("Text Button"),
            ),
            TextButton.icon(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith(
                  /*duruma göre farklı değerler döndürebiliriz(.all olsaydı her durum için bir durum döndürme şansımız olurdu.)*/
                  (states) {
                    if (states.contains(WidgetState.pressed)) {
                      return Colors.red;
                    }
                    if (states.contains(WidgetState.hovered)) {
                      return Colors.green;
                    }
                    return null;
                  },
                ),
              ),
              icon: Icon(Icons.add),
              label: Text("Text Button with Icon"),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.amber,
              ),
              child: Text("Elevated Button"),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.remove),
              label: Text("Elevated Button with Icon"),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.all(16),
                side: BorderSide(color: Colors.purple, width: 4),
                backgroundColor: Colors.pink.withValues(alpha: 0.5),
                /*withopacity yerine artık withValues ile alpha kullanılır saydamlığı değiştirmek için*/
                foregroundColor: Colors.yellow,
                shape: StadiumBorder(),
              ),

              child: Text("Outlined Button"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(width: 4, color: Colors.black26),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), //ovallik miktarı
                ),
              ),
              icon: Icon(Icons.refresh),
              label: Text("Outlined Button with Icon"),
            ),
          ],
        ),
      ),
    );
  }
}
