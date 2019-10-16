import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Fade in Images'),
          ),
          body: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                  Center(
                    child: FadeInImage(
                      placeholder: MemoryImage(kTransparentImage),
                      image: NetworkImage('https://picsum.photos/250?image=9'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              CachedNetworkImage(
                placeholder: (context, url) => CircularProgressIndicator(),
                imageUrl: 'https://picsum.photos/250?image=7',
              ),
            ],
          )),
    );
  }
}
