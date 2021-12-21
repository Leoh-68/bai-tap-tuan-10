import 'dart:html';
import 'main.dart';
import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int countter = 2;

  @override
  Widget build(BuildContext context) {
    _counter++;
    var dvsize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 6)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('images/1.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // IconButton(
                //   onPressed: () => Navigator.pop(context),
                //   icon: Icon(Icons.arrow_back_ios_new),
                //   iconSize: 30,
                //   color: Colors.black,
                // ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: CircleAvatar(
                    backgroundImage: AssetImage('images/$_counter.jpg'),
                  ),
                  iconSize: 50,
                ),
                Row(
                  children: [
                    Positioned(
                        child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 313,
                      height: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(hintText: "Tìm kiếm"),
                        ),
                      ),
                    )),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.search),
                      iconSize: 30,
                      color: Colors.black,
                    )
                  ],
                )
              ],
            ),
            Positioned(
                left: 20,
                bottom: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Núi fuji",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city,
                          color: Colors.white,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Nhật bản",
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
                  ],
                )),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.bike_scooter),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.bike_scooter),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.bike_scooter),
              ),
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50), color: Colors.grey),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.bike_scooter),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Top thịnh hành",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              )),
        ),
        Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext contex, int index) {
                  _counter++;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 80,
                                child: Row(
                                  children: [
                                    Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        height: 100,
                                        width: 100,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image(
                                                image: AssetImage(
                                                    'images/$_counter.jpg'),
                                                fit: BoxFit.cover))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [Text("Đà nẵng"), Text("Việt Nam")],
                          )
                        ],
                      ));
                })),
        Expanded(
            child: ListView.builder(
                itemCount: 5,
                itemBuilder: (BuildContext contex, int index) {
                  countter++;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50)),
                                  height: 200,
                                  width: dvsize.width - 18,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image(
                                          image: AssetImage(
                                              'images/$countter.jpg'),
                                          fit: BoxFit.cover))),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Positioned(
                              left: 20,
                              bottom: 20,
                              child: Text(
                                "Đà Lạt",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text("Việt Nam")
                          ],
                        )
                      ],
                    ),
                  );
                }))
      ],
    ));
  }
}
