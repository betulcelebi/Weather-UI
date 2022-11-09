import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

const List<String> list = ['Tanjungsiang, Subang', 'Selasa, Hujan petir'];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isVisible = false;
  TextEditingController controller = TextEditingController();
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20),
                  width: 193,
                  height: 24,
                  // color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/coolicon.png"),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: Image.asset("assets/caret_down.png"),
                        elevation: 16,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 14),
                        // underline:
                        //     Container(height: 1, color: Colors.deepPurpleAccent),
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    margin: EdgeInsets.only(top: 50, right: 25),
                    width: 120,
                    height: 24,
                    decoration: BoxDecoration(
                        color: isVisible == false
                            ? Colors.white
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isVisible
                            ? Container(
                                margin: EdgeInsets.only(right: 16),
                                width: 75,
                                height: 24,
                                child: TextField(
                                  controller: controller,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.transparent),
                                    ),
                                  ),
                                ))
                            : SizedBox(
                                width: 50,
                                height: 50,
                              ),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            child: Image.asset(
                              "assets/search.png",
                              width: 25,
                            ))
                      ],
                    )),
              ],
            ),
            Container(
              width: 350,
              height: 193,
              margin: EdgeInsets.only(top: 24, left: 20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xff4F7FFA), Color(0xff335FD1)]),
                  borderRadius: BorderRadius.circular(14)),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 24, left: 24),
                    width: 295,
                    height: 17,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Senin, 20 Desember 2021",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        Text("3.30 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400))
                      ],
                    ),
                  ),
                  Container(
                    width: 250,
                    height: 90,
                    margin: EdgeInsets.only(top: 24, right: 90),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(child: Image.asset("assets/1.png")),
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("18º C",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                              Container(
                                  margin: EdgeInsets.only(top: 8),
                                  child: Text("Hujan Berawan",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 155,
                    height: 17,
                    margin: EdgeInsets.only(left: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Terakhir update 3.00 PM",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w400)),
                        Image.asset("assets/refresh.png")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 20),
              child: Text(
                "Cuaca Per Jam",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              height: 115,
              margin: EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 24,
                itemBuilder: (context, index) {
                  return Container(
                    //color: Colors.red,
                    margin: EdgeInsets.only(top: 16, right: 10),
                    width: 78,
                    height: 115,
                    decoration: BoxDecoration(
                        color: Color(0xffFBFBFB),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 40,
                            height: 40,
                            margin: EdgeInsets.only(top: 8),

                            //color: Colors.red,
                            child:
                                Image.asset("assets/1.png", fit: BoxFit.cover)),
                        Container(
                            margin: EdgeInsets.only(top: 4),
                            child: Text(
                              "20º",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 8),
                            child: Text(
                              "4.00 PM",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ))
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20,top: 24),
              width: 60,
              height: 24,
              child: Text(
                "Harian",
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
