import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewCard extends ConsumerWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18,
            child: SvgPicture.asset("assets/icons/avatar.svg"),
          ),
          const SizedBox(
            width: 10,
          ),
          const Expanded(
              child: Text(
            'loreum ipsum loreum ipsum  loreum ipsum  loreum ipsum  loreum ipsum  loreum ipsum loreum ipsum',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ))
        ],
      ),
    );
  }
}
