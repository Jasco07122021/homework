class Hotels {
  String img;
  String text;
  bool isFavorite = false;
  Hotels({required this.img, required this.text});
}

class HotelsList {
  List<Hotels> list = [
    Hotels(img: "assets/images/ic_hotel0.jpg", text: "Hotel 1"),
    Hotels(img: "assets/images/ic_hotel2.jpg", text: "Hotel 2"),
    Hotels(img: "assets/images/ic_hotel3.jpg", text: "Hotel 3"),
    Hotels(img: "assets/images/ic_hotel4.jpg", text: "Hotel 4"),
  ];

  List<String> listImg = [
    "assets/images/ic_hotel0.jpg",
    "assets/images/ic_hotel2.jpg",
    "assets/images/ic_hotel3.jpg",
    "assets/images/ic_hotel4.jpg"
  ];
}
