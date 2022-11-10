import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
   return Stack(
children: [
Container(
//color: Colors.red,
padding: EdgeInsets.only(left: 20),
height: 150,
child: Row(
children: [
Container(
// color: Colors.amber,
width: 80,
height: 80,
child: Stack(
children: [
Center(
child: Text(
"12",
style:
TextStyle(color: Colors.green, fontSize: 24),
)),
Center(
child: Container(
//color: Colors.yellow,
height: 90,
width: 120,
child: CircularProgressIndicator(
backgroundColor: Colors.grey.withOpacity(.5),
color: Colors.green[600],
value: 0.12,
strokeWidth: 7,
),
),
),
],
),
),
],
),
),
Positioned(
top: 40,
left: 120,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: const [
Padding(
padding: EdgeInsets.only(bottom: 8),
child: Text(
'AQI - Sangat Baik',
style: TextStyle(
fontSize: 14, fontWeight: FontWeight.w600),
),
),
Text(
'Kualitas udara di daerahmu untuk saat ini\nsangat baik. Tidak ada pencemaran udara\nyang menyebabkan berbagai penyakit.',
style: TextStyle(
fontSize: 13, fontWeight: FontWeight.w400),
),
],
),
)
],
);
  }
}