import 'package:flutter/material.dart';

class CardListTileKullanimi extends StatefulWidget {
  const CardListTileKullanimi({super.key});

  @override
  State<CardListTileKullanimi> createState() => _CardListTileKullanimiState();
}

class _CardListTileKullanimiState extends State<CardListTileKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.amber,
        shadowColor: Colors.green,
        elevation: 10,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
               leading: CircleAvatar(child: Icon(Icons.add)),
              trailing: CircleAvatar(child: Icon(Icons.arrow_back)),
              title: Text("Emre Altunbilek"),
              subtitle: Text("Flutter Developer"),
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
          ],
        ),
      ),
    );
  }
}
