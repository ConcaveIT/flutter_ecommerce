import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Icon(
          FontAwesomeIcons.airbnb,
          color: Colors.blue,
          size: 25,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const Icon(
          FontAwesomeIcons.bars,
          color: Colors.blue,
          size: 18,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              FontAwesomeIcons.heart,
              color: Colors.blue,
              size: 18,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Icon(
              FontAwesomeIcons.shoppingCart,
              color: Colors.blue,
              size: 18,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              _searchWidget(),
              _subHeadWidget(),
              _categoryWidget(),
              _productTabWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: Card(
            elevation: 0.3,
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Search here',
                focusColor: Colors.blue,
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15.0),
                border: InputBorder.none,
              ),
              keyboardType: TextInputType.text,
            ),
          ),
        ),
        const Expanded(
            flex: 1,
            child: Icon(
              FontAwesomeIcons.microphone,
              color: Colors.blue,
              size: 20,
            ))
      ],
    );
  }

  Widget _subHeadWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Choose Category',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: () {
              print('working');
            },
            child: const Text('See All'),
          ),
        ],
      ),
    );
  }

  Widget _categoryWidget() {
    return Container(
      height: 90,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return _categoryItemWidget();
          }),
    );
  }

  Widget _categoryItemWidget() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blue.shade50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              Icon(
                Icons.laptop_chromebook,
                size: 25,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Chromebook',
                  style: TextStyle(
                    fontSize: 12
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _productTabWidget() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: TabBar(
        indicatorColor: Colors.white,
        tabs: [
          Tab(text: 'DOGS', icon: Icon(Icons.favorite)),
          Tab(text: 'CATS', icon: Icon(Icons.music_note)),
          Tab(text: 'BIRDS', icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}