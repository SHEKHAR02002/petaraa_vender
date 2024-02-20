import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/constant/variableconstat.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/addshopdetails.dart';
import 'package:petaraa_vender/screen/manegement_sub_screens/updateshopdetail.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double width = MediaQuery.of(context).size.width;
    final userdata = ref.watch(userdetailsProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            'Profile',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: primary4Color,
                fontFamily: 'Autour'),
          ),
          actions: [
            PopupMenuButton<int>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              position: PopupMenuPosition.under,
              icon: Icon(
                color: primary4Color,
                CupertinoIcons.ellipsis_vertical,
              ),
              splashRadius: 20,
              color: const Color.fromARGB(255, 209, 189, 244),
              itemBuilder: (context) => [
                PopupMenuItem<int>(
                  value: 0,
                  child: InkWell(
                    // onTap: (() {
                    //   PersistentNavBarNavigator.pushNewScreen(context,
                    //       screen: EditProfile(
                    //         updateState: () => setState(() {}),
                    //       ),
                    //       withNavBar: false);
                    // }),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 30,
                          color: white,
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "edit profile",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 1,
                  child: InkWell(
                    // onTap: () {
                    //   PersistentNavBarNavigator.pushNewScreen(context,
                    //       screen: const Setting(), withNavBar: false);
                    // },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 30,
                          color: white,
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Setting",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                const PopupMenuDivider(),
                PopupMenuItem<int>(
                  value: 0,
                  child: InkWell(
                    // onTap: (() async =>
                    //     await PhoneAuth().logOut(context: context)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 30,
                          color: white,
                        ),
                        const SizedBox(width: 20),
                        const Text(
                          "Logout",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  foregroundImage:
                      NetworkImage('$photobaseurl/${userdata.profileImage}'),
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary2Color,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minimumSize: Size(width, 50)),
                    onPressed: () => Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 500),
                            type: PageTransitionType.rightToLeft,
                            child: userdata.showShopDetails!
                                ? const UpdateShopDetail()
                                : const EditShopDetails())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          userdata.showShopDetails.toString() == 'true'
                              ? 'Edit shop Details'
                              : 'Add shop Details',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    )),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.person_3_sharp,
                        color: primary4Color,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        userdata.venderName.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: grey,
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: primary4Color,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        userdata.phoneNo.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: grey,
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: primary4Color,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        userdata.emailId.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      )
                    ],
                  ),
                ),
                Divider(
                  color: grey,
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: primary4Color,
                        size: 24,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        userdata.dob.toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: grey),
                      )
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        ));
  }
}
