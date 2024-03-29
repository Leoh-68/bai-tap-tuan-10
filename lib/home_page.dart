import 'package:baitaptuan_10/login.dart';
import 'package:baitaptuan_10/profile.dart';
import 'Model/dia_danh.dart';
import 'Api/api.dart';
import 'ApiFolder/post_share.dart';
import 'package:flutter/material.dart';
import 'package:baitaptuan_10/ApiFolder/dia_danh_show.dart';
import 'package:baitaptuan_10/dia_danh_search.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int countter = 2;
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
                    decoration: const InputDecoration(border: InputBorder.none, hintText: 'Tìm kiiếm', hintStyle: TextStyle(color: Colors.white)),
                    onChanged: (String value) {
                      setState(
                        () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(dd: snapshot2.data!)));
                        },
                      );
                    },
                  ),
                )
              : const Text("Bạn muốn đi đâu ?")),
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
            FutureBuilder<DiaDanh>(
                future: api_Hot_DiaDanh(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Stack(
                          children: [
                            Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('images/' + snapshot.data!.hinhAnh! + '.jpg'), fit: BoxFit.cover),
                                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
                                  boxShadow: const [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 6)]),
                            ),
                            Positioned(
                                left: 20,
                                bottom: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.tenDiaDanh.toString(),
                                      style: const TextStyle(letterSpacing: 1.5, color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_city,
                                          color: Colors.white,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            snapshot.data!.viTri.toString(),
                                            style: TextStyle(color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                          ],
                        )
                      : const CircularProgressIndicator();
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: ((dvsize.width - 18) / 100) * 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(191, 255, 252, 1)),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home),
                  ),
                ),
                Container(
                  height: 50,
                  width: ((dvsize.width - 18) / 100) * 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(191, 255, 252, 1)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bike_scooter),
                  ),
                ),
                Container(
                  height: 50,
                  width: ((dvsize.width - 18) / 100) * 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(191, 255, 252, 1)),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.bike_scooter),
                  ),
                ),
                Container(
                  height: 50,
                  width: ((dvsize.width - 18) / 100) * 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: Color.fromRGBO(191, 255, 252, 1)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Post()));
                    },
                    icon: Icon(Icons.content_paste_outlined),
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
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                                              height: 100,
                                              width: 100,
                                              child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(10),
                                                  child: Image(image: AssetImage('images/1.jpg'), fit: BoxFit.cover))),
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
            ),
            Expanded(
                child: FutureBuilder<List<DiaDanh>>(
                    future: api_GetAll_DiaDanh(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }
                      return snapshot.hasData
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: const ClampingScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (contex, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                TextButton(
                                                  child: Container(
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                                                      height: 200,
                                                      width: dvsize.width - 32,
                                                      child: ClipRRect(
                                                          borderRadius: BorderRadius.circular(10),
                                                          child: Image(
                                                              image: AssetImage('images/' + snapshot.data![index].hinhAnh! + '.jpg'),
                                                              fit: BoxFit.cover))),
                                                  onPressed: () {},
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    TextButton(
                                      child: Container(
                                        padding: EdgeInsets.only(bottom: 10, left: 10),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].tenDiaDanh!.toString(),
                                                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                                              ),
                                              Text(snapshot.data![index].viTri!,
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (contex) => Detail(
                                                    mota: snapshot.data![index].moTa.toString(),
                                                    id: snapshot.data![index].id.toString(),
                                                    name: snapshot.data![index].tenDiaDanh.toString(),
                                                    location: snapshot.data![index].viTri!,
                                                    image: location)));
                                      },
                                    )
                                  ],
                                );
                              })
                          : const Center(child: Padding(padding: EdgeInsets.only(top: 250), child: CircularProgressIndicator()));
                    })),
          ],
        ));
  }
}
