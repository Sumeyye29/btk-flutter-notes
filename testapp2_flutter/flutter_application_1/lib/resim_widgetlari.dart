import 'package:flutter/material.dart';

class ResimWidgetlari extends StatelessWidget {
 const ResimWidgetlari({super.key});

 final _url =
      "https://www.minecraft.net/content/dam/minecraftnet/games/minecraft/key-art/Homepage_Discover-our-games_MC-Vanilla-KeyArt_864x864.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Resim Widgetları")),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.blue.shade300,
                    child: Image.asset(
                      "assets/images/mc_sandikodasi_tasarim.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 300,
                    height: 300,
                    color: Colors.green.shade300,
                    child: Image.network(_url, fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(
                  "assets/images/mc_sandikodasi_tasarim.png",
                ),
                image: NetworkImage(_url),
              ),
            ),
            Expanded(
              child: Placeholder(color: Colors.amber),
            ), //resim sonradan gelecekse
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CircleAvatar(
                      backgroundImage: AssetImage(
                        "assets/images/mc_sandikodasi_tasarim.png",
                      ),
                      radius: 100,
                    ),
                  ),
                   Expanded(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                 _url,
                ),
                radius: 100,
              ),
            ),
                ],
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
