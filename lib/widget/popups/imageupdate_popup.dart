import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petaraa_vender/api/shopapi.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/provider/imagepicker.dart';

class ImageUpdatPopup extends ConsumerStatefulWidget {
  final WidgetRef ref;
  final String image, imagetype;
  final int index;
  final void Function() fun;

  const ImageUpdatPopup(
      {super.key,
      required this.ref,
      required this.image,
      required this.imagetype,
      required this.fun,
      required this.index});

  @override
  ConsumerState<ImageUpdatPopup> createState() => _ImageUpdatPopupState();
}

class _ImageUpdatPopupState extends ConsumerState<ImageUpdatPopup> {
  void updatebtnfunction({
    required String imagepath,
  }) async {
    FormData requestBody = FormData.fromMap({
      "indexNo": widget.index,
      'imageType': widget.imagetype,
      'image': await MultipartFile.fromFile(
        imagepath,
      )
    });

    Shop()
        .updateshopimage(requestBody: requestBody, context: context, ref: ref)
        .whenComplete(() {
      widget.fun();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 200),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(widget.image, fit: BoxFit.cover),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffFF0000),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Delete',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      imagePicker(
                        source: ImageSource.gallery,
                      ).then((value) {
                        updatebtnfunction(
                          imagepath: value.toString(),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: primary2Color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    child: const Text(
                      'Update',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                          color: Colors.white),
                    ),
                  ),
                ],
              )
            ]));
  }
}
