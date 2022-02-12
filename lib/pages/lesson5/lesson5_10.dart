import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homework/main.dart';
import 'package:homework/models/model_les_10.dart';

class Lesson5_10 extends StatefulWidget {
  const Lesson5_10({Key? key}) : super(key: key);

  @override
  _Lesson5_10State createState() => _Lesson5_10State();
}

class _Lesson5_10State extends State<Lesson5_10> {
  int selectPostList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            MyApp.themeNotifier.value =
                MyApp.themeNotifier.value == ThemeMode.light
                    ? ThemeMode.dark
                    : ThemeMode.light;
          },
          icon: Icon(MyApp.themeNotifier.value == ThemeMode.light
              ? CupertinoIcons.moon
              : CupertinoIcons.sun_min),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              CupertinoIcons.lock_fill,
              size: 13,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "jacob_w",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Icon(
              CupertinoIcons.chevron_down,
              size: 13,
            ),
          ],
        ),
        actionsIconTheme: IconThemeData(size: 30),
        actions: const [
          Icon(CupertinoIcons.bars),
          SizedBox(width: 10),
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///category
                          Row(
                            children: [
                              _circleBorder(
                                  radius: 40.0,
                                  img: "assets/images/user_5.jpeg",
                                  width: 2.0),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: [
                                      _userFollowing(
                                          text: UserList().list[0].postNumber,
                                          category: "Posts"),
                                      _userFollowing(
                                          text: UserList()
                                              .list[0]
                                              .followersNumber,
                                          category: "Followers"),
                                      _userFollowing(
                                          text: UserList()
                                              .list[0]
                                              .followingNumber,
                                          category: "Following"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),

                          ///user information
                          Text(UserList().list[0].name),
                          SizedBox(height: 5),
                          SizedBox(
                            width: 220,
                            child: Text(
                              "Digital goofles designer @pixSeliz\nEverything is designet",
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: 10),

                          ///button edit profile
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                  color: MyApp.themeNotifier.value ==
                                          ThemeMode.light
                                      ? Colors.grey.shade300
                                      : Colors.grey.shade900,
                                  width: 2),
                            ),
                            onPressed: () {},
                            minWidth: double.infinity,
                            child: Text(
                              "Edit Profile",
                            ),
                          ),

                          ///story part
                          SizedBox(
                            height: 120,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              physics: BouncingScrollPhysics(),
                              children: UserList()
                                  .listStory
                                  .map((e) => _addStory(e))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              TabBar(tabs: const [
                Tab(
                  icon: Icon(CupertinoIcons.rectangle_split_3x3),
                ),
                Tab(
                  icon: Icon(CupertinoIcons.person_crop_square),
                ),
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 3),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                      ),
                      children: UserList()
                          .listPosts
                          .map((e) => _addPosts(e))
                          .toList(),
                    ),
                    GridView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(top: 3),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                      ),
                      children: UserList()
                          .listPosts
                          .map((e) => _addPosts(e))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 30, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(
              CupertinoIcons.home,
              size: 28,
            ),
            Icon(
              CupertinoIcons.search,
              size: 28,
            ),
            Icon(
              CupertinoIcons.plus_square,
              size: 28,
            ),
            Icon(
              CupertinoIcons.heart,
              size: 28,
            ),
            Icon(
              CupertinoIcons.circle,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }

  Image _addPosts(Post object) {
    return Image.asset(
      object.img!,
      fit: BoxFit.cover,
    );
  }

  Container _circleBorder({img, radius, width, txt}) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade800, width: width),
      ),
      padding: EdgeInsets.all(5),
      child: img != null
          ? CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(img),
            )
          : CircleAvatar(
              radius: radius,
              child: Text(
                txt,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              backgroundColor: Colors.transparent,
            ),
    );
  }

  Padding _addStory(Story object) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _circleBorder(
            img: object.imgStory,
            radius: 30.0,
            width: 1.0,
            txt: object.txtStory,
          ),
          SizedBox(height: 5),
          Text(object.nameStory),
        ],
      ),
    );
  }

  Expanded _userFollowing({text, category}) {
    return Expanded(
      child: Column(
        children: [
          Text(
            text ?? "0",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 4),
          Text(category),
        ],
      ),
    );
  }
}
