import 'package:flutter/material.dart';

class TimeWidget extends StatelessWidget {
  final data;
  final active;
  const TimeWidget({super.key, this.data, this.active});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          data['time'].toString(),
          style: TextStyle(
              fontSize: 20,
              color: active ? Color(0xff763bd7) : Colors.grey,
              fontWeight: active ? FontWeight.bold : FontWeight.normal),
        ),
        Row(
          children: [
            Image.asset(
              'assets/images/rainy.png',
              width: 25,
              color: active ? Color(0xff763bd7) : Colors.grey,
            ),
            SizedBox(width: 10),
            Text(
              data['temp'].toString(),
              style: TextStyle(
                  fontSize: 20,
                  color: active ? Color(0xff763bd7) : Colors.grey,
                  fontWeight: active ? FontWeight.bold : FontWeight.normal),
            ),
          ],
        )
      ],
    );
  }
}
