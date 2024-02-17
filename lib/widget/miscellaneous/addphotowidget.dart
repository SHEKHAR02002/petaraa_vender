import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

StateProvider<List> internalImageProvider = StateProvider((ref) => []);
StateProvider<List> externalImageProvider = StateProvider((ref) => []);
StateProvider<List> moreImageProvider = StateProvider((ref) => []);

Widget addPhotoWidget(
    {required WidgetRef ref,
    required void Function() fun,
    required String typeofimage}) {
  return SingleChildScrollView(
    padding: const EdgeInsets.only(top: 5, bottom: 30),
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 80,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: typeofimage == "internal"
                ? ref.watch(internalImageProvider).length
                : typeofimage == "external"
                    ? ref.watch(externalImageProvider).length
                    : ref.watch(moreImageProvider).length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: FileImage(
                            typeofimage == "internal"
                                ? File(ref.watch(internalImageProvider)[index])
                                : typeofimage == "external"
                                    ? File(
                                        ref.watch(externalImageProvider)[index])
                                    : File(ref.watch(moreImageProvider)[index]),
                          )),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: InkWell(
                        onTap: () {
                          typeofimage == "internal"
                              ? ref
                                  .watch(internalImageProvider.notifier)
                                  .state
                                  .removeAt(index)
                              : typeofimage == "external"
                                  ? ref
                                      .watch(externalImageProvider.notifier)
                                      .state
                                      .removeAt(index)
                                  : ref
                                      .watch(moreImageProvider.notifier)
                                      .state
                                      .removeAt(index);

                          fun();
                        },
                        child: const Icon(
                          CupertinoIcons.clear_circled_solid,
                          color: Colors.red,
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
        ref
                    .watch(typeofimage == 'internal'
                        ? internalImageProvider
                        : typeofimage == 'external'
                            ? externalImageProvider
                            : moreImageProvider)
                    .length >=
                3
            ? const SizedBox()
            : Container(
                height: 80,
                width: 80,
                color: Colors.grey.shade300,
                child: IconButton(
                  onPressed: () {
                    takeImages(
                            source: ImageSource.camera,
                            typeodfimage: typeofimage,
                            ref: ref)
                        .whenComplete(() => fun());
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
      ],
    ),
  );
}

Future takeImages(
    {required ImageSource source,
    required String typeodfimage,
    required WidgetRef ref}) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    if (typeodfimage == "internal") {
      ref.watch(internalImageProvider.notifier).state.add(pickedFile.path);
    }
    if (typeodfimage == "external") {
      ref.watch(externalImageProvider.notifier).state.add(pickedFile.path);
    }
    if (typeodfimage == "more") {
      ref.watch(moreImageProvider.notifier).state.add(pickedFile.path);
    }
  }
}
