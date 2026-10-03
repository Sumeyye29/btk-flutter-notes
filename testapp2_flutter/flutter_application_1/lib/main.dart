import 'package:flutter/material.dart';
import 'package:flutter_application_1/dropdown_popup.dart';


void main(List<String> args) {
  debugPrint("Main metodu tetiklendi.");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("MyApp metodu tetiklendi.");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
        ),
        useMaterial3: false,
        textTheme: TextTheme(
          labelLarge: TextStyle(
            fontSize: 24,
            color: Theme.of(context).colorScheme.primary,
          ),
        ), //üst widget app ama onun içinde tema değerleri yok,o yüzden default mor old. için yazı da mor olur.
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
        ),
      ),
      home: DropdownPopup(),
    ); //varsayılan değerleri geri döndürsün diye
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _sayac = 0;

  void _sayacArttir() {
    setState(() {
      _sayac++;
      debugPrint("Sayacın şuanki değeri: $_sayac");
    });
  }

  void _sayacAzalt() {
    setState(() {
      _sayac--;
      debugPrint("Sayacın şuanki değeri: $_sayac");
    });
  }

  void _sayacSifirla() {
    setState(() {
      _sayac = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("HomePage metodu tetiklendi.");
    return Scaffold(
      appBar: AppBar(title: Row(children: [Text("Bölüm 2")])),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Butona basılma sayısı:",
              style: Theme.of(context).textTheme.labelLarge,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _sayac.toString(),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: _sayac < 0 ? Colors.red : Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: () {
                _sayacAzalt();
              },
              child: Icon(Icons.remove),
            ),
          ),
          SizedBox(height: 2),
          FloatingActionButton(
            onPressed: () {
              _sayacArttir();
            },
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              _sayacSifirla();
            },
            child: Icon(Icons.refresh),
          ),
        ],
      ),
    ); //varsayılan değerleri geri döndürsün diye
  }
}
