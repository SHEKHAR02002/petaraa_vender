import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/widget/miscellaneous/decoration.dart';

class CouponCard extends StatelessWidget {
  const CouponCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => CouponDetails(
        //               coupondetail: widget.coupondetail,
        //             )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        child: Container(
          width: width,
          decoration: shadowdecoration,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "On 100 coins 2 product free",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Text(
                      "100",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(width: 3),
                    SvgPicture.asset(
                      "assets/icons/coin_g.svg",
                      height: 22,
                      width: 22,
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 12),
                  child: Text(
                    "You Have 100 Petaraa Coins Than you get 2 product free",
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black54),
                  ),
                ),
                const Text("* T&C",
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
