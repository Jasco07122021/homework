class User {
  String name;
  String nickName;
  String? postNumber;
  String? FollowersNumber;
  String? FollowingNumber;
  String? imgProfile;

  User({
    required this.name,
    required this.nickName,
    this.postNumber,
    this.FollowersNumber,
    this.FollowingNumber,
  });
}

class Story {
  String? txtStory;
  String? imgStory;
  String nameStory;

  Story({this.imgStory,this.txtStory, required this.nameStory});
}

class Post {
  String? img;

  Post({this.img});
}

class UserList {
  List<User> list = [
    User(
      name: "Jacob West",
      nickName: "jacob_w",
      postNumber: "54",
      FollowersNumber: "834",
      FollowingNumber: "162",
    ),
  ];
  List<Story> listStory = [
    Story(nameStory: "New",txtStory: "+"),
    Story(imgStory: "assets/images/img_18.png", nameStory: "Friends"),
    Story(imgStory: "assets/images/image_2.jpg", nameStory: "Sport"),
    Story(imgStory: "assets/images/image_4.jpg", nameStory: "Design"),
  ];

  List<Post> listPosts = [
    Post(img: "assets/images/image_1.jpeg"),
    Post(img: "assets/images/image_2.jpg"),
    Post(img: "assets/images/image_3.png"),
    Post(img: "assets/images/image_4.jpg"),
    Post(img: "assets/images/image_5.jpg"),
    Post(img: "assets/images/img_18.png"),
    Post(img: "assets/images/item_6.jpeg"),
    Post(img: "assets/images/item_7.jpeg"),
    Post(img: "assets/images/image_1.jpeg"),
    Post(img: "assets/images/image_2.jpg"),
    Post(img: "assets/images/image_3.png"),
    Post(img: "assets/images/image_4.jpg"),
    Post(img: "assets/images/image_5.jpg"),
    Post(img: "assets/images/img_18.png"),
    Post(img: "assets/images/item_6.jpeg"),
    Post(img: "assets/images/item_7.jpeg"),

  ];
}
