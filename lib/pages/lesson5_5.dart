import 'package:flutter/material.dart';
import 'package:homework/models/model_les_5.dart';
import 'package:homework/pages/lesson5_5_listPage.dart';

class Lesson5_5 extends StatefulWidget {
  List<Cars>? listShoppingCart = [];

  Lesson5_5({this.listShoppingCart});

  @override
  _Lesson5_5State createState() => _Lesson5_5State();
}

class _Lesson5_5State extends State<Lesson5_5> {
  String text = "";

  final List<String> _listCategories = [
    "All",
    "Red",
    "Blue",
    "Green",
    "Black",
    "White",
  ];

  int _selectedColor = 0;
  final _listCars = CarsList();
  List<Cars> _listAddFavorite = [];

  _checkFavorite() {
    setState(
      () {
        _listAddFavorite.clear();
        _listAddFavorite = widget.listShoppingCart ?? [];
        for (var element in _listCars.listCars) {
          if (widget.listShoppingCart != null) {
            for (var element2 in widget.listShoppingCart!) {
              if (element.id == element2.id) {
                element.isLike = element2.isLike;
              }
            }
          }
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 80,
          flexibleSpace: Container(
              color: Colors.white,
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  ///car text
                  Text(
                    "Car",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(),

                  ///favorite button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShoppingCard(list: _listAddFavorite),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 60,
                      child: Stack(
                        children: [
                          Center(
                            child: Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius: 10,
                              child: FittedBox(
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: Text(
                                    _listAddFavorite.length.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  ///shopping cart button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 50,
                      width: 60,
                      child: Stack(
                        children: [
                          Center(
                            child: Image(
                              height: 25,
                              color: Colors.red,
                              image: AssetImage("assets/images/img_17.png"),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade200,
                              radius: 10,
                              child: FittedBox(
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  child: Text(
                                    // _listAddCars.length.toString(),
                                    "0",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //#categories
              _categories(),

              //#items
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: _listCars.listCars.map((e) => _cardCar(e)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardCar(Cars object) {
    if (_listCategories[_selectedColor] == object.category ||
        _listCategories[_selectedColor] == "All") {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(object.image),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    object.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10),
                  Text(
                    object.type,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                object.cost,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      object.isLike = !(object.isLike);
                      object.isLike == true
                          ? _listAddFavorite.add(object)
                          : _listAddFavorite.remove(object);
                    },
                  );
                },
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Stack(
                    children: [
                      Icon(
                        object.isLike ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Container _categories() {
    return Container(
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _listCategories.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = index;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _selectedColor == index ? Colors.red : Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              _listCategories[index],
              style: TextStyle(
                fontSize: 16,
                color: _selectedColor == index ? Colors.white : Colors.black,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 25),
          ),
        ),
      ),
    );
  }
}
