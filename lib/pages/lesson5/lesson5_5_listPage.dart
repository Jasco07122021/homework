import 'package:flutter/material.dart';
import 'package:homework/models/model_les_5.dart';

import 'lesson5_5.dart';



class ShoppingCard extends StatefulWidget {
  static const id = "shopping_card";
  List<Cars>? list = [];
  ShoppingCard({Key? key, this.list}) : super(key: key);


  @override
  _ShoppingCardState createState() => _ShoppingCardState();
}

class _ShoppingCardState extends State<ShoppingCard> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ///back button
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Lesson5_5(listShoppingCart: widget.list,)));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200),
                      child: Icon(
                        Icons.arrow_back_ios_sharp,
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ),

                  ///Text middle
                  Text(
                    "Shopping Cart",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),

                ],
              ),
            ),
          ),
          body: widget.list!.isEmpty
          ? Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Choose your favorite car",
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        )): ListView(
    padding: EdgeInsets.symmetric(horizontal: 15),
    children: widget.list!.map((e) => _carsListTile(e)).toList(),
    )),
    );
  }

  Widget _carsListTile(Cars object) {
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 5),
      height: 100,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image(
              height: 80,
              image: AssetImage(object.image),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                object.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                object.cost,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    object.isLike = !object.isLike;
                    if(object.isLike == false){
                      widget.list!.remove(object);
                    }
                  });
                },
                child: Icon(
                  object.isLike ? Icons.favorite : Icons.favorite_border,
                  color: object.isLike ? Colors.red : Colors.black,
                ),
              ),
              SizedBox.shrink()
            ],
          ),
        ],
      ),
    );
  }
}
