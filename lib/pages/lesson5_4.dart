import 'package:flutter/material.dart';
import 'package:homework/servises/string_utils.dart';

class Lesson5_4 extends StatefulWidget {
  const Lesson5_4({Key? key}) : super(key: key);

  @override
  _Lesson5_4State createState() => _Lesson5_4State();
}

class _Lesson5_4State extends State<Lesson5_4> {
  var indexPage = 0;
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (value) {
              setState(() {
                indexPage = value;
              });
            },
            children: [
              _buildCenter(
                  img: "assets/images/img_11.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
              _buildCenter(
                  img: "assets/images/img_15.png",
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoTitle),
              _buildCenter(
                  img: "assets/images/img_16.png",
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent),
            ],
          ),

          ///Bottom indicator
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _bottomIndicator(0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: _bottomIndicator(1),
                ),
                _bottomIndicator(2),
              ],
            ),
          ),

          ///Skip text
          indexPage == 2
              ? Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Skip",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Column _buildCenter({img, title, content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: Text(
            content,
            style: TextStyle(color: Colors.grey, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Image(height: 250, image: AssetImage(img)),
      ],
    );
  }

  Widget _bottomIndicator(index) => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 8,
        width: (index == indexPage) ? 25 : 7,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(3),
        ),
      );
}
