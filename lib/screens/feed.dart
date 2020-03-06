import 'package:devpictures/model/post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Feed extends StatelessWidget {
  final Post post;

  const Feed({Key key, this.post}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          //primeira linha da foto no feed
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: NetworkImage(post.person.profilePhotoUri),
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(post.person.name)
                  ],
                ),
                IconButton(
                    icon: Icon(SimpleLineIcons.options), onPressed: () {})
              ],
            ),
          ),      

          Image(
            image: NetworkImage(post.photoUri),
            width: MediaQuery.of(context).size.width,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesome.heart_o),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesome.comment_o),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesome.send_o),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Curtido por ",
                        style: TextStyle(color: Colors.black)),
                    TextSpan(
                        text: "${post.likes} pessoas",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black)),
                  ]),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
