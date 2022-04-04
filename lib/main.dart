import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DefaultTabController(
            length: 3,
            child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      expandedHeight: 200.0,
                      floating: false,
                      pinned: true,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text('Belajar SliverAppBar', style: TextStyle(color: Colors.white, fontSize: 20.0)),
                        background: Image(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
                      ),
                    ),
                    SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(TabBar(labelColor: Colors.black87, unselectedLabelColor: Colors.grey, tabs: [
                          new Tab(icon: const Icon(Icons.audiotrack), text: "Songs"),
                          new Tab(icon: const Icon(Icons.album), text: "Album"),
                          new Tab(icon: const Icon(Icons.collections), text: "Gallery"),
                        ])))
                  ];
                },
                body: TabBarView(children: <Widget>[
                  _TabBarSongs(),
                  _TabBarAlbum(),
                  _TabBarGallery(),
                ]))));
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _TabBarSongs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(child: ListTile(leading: Image.asset('assets/images/songs.jpg'), subtitle: Text('Lorem ipsum dolor sit amet.', style: TextStyle(fontSize: 12.0)), title: Text('Song ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))));
        });
  }
}

class _TabBarAlbum extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(child: ListTile(leading: Image.asset('assets/images/album.jpg'), subtitle: Text('Lorem ipsum dolor sit amet.', style: TextStyle(fontSize: 12.0)), title: Text('Album ${index + 1}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0))));
        });
  }
}

class _TabBarGallery extends StatelessWidget {
  final List pictures = [
    'assets/images/pic1.jpg',
    'assets/images/pic2.jpg',
    'assets/images/pic3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: 24,
        itemBuilder: (context, index) {
          if (index > 2) {
            return Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(pictures[index % 3]));
          } else {
            return Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(pictures[index]));
          }
        });
  }
}
