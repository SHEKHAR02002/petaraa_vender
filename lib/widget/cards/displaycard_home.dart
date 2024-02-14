import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DisplayCard extends StatelessWidget {
  final String imagePath, name;
  final int count;
  const DisplayCard(
      {super.key,
      required this.count,
      required this.name,
      required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
            fit: BoxFit.fitWidth,
            width: 40,
            height: 40,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                count.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    // height: 22.5,
                    fontFamily: 'Autour'),
              ),
              Text(
                name,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w300,
                  // height: 12.66,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
