import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homework/models/model_les6.dart';

class Lesson5_6 extends StatefulWidget {
  const Lesson5_6({Key? key}) : super(key: key);

  @override
  _Lesson5_6State createState() => _Lesson5_6State();
}

class _Lesson5_6State extends State<Lesson5_6> {
  final _hotelsList = HotelsList();

  int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _currentPage < 2 ? _currentPage++ : _currentPage = 0;

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 1000),
        curve: Curves.slowMiddle,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///header
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/ic_header.jpg"),
                  ),
                ),
                child: _headerAbove(),
              ),
              SizedBox(
                height: 20,
              ),

              ///body
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ///Business Hotels
                    Text(
                      "Business Hotels",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 10),
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: _hotelsList.list
                            .map((e) => _cardHotels(e))
                            .toList(),
                      ),
                    ),

                    ///Airport Hotels
                    Text(
                      "Airport Hotels",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: _hotelsList.list.reversed
                            .map((e) => _cardHotels(e))
                            .toList(),
                      ),
                    ),

                    ///Resort Hotels
                    Text(
                      "Resort Hotels",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: _hotelsList.list
                            .map((e) => _cardHotels(e))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container _headerAbove() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.3),
            ]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Best Hotels Ever",
            style: TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30),
          TextField(
            decoration: InputDecoration(
              hintText: "Search for hotels...",
              hintStyle: TextStyle(fontSize: 18),
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search),
              isCollapsed: false,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Card _cardHotels(Hotels object) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(right: 15),
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              object.img,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.2),
                ]),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  object.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      object.isFavorite = !object.isFavorite;
                    });
                  },
                  child: Icon(
                    Icons.favorite,
                    color: object.isFavorite ? Colors.red : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
