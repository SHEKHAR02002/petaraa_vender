import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/adsscreen.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/bulkeditscreen.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/coupon.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/paymentgatewayscreen.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/storetimingscreen.dart';
import 'package:petaraa_vender/widget/cards/actioncard_manegement.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/editshopdetails.dart';

class ManegmentScreen extends ConsumerStatefulWidget {
  const ManegmentScreen({super.key});

  @override
  ConsumerState<ManegmentScreen> createState() => _ManegmentScreenState();
}

class _ManegmentScreenState extends ConsumerState<ManegmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Management",
          style: TextStyle(
              fontFamily: 'Autour',
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: primaryColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1),
          children: [
            ActionCardManegement(
              // context: context,
              name: "Store Timing",
              imagePath: "assets/gif/timing.json",
              navigate: (context) => const StoreTimingScreen(),
            ),
            ActionCardManegement(
              // context: context,
              name: "Offers & Coupons",
              imagePath: "assets/gif/coupons.json",
              navigate: (context) => const CouponInfo(),
            ),
            ActionCardManegement(
              // context: context,
              name: "Ads with Pertaraa",
              imagePath: "assets/gif/ads.json",
              navigate: (context) => const AdsScreen(),
            ),
            ActionCardManegement(
              // context: context,
              name: "Shop Details",
              imagePath: "assets/gif/shopdetails.json",
              navigate: (context) => const EditShopDetails(),
            ),
            ActionCardManegement(
              // context: context,
              name: "Payment Gateway",
              imagePath: "assets/gif/payment.json",
              navigate: (context) => const PaymentGatewayScreen(),
            ),
            ActionCardManegement(
              // context: context,
              name: "Bulk upload & Edit",
              imagePath: "assets/gif/upload.json",
              navigate: (context) => const BulkEditScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
