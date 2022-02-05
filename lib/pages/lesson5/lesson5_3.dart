import 'package:flutter/material.dart';
import 'package:homework/models/model_les_3.dart';

class Lesson5_3 extends StatefulWidget {
  const Lesson5_3({Key? key}) : super(key: key);

  @override
  _Lesson5_3State createState() => _Lesson5_3State();
}

class _Lesson5_3State extends State<Lesson5_3> {
  final ProductsList _listObject = ProductsList();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange,
        title: Text("Apple Products"),
        centerTitle: true,
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(10),
            ),
            width: 35,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.center,
            child: Text("7"),
          ),
        ],
      ),
      drawer: Drawer(),
      body: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          ///Header
          Container(
            height: size.height * 0.27,
            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/image_4.jpg"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Text(
                  "Lifestyle sale",
                  style: TextStyle(fontSize: 35, color: Colors.white),
                ),
                SizedBox(height: 30),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  child: Text("Shop Now"),
                  color: Colors.white,
                  minWidth: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 18),
                )
              ],
            ),
          ),
          SizedBox(height: 25),

          ///body
          Column(
            children: _listObject.list.map((e) => _body(e)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _body(Products object) {
    return Container(
      alignment: Alignment.topRight,
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.42,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(object.img),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            object.isFavorite = !object.isFavorite;
          });
        },
        child: Icon(
          object.isFavorite ? Icons.favorite : Icons.favorite_border,
          size: 40,
          color: object.isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
