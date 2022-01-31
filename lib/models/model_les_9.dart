import 'package:faker/faker.dart';
var faker =  Faker();
class User{
  String? img;
  String name;
  String? postImg;
  String? time;
  String? textPost;

  User({this.img,required this.name, this.postImg, this.time, this.textPost});




}

class UserList{
  List<User> listStory = [
    User(name: faker.person.name(),img: "assets/images/user_1.jpeg"),
    User(name: faker.person.name(),img: "assets/images/user_2.jpeg"),
    User(name: faker.person.name(),img: "assets/images/user_3.jpeg"),
    User(name: faker.person.name(),img: "assets/images/user_4.jpeg"),
    User(name: faker.person.name(),img: "assets/images/user_5.jpeg"),
  ];

  List<User> listPost = [
    User(name: faker.person.name(),postImg: "assets/images/user_5.jpeg",time: "1 hr ago",textPost: faker.lorem.sentence()),
  ];
}