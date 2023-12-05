import 'package:flutter/material.dart';

class ParallelogramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = (3.0);

    var path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width * 0.8, 0)
      ..lineTo(size.width, size.height * 0.8)
      ..lineTo(size.width * 0.2, size.height * 0.8)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ParallelogramContainer extends StatelessWidget {
  final double width;
  final double height;

  ParallelogramContainer({this.width = 20, this.height = 20});

  @override
  Widget build(BuildContext context) {
    //final checkSize = width < 100 || height < 100;
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(20),
      width: width > 270
          ? 270 : width,
      height: height > 270
          ? 270 :  height,
      // decoration: BoxDecoration(
      //   color: Colors.white,
      //   borderRadius: BorderRadius.circular(0),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.grey.withOpacity(0.5),
      //       spreadRadius: 2,
      //       blurRadius: 2,
      //       offset: Offset(0, 3),
      //     ),
      //   ],
      // ),
      child: CustomPaint(
        painter: ParallelogramPainter(),
      ),
    );
  }
}
