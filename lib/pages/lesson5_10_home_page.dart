import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/models/model_les_10_home.dart';
import 'package:homework/models/model_les_9.dart';

class Lesson5_10_HomePage extends StatefulWidget {
  const Lesson5_10_HomePage({Key? key}) : super(key: key);

  @override
  _Lesson5_10_HomePageState createState() => _Lesson5_10_HomePageState();
}

class _Lesson5_10_HomePageState extends State<Lesson5_10_HomePage> {
  int _indexPage = 0;
  var faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.camera_alt_outlined),
        title: Text("Instagram"),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.grey),
        titleTextStyle: TextStyle(color: Colors.grey, fontSize: 20),
        actions: const [
          Icon(Icons.airplay_outlined),
          SizedBox(width: 20),
          Icon(Icons.send),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),

          ///header
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _textHeader("Stories"),
                    _textHeader("Watch All"),
                  ],
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    children:
                        UserList().listStory.map((e) => _addStory(e)).toList(),
                  ),
                )
              ],
            ),
          ),

          ///body
          Column(
            children: PostList().list.map((e) => _addPost(e)).toList(),
          ),
        ],
      ),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _addPost(UserPost object) {
    return SizedBox(
      height: 420,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(object.img),
            ),
            title: Text(object.name),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            ),
            iconColor: Colors.grey,
            textColor: Colors.grey,
          ),
          Expanded(
            child: Image.asset(
              object.postImg,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {}, icon: Icon(CupertinoIcons.chat_bubble)),
              IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              Spacer(),
              IconButton(onPressed: () {}, icon: Icon(Icons.bookmark_border)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: RichText(
              maxLines: 3,
              text: TextSpan(
                text: "Liked By ",
                style: TextStyle(color: Colors.grey),
                children: [
                  textSpan(),
                  textSpan(),
                  TextSpan(
                      text: faker.person.firstName(),
                      style: TextStyle(color: Colors.white)),
                  TextSpan(text: " and "),
                  TextSpan(
                      text: "1263 others",
                      style: TextStyle(color: Colors.white)),
                  TextSpan(
                    text: "\nBrianne ",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: faker.lorem.sentence(),
                  ),
                  TextSpan(text: "\n" + faker.date.month() + " " + faker.date.year())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextSpan textSpan() {
    return TextSpan(
      text: faker.person.firstName() + ", ",
      style: TextStyle(color: Colors.white),
    );
  }

  Padding _addStory(User object) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.purple, width: 1.5),
            ),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(object.img!),
            ),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: 60,
            child: Text(
              object.name,
              style: TextStyle(color: Colors.grey),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Text _textHeader(text) => Text(
        text,
        style: TextStyle(color: Colors.grey),
      );

  BottomNavigationBar _bottomNavigation() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: ""),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: ""),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.plus_square), label: ""),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.heart), label: ""),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: ""),
      ],
      onTap: (index) {
        setState(() {
          _indexPage = index;
        });
      },
      iconSize: 25,
      currentIndex: _indexPage,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    );
  }
}
