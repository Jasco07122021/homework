import 'package:flutter/material.dart';
import 'package:homework/models/model_les_9.dart';

class Lesson5_9 extends StatefulWidget {
  const Lesson5_9({Key? key}) : super(key: key);

  @override
  _Lesson5_9State createState() => _Lesson5_9State();
}

class _Lesson5_9State extends State<Lesson5_9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("facebook"),
        titleTextStyle: TextStyle(
          color: Colors.blue,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        actionsIconTheme: IconThemeData(color: Colors.grey, size: 30),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 20),
          Icon(Icons.camera_alt),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ///app bar bottom part
          Container(
            height: 120,
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("assets/images/user_5.jpeg"),
                      ),
                      SizedBox(width: 10),
                      Flexible(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "What's on your mind?",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 18),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade800),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _3xButtons(
                        icon: Icons.video_call,
                        color: Colors.red,
                        text: "Live",
                      ),
                      _2x_draw(),
                      _3xButtons(
                        icon: Icons.photo,
                        color: Colors.green,
                        text: "Photo",
                      ),
                      _2x_draw(),
                      _3xButtons(
                        icon: Icons.location_on,
                        color: Colors.red,
                        text: "Check in",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          _divider(),

          ///header
          SizedBox(
            height: 200,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: UserList().listStory.map((e) => _storyCard(e)).toList(),
            ),
          ),
          _divider(),

          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: UserList().listPost.map((e) => _postCard(e)).toList(),
          )
        ],
      ),
    );
  }

  Divider _divider() {
    return Divider(
      height: 10,
      thickness: 10,
      color: Colors.grey.shade800,
    );
  }

  Card _storyCard(User object) {
    return Card(
      color: Colors.black,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Container(
        margin: EdgeInsets.only(right: 10),
        width: 120,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(object.img!),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 17,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(object.img!),
              ),
            ),
            Spacer(),
            Text(
              object.name,
              style: TextStyle(color: Colors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Container _2x_draw() {
    return Container(
      width: 1,
      color: Colors.grey,
      margin: EdgeInsets.symmetric(vertical: 15),
    );
  }

  Expanded _3xButtons({icon, color, text}) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 7),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }

  SizedBox _postCard(User object) {
    return SizedBox(
      height: 450,
      width: double.infinity,
      child: Card(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              textColor: Colors.grey,
              iconColor: Colors.grey,
              leading: CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(object.postImg!),
              ),
              title: Text(
                object.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(object.time!),
              trailing: Icon(Icons.more_horiz),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "All the Lorem Ipsum generators on the Internet\ntend to repeat",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      "assets/images/img_18.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      "assets/images/story_4.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Stack(
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 13,
                      backgroundColor: Colors.blue,
                      child: Icon(
                        Icons.thumb_up,
                        size: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15,
                      child: CircleAvatar(
                        radius: 13,
                        backgroundColor: Colors.red,
                        child: Icon(
                          Icons.favorite,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: Text(
                "2.5K",
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Text(
                "400 Comments",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
