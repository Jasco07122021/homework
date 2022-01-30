class Products{
  String img;
  bool isFavorite = false;

  Products({required this.img});
}

class ProductsList{
  List<Products> list = [
    Products(img: "assets/images/image_1.jpeg"),
    Products(img: "assets/images/image_2.jpg"),
    Products(img: "assets/images/image_3.png"),
  ];
}