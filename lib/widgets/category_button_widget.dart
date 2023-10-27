import 'package:flutter/material.dart';

class CategoryButtonWidget extends StatelessWidget {
   CategoryButtonWidget({
    required this.width, required this.category,
  });

  final double width;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: width,
      decoration: BoxDecoration(
          color: Color(0xFF8775fc),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '100 article about this',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
