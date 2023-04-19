import 'package:flutter/material.dart';
import 'package:flutter_weather/widgets/rain.dart';
import 'dart:math' as math;

import 'package:flutter_weather/widgets/time.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Key parallaxOne = GlobalKey();

  bool showdate = true;

  @override
  Widget build(BuildContext context) {
    double res_width = MediaQuery.of(context).size.width;
    double res_height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: GestureDetector(
        onTap: () {
          setState(() {
            showdate = false;
          });
          showModalBottomSheet(
              context: context,
              elevation: 0,
              barrierColor: Colors.black.withAlpha(1),
              backgroundColor: Colors.transparent,
              builder: (builder) {
                return Container(
                  height: 600.0,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0))),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: res_height * 0.04,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/clock.png',
                                  width: 25,
                                ),
                                SizedBox(
                                  width: res_width * 0.04,
                                ),
                                Text(
                                  "Today's changes",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: res_height * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color(0xff763bd7).withOpacity(0.1),
                                      radius: 25,
                                      child: Image.asset(
                                        'assets/images/rainy.png',
                                        width: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Rainy with\nshort storms",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color(0xffff5580).withOpacity(0.1),
                                      radius: 25,
                                      child: Image.asset(
                                        'assets/images/wind.png',
                                        width: 25,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Wind EN\n8 km/h",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: res_height * 0.04,
                            ),
                            Expanded(
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        TimeWidget(
                                          data: data[index],
                                          active: index == 1,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Divider(color: Colors.grey)
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ),
                      )),
                );
              }).whenComplete(() {
            setState(() {
              showdate = true;
            });
          });
        },
        child: Container(
          //add ClipRRect widget for Round Corner
          color: Color(0xff763bd7),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 13, right: 13, top: 13, bottom: 26),
                child: ListTile(
                  leading: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset('assets/images/clock.png')),
                  title: Text(
                    "Today's Changes",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  trailing: SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: Image.asset('assets/images/calendar.png')),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: res_height * 1,
        color: Color(0xff763bd7),
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 600),
              height: showdate ? res_height * 0.185 : res_height * 0.125,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(50))),
              child: Padding(
                padding: EdgeInsets.only(top: res_height * 0.06, left: 20),
                child: Row(
                  children: [
                    SizedBox(
                        height: 35.0,
                        width: 33.0,
                        child: Image.asset('assets/images/sun.png')),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'What to wear',
                      style: TextStyle(fontSize: 24),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(50)),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 140,
                      color: Color(0xffff5580),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    AnimatedContainer(
                      width: 70,
                      height: showdate ? 120 : 0,
                      color: Color(0xfff7446f),
                      duration: Duration(milliseconds: 400),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Sat',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text('03',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: res_height * 1,
                child: ParallaxRain(
                  key: parallaxOne,
                  dropColors: [
                    Colors.white,
                  ],
                  trail: true,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: res_height * 0.225,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    '19°',
                    style: TextStyle(fontSize: 60, color: Colors.white),
                  ),
                  Text(
                    'Feels like 17°',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Icon(
                    Icons.cloudy_snowing,
                    color: Colors.white,
                    size: 50,
                  )
                ],
              ),
            ),
            Positioned(
              bottom: res_height * 0.05,
              left: 20,
              child: Text(
                'Palestine',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

var data = [
  {'time': '09:00 AM', 'temp': '19°'},
  {'time': '10:00 AM', 'temp': '20°'},
  {'time': '11:00 AM', 'temp': '21°'},
  {'time': '12:00 AM', 'temp': '18°'},
  {'time': '13:00 AM', 'temp': '17°'},
  {'time': '14:00 AM', 'temp': '16°'},
  {'time': '15:00 AM', 'temp': '15°'},
  {'time': '16:00 AM', 'temp': '11°'},
  {'time': '17:00 AM', 'temp': '20°'},
  {'time': '18:00 AM', 'temp': '19°'},
];
