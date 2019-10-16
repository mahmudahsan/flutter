import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Lists Demo'),
            bottom: TabBar(tabs: [
              Tab(
                text: 'Vertical',
              ),
              Tab(
                text: 'Horizontal',
              ),
              Tab(
                text: 'Grid',
              ),
              Tab(
                text: 'Mix',
              ),
            ]),
          ),
          body: TabBarView(children: [
            List1(
              title: 'List Vertical',
            ),
            ListHorizontal(),
            ListGrid(),
            MixList(
              items: getListItems(1000),
            ),
          ]),
        ),
      ),
    );
  }
}

class List1 extends StatelessWidget {
  final String title;

  List1({this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Map'),
            onTap: () {
              print('Map Clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Album'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}

class ListHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 200.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print('Red clicked');
            },
            child: InkWell(
              child: Container(
                width: 160.0,
                color: Colors.red,
              ),
            ),
          ),
          Container(
            width: 160.0,
            color: Colors.green,
          ),
          Container(
            width: 160.0,
            color: Colors.yellow,
          ),
          Container(
            width: 160.0,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class ListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,
      crossAxisCount: 2,
      children: List.generate(100, (index) {
        return Center(
          child: Container(
            height: 150,
            width: 150,
            color: Colors.grey[200],
            child: Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        );
      }),
    );
  }
}

// Mixed type of list

abstract class ListItem {}

class HeadingItem extends ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem extends ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}

// Widget for Mixed type of list
List<ListItem> getListItems(int length) {
  return List<ListItem>.generate(length, (i) {
    return i % 6 == 0
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i', 'Message Body $i');
  });
}

class MixList extends StatelessWidget {
  final List<ListItem> items;

  MixList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is HeadingItem) {
          return ListTile(
            title: Text(
              item.heading,
              style: Theme.of(context).textTheme.headline,
            ),
          );
        } else if (item is MessageItem) {
          return ListTile(
            title: Text(item.sender),
            subtitle: Text(item.body),
          );
        }
      },
    );
  }
}
