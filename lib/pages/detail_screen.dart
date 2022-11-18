import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:weather_ui/providers/weather_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 
  final GlobalKey _third = GlobalKey();


   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => ShowCaseWidget.of(context)
          .startShowCase([ _third, ]),  
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 370,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color(0xff4F80FA),
                    Color(0xff3764D7),
                    Color(0xff335FD1)
                  ])),
              child: Column(
                children: [
                  Container(
                    width: 343,
                    height: 24,
                    margin: EdgeInsets.only(top: 68),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context, true);
                            },
                            child: Image.asset("assets/chevron_left.png")),
                        Text(
                          "Tanjungsiang, Subang",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14),
                        ),
                        Image.asset("assets/more_horizontal.png")
                      ],
                    ),
                  ),
                  Container(
                    width: 240,
                    height: 230,
                    margin: EdgeInsets.only(top: 24),
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Senin, 20 Desember 2021 - 3.30 PM",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w400),
                        ),
                        Stack(
                          children: [
                            Image.asset(
                              "assets/1.png",
                              fit: BoxFit.cover,
                              scale: 0.8,
                            ),
                            Positioned(
                              bottom: 0,
                              left: 48,
                              child: Consumer(
                                builder: (context, WeatherProvider dhour, child) {
                                   return Text(
                                  dhour.response!.main!.temp.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400),
                                );
                                },
                               
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 4),
                          child: Text(
                            "Hujan Berawan",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: 172,
                          height: 17,
                          margin: EdgeInsets.only(top: 32),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Terakhir update 3.00 PM",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              Showcase(
                                key: _third,
                                description: "Refresh page",
                                child: Image.asset("assets/refresh.png"))
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 24, left: 20),
              child: Text(
                "Cuaca Per Jam",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
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
              margin: EdgeInsets.only(top: 24, left: 20),
              child: Text(
                "Detail Informasi",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 350,
              height: 109,
              margin: EdgeInsets.only(left: 20, top: 16),
              decoration: BoxDecoration(
                  color: Color(0xffFAFAFA),
                  borderRadius: BorderRadius.circular(12)),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            "12",
                            style: TextStyle(color: Colors.green, fontSize: 18),
                          ),
                        ),
                        Center(
                          child: Container(
                           // color: Colors.yellow,
                            height: 67,
                            width: 67,
                            margin: EdgeInsets.only(left: 5),
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.grey.withOpacity(0.4),
                              color: Colors.green[600],
                              value: 0.12,
                              strokeWidth: 6,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 85,
                    margin: EdgeInsets.only(left: 15,top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 17,
                          child: Text(
                            "AQI - Sangat Baik",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          width: 245,
                          height: 60,
                          child: Text(
                            "Kualitas udara di daerahmu untuk saat ini sangat baik. Tidak ada pencemaran udara yang menyebabkan berbagai penyakit.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(fontSize: 13),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.only(top: 15, left: 16, right: 16),
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                    childAspectRatio: 1.4),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                      width: 164,
                      decoration: BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 16),
                              child: Image.asset("assets/blaze-line.png")),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 30,
                                height: 17,
                                margin: EdgeInsets.only(top: 16, left: 12),
                                child: Text(
                                  "86%",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Container(
                                  width: 75,
                                  height: 16,
                                  margin: EdgeInsets.only(top: 4, left: 12),
                                  child: Text(
                                    "Kelembaban",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ))
                            ],
                          )
                        ],
                      ));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
