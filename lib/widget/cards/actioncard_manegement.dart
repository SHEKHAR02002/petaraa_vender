import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ActionCardManegement extends StatelessWidget {
  final String name, imagePath;
  final Widget Function(BuildContext) navigate;
  const ActionCardManegement(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.navigate});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: navigate)),
      // onTap: () =>
      //
      //
      // PersistentNavBarNavigator.pushNewScreen(context,
      //     screen: navigate(), withNavBar: false),
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(233, 216, 255, 1),
              Color.fromRGBO(253, 253, 253, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.644),
              offset: Offset(0, 0),
            )
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(imagePath, width: 100, height: 100),
              ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    overflow: TextOverflow.fade,
                    fontFamily: 'Autour',
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
