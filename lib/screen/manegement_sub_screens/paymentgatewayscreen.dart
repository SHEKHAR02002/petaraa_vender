import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:petaraa_vender/constant/color.dart';

class PaymentGatewayScreen extends StatelessWidget {
  const PaymentGatewayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Gateway",
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
            children: [
              Stack(
                alignment: Alignment.topLeft,
                children: [
                  SvgPicture.asset("assets/images/paymentgatewaybg.svg"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "CashFree Payments",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                            "supports UPI , Paytm Wallet Google Pay, Debit Cards ,Credit Cards & More. ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                              onPressed: () {},
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Apply now",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_right_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
