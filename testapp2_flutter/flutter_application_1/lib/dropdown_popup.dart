import 'package:flutter/material.dart';

class DropdownPopup extends StatelessWidget {
  const DropdownPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_PopupMenuKullanimi()],
        title: Text("Dropdown ve Popup Kullanımı"),
      ),
      body: const Center(
        child: Column(
          children: [DropDownButtonKullanimi(), _PopupMenuKullanimi()],
        ),
      ),
    );
  }
}

class DropDownButtonKullanimi extends StatefulWidget {
  //setState kullanacağımız için stateful
  const DropDownButtonKullanimi({super.key});

  @override
  State<DropDownButtonKullanimi> createState() =>
      _DropDownButtonKullanimiState();
}

class _DropDownButtonKullanimiState extends State<DropDownButtonKullanimi> {
  // ignore: avoid_init_to_null
  var _secilenSehir = null;
  final _sehirler = {
    "Ankara",
    "Bursa",
    "İzmit",
    "İstanbul",
  }; //veritabanından veri çekiyormuşsun gibi düşün.
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Şehir seçin"),
      value: _secilenSehir,
      // items: [
      //   DropdownMenuItem(value: "Ankara", child: Text("Ankara")),
      //   DropdownMenuItem(value: "Bursa", child: Text("Bursa")),
      //   DropdownMenuItem(value: "İzmit", child: Text("İzmit")),
      // ],
      items: _sehirler
          .map(
            (String sehir) =>
                DropdownMenuItem(value: sehir, child: Text(sehir)),
          )
          .toList(),
      onChanged: (value) => {
        debugPrint("Seçilen şehir: $value"),
        setState(() {
          _secilenSehir = value!; //! null olmayacağını garanti eder.
        }),
      },
    );
  }
}

class _PopupMenuKullanimi extends StatefulWidget {
  const _PopupMenuKullanimi();

  @override
  State<_PopupMenuKullanimi> createState() => _PopupMenuKullanimiState();
}

class _PopupMenuKullanimiState extends State<_PopupMenuKullanimi> {
  final _sehirler = {"Ankara", "Bursa", "İzmit", "İstanbul"};
  var _secilensehir = "Ankara";
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: _secilensehir,
      // icon:Icon(Icons.add),
      // child:Text(_secilensehir),
      itemBuilder: (context) {
        //seçim esnasında başka sayfaya gidiyorsak diye ne context yazılır.
        return _sehirler.map((String sehir) {
          return PopupMenuItem<String>(value: sehir, child: Text(sehir));
        }).toList();
      },
      onSelected: (value) {
        setState(() {
          _secilensehir = value;
        });
      },
    );
  }
}
