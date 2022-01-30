class Cars {
  int? id;
  String name;
  String type;
  String cost;
  String image;
  String category;
  bool isLike = false;

  Cars({this.id,
    required this.name,
    required this.type,
    required this.cost,
    required this.image,
    required this.category,
    });

  @override
  String toString() {
    // TODO: implement toString
    return "{ $name $type $isLike }";
  }
}

class CarsList {
  final List<Cars> listCars = [
    Cars(
        id: 1,
        name: "Pdp car",
        type: "Electric",
        cost: "100 \$",
        image: "assets/images/im_car0.jpg",
        category: "Red",
    ),
    Cars(
        id: 2,
        name: "Pdp car",
        type: "Electric",
        cost: "100 \$",
        image: "assets/images/im_car1.jpg",
        category: "Blue",
    ),
    Cars(
        id: 3,
        name: "Pdp car",
        type: "Electric",
        cost: "100 \$",
        image: "assets/images/im_car2.jpg",
        category: "Green",
    ),
    Cars(
        id: 4,
        name: "Pdp car",
        type: "Electric",
        cost: "100 \$",
        image: "assets/images/im_car3.png",
        category: "White",
    ),
    Cars(
        id: 5,
        name: "Pdp car",
        type: "Electric",
        cost: "100 \$",
        image: "assets/images/im_car4.jpg",
        category: "Green",
    ),
  ];
}
