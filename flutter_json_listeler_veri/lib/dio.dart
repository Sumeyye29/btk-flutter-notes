import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_json_listeler_veri/models/photo_model.dart';

class DioExample extends StatelessWidget {
  const DioExample({super.key});

  Future<List<Photo>> _getphotos() async {
    try{
    final dio = Dio();
    const url = "https://jsonplaceholder.typicode.com/photos";
    final response = await dio.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      final List<Photo> photolist = data.map((element) => Photo.fromJson(element)).toList();
      return photolist;
    } else {
      return [];
    }
  }
  catch (e) {
      debugPrint("Error: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    _getphotos();
    return Container();
  }

}

     




 /*
 //Dio paketini kullanmak için önce pubspec.yaml dosyasına eklememiz gerekir.
  //dio: ^6.1.0
  //Daha sonra import etmemiz gerekir.
  //import 'package:dio/dio.dart';
  //Dio paketini kullanmak için önce bir Dio nesnesi oluşturmamız gerekir.
  //Dio dio = Dio();
  //Daha sonra dio nesnesi ile istek yapabiliriz.
  //dio.get('https://jsonplaceholder.typicode.com/posts');}*/
