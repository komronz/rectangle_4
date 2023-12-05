import 'package:burchak_4/widgets/parallelogram_painter.dart';
import 'package:burchak_4/widgets/romb_draw.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class ShowRecs extends StatelessWidget {
  final double width;
  final double height;
  final String form;
  final int selectedCaty;
  ShowRecs(
      {required this.width, required this.form,  required this.height, required this.selectedCaty});

  @override
  Widget build(BuildContext context) {
    print(selectedCaty);

    final checkSize10_100 =
        (width > 10 && width <= 100) || (height > 10 && height <= 100);
    final checkSize1_10 =
        (width >= 1 && width <= 10) || (height >= 1 && height <= 10);

    return selectedCaty == 0 || selectedCaty == 1
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          selectedCaty == 1 ? 'b = ${height.toString()} $form' : '',
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500),
          ),
          Column(
            children: [
              Text(
                'a = ${width.toString()} $form',
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Center(
                child: Container(
                  width: width,
                  height: selectedCaty == 0 ? width > 270 ? 270 : width : height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                  ),
                ),
              ),
            ],
          )
        ],
      )
    : selectedCaty == 2
        ? Column(
            children: [
              Text(
                'a = ${width.toString()} $form',
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                'b = ${height.toString()} $form',
                style: const TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Center(
                child: ParallelogramContainer(
                  width: width,
                  height: height,
                ),
              )
            ],
          )
        : selectedCaty == 3
            ? Column(
                children: [
                  Text(
                    'a = ${width.toString()} $form',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'b = ${height.toString()} $form',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  RhombusContainer(
                    width: width,
                    height: height,
                  )
                ],
              )
            : Container();
  }
}
