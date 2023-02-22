import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var taskCategory = ["Today", "Tommorow", "Upcoming", "Someday"];
    return Center(
      child: Column(
        children: [
          for (var i in taskCategory)
            Text(
              i.toString(),
              style: const TextStyle(fontSize: 24),
            ),
        ],
      ),
    );
  }
}
