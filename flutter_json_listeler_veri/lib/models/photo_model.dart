import 'dart:convert';

class Photo {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;
/*bunların hepsi property yani değişken. Bunlar Photo sınıfının özellikleri.*/
    Photo({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Photo.fromRawJson(String str) => Photo.fromJson(json.decode(str));

   

    factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

}