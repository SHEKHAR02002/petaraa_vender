import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';

Widget timeCard(
        {required BuildContext context,
        required Time openTime,
        required Time closeTime,
        required double width,
        required Function setOpenTiming,
        required Function setCloseTiming,
        required bool setDay,
        required Widget toggle,
        required Color color,
        required String nameofDay,
        required Map time}) =>
    Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              setDay ? color : Colors.grey.shade700,
              const Color.fromRGBO(255, 255, 255, 1),
            ],
          ),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.4, color: Colors.grey)),
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            nameofDay,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                ElevatedButton(
                    onPressed: (() => Navigator.of(context).push(
                          showPicker(
                            context: context,
                            value: openTime,
                            onChange: (Time newTime) {
                              setOpenTiming(time: newTime);
                            },
                            minuteInterval: TimePickerInterval.FIFTEEN,
                          ),
                        )),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 60),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(width: 0.6))),
                    child: Text(
                      "Open:\n${time["open"].hour}:${time["open"].minute}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "To",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                ElevatedButton(
                    onPressed: (() => Navigator.of(context).push(
                          showPicker(
                            context: context,
                            value: closeTime,
                            onChange: (Time newTime) {
                              setCloseTiming(time: newTime);
                            },
                            minuteInterval: TimePickerInterval.FIFTEEN,
                          ),
                        )),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 60),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: const BorderSide(width: 0.6))),
                    child: Text(
                      "Close:\n${time["close"].hour}:${time["close"].minute}",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    )),
                const Spacer(),
                toggle,
              ],
            ),
          )
        ],
      ),
    );
