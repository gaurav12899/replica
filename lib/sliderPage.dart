import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:replica/background.dart';

List moduleNumList = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
List subscript = [
  "ST",
  "ND",
  'RD',
  'TH',
  'TH',
  'TH',
  'TH',
  'TH',
  'TH',
  'TH',
];

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final CarouselController _controller = CarouselController();

  final List<Widget> imageSliders = moduleNumList
      .map((item) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.toString(),
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 150),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          subscript[moduleNumList.indexOf(item)],
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                "MODULE",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              Container(
                // height: 100,
                padding: EdgeInsets.symmetric(vertical: 5),
                width: 200,
                color: Colors.grey.shade200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CBSE std,VIII",
                      style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                    Chip(
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      label: Text(
                        "EDIT",
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    )
                  ],
                ),
              ),
              Chip(
                backgroundColor: Colors.blueAccent,
                label: Text(
                  "Take Test",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: Background(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "MY TESTS",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w900,
                  fontSize: 40),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Aailable Tests",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                    onPressed: () {
                      _controller.previousPage();
                    },
                  ),
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width * .6,
                      child: CarouselSlider(
                        options: CarouselOptions(
                            enlargeCenterPage: false,
                            viewportFraction: 1,
                            aspectRatio: 1,
                            disableCenter: false),
                        carouselController: _controller,
                        items: imageSliders,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blueAccent,
                      size: 30,
                    ),
                    onPressed: () {
                      _controller.nextPage();
                    },
                  ),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * .6,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Test Results",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                    Chip(
                        backgroundColor: Colors.blueAccent,
                        label: Text(
                          "View",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
