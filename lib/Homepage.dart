import 'package:baitaptuan_10/login.dart';
import 'package:baitaptuan_10/profile.dart';

import 'package:baitaptuan_10/data.dart';
import 'package:baitaptuan_10/Sites/detail.dart';

import 'main.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int countter = 2;
  bool typing = false;
  String text = "";
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller = TextEditingController();
  }

  List<String> item=[
    "Vịnh Hạ Long.",
    "Vịnh Hạ Long.",
    
  ];

  @override
  Widget build(BuildContext context) {
    _counter++;
    var dvsize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(154, 175, 65, 1),
          title: (typing
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: _controller,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Tìm kiếm',
                        hintStyle: TextStyle(color: Colors.white)),
                    onChanged: (String value) {
                      setState(
                        () {},
                      );
                    },
                  ),
                )
              : const Text("Từ điển")),
          actions: [
            IconButton(
              icon: Icon(typing ? Icons.done : Icons.search),
              onPressed: () {
                setState(() {
                  _controller.clear();
                  typing = !typing;
                });
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 95,
                child: DrawerHeader(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(154, 175, 65, 1)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("images/2.jpg"),
                      ),
                      Text(
                        "   Trần Phước Khánh",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: const Text('Thông tin người dùng'),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return const Profile();
                      },
                      transitionsBuilder: (BuildContext context,
                          Animation<double> animation,
                          Animation<double> secondaryAnimation,
                          Widget child) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1.0, 0.0),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: const Text('Đăng xuất'),
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (BuildContext context, Animation animation,
                            Animation secondaryAnimation) {
                          return LoginPage();
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: const Offset(1.0, 0.0),
                              end: Offset.zero,
                            ).animate(animation),
                            child: child,
                          );
                        },
                      ),
                      (Route route) => false);
                },
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            
            Stack(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(items[0].image,), fit: BoxFit.cover),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6)
                      ]),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     // IconButton(
                //     //   onPressed: () => Navigator.pop(context),
                //     //   icon: Icon(Icons.arrow_back_ios_new),
                //     //   iconSize: 30,
                //     //   color: Colors.black,
                //     // ),
                //     IconButton(
                //       onPressed: () => Navigator.pop(context),
                //       icon: CircleAvatar(
                //         backgroundImage: AssetImage('images/$_counter.jpg'),
                //       ),
                //       iconSize: 50,
                //     ),
                //     Row(
                //       children: [
                //         Positioned(
                //             child: Container(
                //           decoration: BoxDecoration(
                //             color: Colors.white,
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           width: 313,
                //           height: 30,
                //           child: Padding(
                //             padding: const EdgeInsets.all(8.0),
                //             child: TextField(
                //               decoration: InputDecoration(hintText: "Tìm kiếm"),
                //             ),
                //           ),
                //         )),
                //       ],
                //     )
                //   ],
                // ),
                Positioned(
                    left: 20,
                    bottom: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[0].titel,
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
                                items[0].location,
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
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bike_scooter),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bike_scooter),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bike_scooter),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey),
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
            Container(
              height: 130,
              child: Expanded(
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (BuildContext contex, int index) {
                        _counter++;
                        return  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => DetailsPage(
                               item: items[0]
                            ),
                          ),
                        );
                      },
                      child: Padding(
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
                                                      BorderRadius.circular(
                                                          50)),
                                              height: 100,
                                              width: 100,
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Image(
                                                      image: AssetImage(
                                                          items[0].image,),
                                                      fit: BoxFit.cover))),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [Text(items[0].titel), Text(items[0].location)],
                                )
                              ],
                        )));
                      })),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext contex, int index) {
                      countter++;
                      return  GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => DetailsPage(
                              item: items[index]
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      height: 200,
                                      width: dvsize.width - 18,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image(
                                              image: AssetImage(items[index].image,),
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
                                    items[index].titel,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(items[index].location)
                              ],
                            )
                          ],
                        ),
                       ));
                    }))
          ],
        ));
  }
}
