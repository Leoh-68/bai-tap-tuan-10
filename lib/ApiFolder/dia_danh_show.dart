import 'package:baitaptuan_10/login.dart';
import 'package:baitaptuan_10/profile.dart';
import 'package:baitaptuan_10/Model/hinh_anh_dia_danh.dart';
import 'package:baitaptuan_10/Model/dia_danh.dart';
import 'package:baitaptuan_10/Api/api.dart';
import 'package:baitaptuan_10/main.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class Detail extends StatelessWidget {
  final String name;
  final String location;
  final String image;
  final String id;
  Detail(
      {Key? key,
      required this.name,
      required this.id,
      required this.location,
      required this.image})
      : super(key: key);
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    var dvsize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(154, 175, 65, 1),
          title: (typing
              ? Container(
                  alignment: Alignment.centerLeft,
                  child: Text(""),
                )
              : const Text("Travel App")),
          actions: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
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
        body: ListView(children: [
          Stack(
            children: [
              FutureBuilder<String>(
                  future: api_Image_DiaDanh(int.parse(id)),
                  builder: (context, snapshot2) {
                    return snapshot2.hasData
                        ? Container(
                            height: 300,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'images/' + snapshot2.data! + '.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26,
                                      offset: Offset(0, 2),
                                      blurRadius: 6)
                                ]),
                          )
                        : const CircularProgressIndicator();
                  }),
              Positioned(
                  left: 20,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
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
                              location,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  )),
            ],
          ),
        ]));
  }
}

