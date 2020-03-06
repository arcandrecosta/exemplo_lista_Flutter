import 'package:devpictures/controller/controller.dart';
import 'package:devpictures/model/post.dart';
import 'package:devpictures/screens/feed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FindAll findAll = new FindAll();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFFEEEEEE),
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          "Instagram",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Feather.camera,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              FontAwesome.send_o,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FutureBuilder(
                initialData: List(),
                future: findAll.getPosts(),                
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasData) {
                        final List<Post> listaPosts = snapshot.data;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: listaPosts.length,
                             shrinkWrap: true,                             
                            itemBuilder: (context, index) {
                              return Feed(post: listaPosts[index],);
                            },
                          ),
                        );
                      } 
                      break;

                    default:
                    return Container();
                  }
                }),
           
          ],
        ),

//        child: Column(
//
//
//          children: <Widget>[
//            StreamBuilder<List<Post>>(
//                initialData: new List<Post>(),
//                stream: controller.saida,
//                builder: (context, snapshot) {
//                  List<Widget> listAux = new List<Widget>();
//                  snapshot.data.forEach((post) {
//                    listAux.add(
//                        ///criar aqui seu componente que listara essa lista
//                        Text(post.person.name),
//
//                    );
//                  });
//
//                  return Column(
//                    children: listAux,
//                  );
//                }),
//
////            for(PostModel post in controller.lista)Text(post.person.name)
//          ],
//        ),
      ),
    );
  }
}
