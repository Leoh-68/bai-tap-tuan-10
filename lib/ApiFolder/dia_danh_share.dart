import 'dart:html';

import 'package:baitaptuan_10/login.dart';
import 'package:baitaptuan_10/profile.dart';
import 'package:flutter/material.dart';
import 'package:baitaptuan_10/dia_danh_search.dart';
import 'package:baitaptuan_10/Model/dia_danh.dart';
import 'package:baitaptuan_10/Model/taikhoan.dart';
import 'package:image_picker/image_picker.dart';


class Share extends StatefulWidget {
  @override
  State<Share> createState() => _ShareState();
}

class _ShareState extends State<Share> {
  bool typing = false;
  String text = "";
  String location = "3";
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

  @override

  Widget build(BuildContext context) {
    var dvsize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(154, 175, 65, 1),
          title: Text("Share"),
          actions: [
            IconButton(
              icon: Icon(typing ? Icons.done : Icons.search),
              onPressed: () {
                setState(() {
                  if (typing == true) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Search(name: _controller.text)));
                  }
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
                  decoration: BoxDecoration(color: Color.fromRGBO(154, 175, 65, 1)),
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
                      pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                        return const Profile();
                      },
                      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
                        pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimation) {
                          return LoginPage();
                        },
                        transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
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
        body: ListView(
          children: [
            Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _controller,
                    maxLines: 8,
                    decoration: InputDecoration.collapsed(hintText: "Enter your text here"),
                  ),
                )),
          
          ],
        ));
  }
}
