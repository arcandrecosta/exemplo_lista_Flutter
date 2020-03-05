import 'package:devpictures/controller/controller.dart';
import 'package:devpictures/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        title: Text("teste"),
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
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Icon(Icons.album),
                                title: Text(listaPosts[index].person.name),
                                subtitle: Text(
                                    'Music by Julie Gable. Lyrics by Sidney Stein.'),
                              );
                            },
                          ),
                        );
                      } else {
                        return Container(
                          color: Colors.red,
                        );
                      }
                      break;
                    default:
                  }
                }),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: const Text('BUY TICKETS'),
                  onPressed: () {/* ... */},
                ),
                FlatButton(
                  child: const Text('LISTEN'),
                  onPressed: () {/* ... */},
                ),
              ],
            ),
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
