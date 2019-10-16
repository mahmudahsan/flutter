import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Animated Container',
          ),
        ),
        body: Center(
          child: AnimatedContainer(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              final random = Random();
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              _color = Color.fromRGBO(random.nextInt(256), random.nextInt(256),
                  random.nextInt(256), 1);

              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
        ),
      ),
    );
  }
}

class AnimatedImageMorphing extends StatefulWidget {
  @override
  _AnimatedImageMorphingState createState() => _AnimatedImageMorphingState();
}

class _AnimatedImageMorphingState extends State<AnimatedImageMorphing> {
  double _height = 400;
  double _width = 400;
  String imageUrl1 =
      'https://images.unsplash.com/photo-1561363702-e07252da3399?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2550&q=80';
  String imageUrl2 =
      'https://images.unsplash.com/photo-1548304988-2ba732bfa449?ixlib=rb-1.2.1&auto=format&fit=crop&w=2550&q=80';

  int index = 0;
  String imageUrl;

  @override
  void initState() {
    super.initState();

    imageUrl = 'images/1.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Morphing'),
        ),
        body: Center(
          child: AnimatedContainer(
            height: _height,
            width: _width,
            duration: Duration(seconds: 2),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.play_arrow),
          onPressed: () {
            setState(() {
              index += 1;
              if (index % 2 == 0) {
                imageUrl = 'images/1.jpeg';
              } else {
                imageUrl = 'images/2.jpeg';
              }
            });
          },
        ),
      ),
    );
  }
}
