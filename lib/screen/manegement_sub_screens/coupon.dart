import 'package:flutter/material.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/widget/cards/couponcard_manegment.dart';
import 'package:petaraa_vender/widget/miscellaneous/addcoupon.dart';

class CouponInfo extends StatefulWidget {
  const CouponInfo({super.key});

  @override
  State<CouponInfo> createState() => _CouponInfoState();
}

class _CouponInfoState extends State<CouponInfo> {
  bool loader = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Coupons",
              style: TextStyle(
                  fontFamily: 'Autour',
                  fontSize: 20,
                  color: primaryColor,
                  fontWeight: FontWeight.w400)),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: primary2Color,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddCoupons()));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add a new Coupon',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                          Icon(Icons.add_circle_outline_sharp)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 10),
                  child: Text(
                    'Existing Coupons',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: primaryColor),
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return const CouponCard();
                    })
              ],
            ),
          ),
        ));
  }
}
