import 'package:devpictures/model/post.dart';
import 'package:dio/dio.dart';
import 'dart:async';

//class Controller {
//  final StreamController<List<Post>> _streamController = StreamController<List<Post>>.broadcast();
//  Sink<List<Post>> get entrada => _streamController.sink;
//  Stream<List<Post>> get saida => _streamController.stream;
//
//  List<Post> lista = new List<Post>();
//  Future<Post> getPosts() async {
//    Response response = await Dio().get('https://mobile.int.granito.xyz/api/feed/getposts');
//    List<dynamic> teste = response.data;
////    PostModel.fromJson(response.data);
//    await teste.forEach((a)=> lista.add(Post.fromJson(a)));
//    print(lista.length);
//
//    lista.forEach((a)=>print(a.person.name));
//    entrada.add(lista);
//  }
//}

class FindAll {
  Future<List<Post>> getPosts() async {
    try {
      Response response =
          await Dio().get('https://mobile.int.granito.xyz/api/feed/getposts');
      return (response.data as List)
          .map((item) => Post.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
