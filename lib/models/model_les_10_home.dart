import 'package:faker/faker.dart';

var faker = Faker();

class UserPost {
  String name;
  String img;
  String postImg;
  String text;

  UserPost(
      {required this.name,
      required this.img,
      required this.postImg,
      required this.text});
}

class PostList {
  List<UserPost> list = [
    UserPost(
        name: faker.person.name(),
        img: "assets/images/user_1.jpeg",
        postImg: "assets/images/feed_1.jpeg",
        text: faker.lorem.sentence()),
    UserPost(
        name: faker.person.name(),
        img: "assets/images/user_2.jpeg",
        postImg: "assets/images/feed_2.jpeg",
        text: faker.lorem.sentence()),
    UserPost(
        name: faker.person.name(),
        img: "assets/images/user_3.jpeg",
        postImg: "assets/images/feed_3.jpeg",
        text: faker.lorem.sentence()),
    UserPost(
        name: faker.person.name(),
        img: "assets/images/user_4.jpeg",
        postImg: "assets/images/feed_4.jpeg",
        text: faker.lorem.sentence()),
  ];
}
