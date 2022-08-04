import 'package:flutter/material.dart';

class Total extends StatelessWidget {
 final String total;
 final String title;

  const Total({ required this.total, required this.title});

  @override
  Widget build(BuildContext context) {
  return Container(
  padding: EdgeInsets.all(20),
  margin: EdgeInsets.all(20),
  decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(20),
  color: Colors.deepOrange.withOpacity(0.9)),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  title,
  style: TextStyle(
  fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
  ),
  SizedBox(
  height: 20,
  ),
  Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
  Text(total,
  style: TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.white)),
  Icon(
  Icons.query_stats_outlined,
  size: 30,
  color: Colors.white,
  ),
  ],
  ),
  SizedBox(
  height: 20,
  ),
  ],
  ),
  );
  }
}
