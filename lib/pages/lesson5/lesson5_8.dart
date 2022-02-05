import 'package:flutter/material.dart';

class Lesson5_8 extends StatefulWidget {
  const Lesson5_8({Key? key}) : super(key: key);

  @override
  _Lesson5_8State createState() => _Lesson5_8State();
}

class _Lesson5_8State extends State<Lesson5_8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF018197),
        elevation: 0,
        title: Image.asset(
          "assets/images/amazon_logo.png",
          fit: BoxFit.cover,
          height: 85,
        ),
        actions: const [
          Icon(Icons.mic),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 15,
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFF018197),
                  ),
                  suffixIcon: Icon(
                    Icons.camera_alt,
                    color: Color(0xFF018197),
                  ),
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
        ),
      ),
      drawer: Drawer(),
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            color: Colors.blueGrey,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: const [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Deliver to Korea, Republic of",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),

          ///text + image
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60)),
                  child: Image.asset(
                    "assets/images/image_amazon_1.jpeg",
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Text(
                        "We ship 45million\nproducts",
                        style: TextStyle(fontSize: 16),
                      )))
            ],
          ),

          _divider(),

          ///Sign in
          _padding(
            children: [
              Text(
                "Sign in for the best experience",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 15),
              MaterialButton(
                padding: EdgeInsets.all(15),
                onPressed: () {},
                child: Text(
                  "Sign in",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                color: Colors.orangeAccent.shade200,
                minWidth: double.infinity,
              ),
              SizedBox(height: 15),
              Text(
                "Create an account",
                style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),

          _divider(),

          ///Deal of the Day
          _padding(
            children: [
              _nameCategory(text: "Deal of the Day"),
              SizedBox(height: 15),
              Image.asset(
                "assets/images/item_7.jpeg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                "Up to 31% off APC UPS Battery Back\n\$10.99 - \$79.9",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          _divider(),

          _padding(
            children: [
              _nameCategory(text: "Best sellers in Electronics"),
              SizedBox(height: 15),
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Image.asset(
                  "assets/images/item_${7 - index}.jpeg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0),
                itemCount: 4,
              ),
              SizedBox(height: 10),
            ],
          ),
          _divider(),
          _padding(
            children: [
              _nameCategory(text: "Top products in Camera"),
              SizedBox(height: 15),
              Image.asset(
                "assets/images/item_7.jpeg",
                height: 200,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(child: Image.asset("assets/images/item_3.jpeg")),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(child: Image.asset("assets/images/item_2.jpeg"))
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Text _nameCategory({text}) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, color: Colors.black),
    );
  }

  Divider _divider() {
    return Divider(
      thickness: 7,
      height: 7,
    );
  }

  Widget _padding({children}) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
