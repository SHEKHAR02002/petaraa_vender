import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:petaraa_vender/constant/color.dart';
import 'package:petaraa_vender/data/storetimedata.dart';
import 'package:petaraa_vender/widget/cards/timecard_manegement.dart';

class StoreTimingScreen extends StatefulWidget {
  const StoreTimingScreen({super.key});

  @override
  State<StoreTimingScreen> createState() => _StoreTimingScreenState();
}

class _StoreTimingScreenState extends State<StoreTimingScreen> {
  DateTime convertTimeOfDayToDateTime(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    return DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
  }

  bool setsunday = false,
      setmonday = false,
      settuesday = false,
      setwednesday = false,
      setthursday = false,
      setfriday = false,
      setsaturday = false;

  Time openTime = Time(hour: 00, minute: 00);
  Time closeTime = Time(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Store Timing",
            style: TextStyle(
                fontFamily: 'Autour',
                fontSize: 20,
                color: primaryColor,
                fontWeight: FontWeight.w400)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            timeCard(
              context: context,
              color: const Color.fromRGBO(225, 254, 247, 1),
              openTime: openTime,
              closeTime: closeTime,
              width: width,
              setOpenTiming: ({required Time time}) =>
                  setState(() => sunday["open"] = time),
              setCloseTiming: ({required Time time}) =>
                  setState(() => sunday["close"] = time),
              setDay: setsunday,
              toggle: FlutterSwitch(
                padding: 4,
                width: 50,
                height: 25,
                activeColor: const Color.fromRGBO(43, 126, 107, 1),
                inactiveColor: Colors.grey.shade300,
                inactiveToggleColor: Colors.grey,
                activeToggleColor: const Color.fromRGBO(225, 254, 247, 1),
                value: setsunday,
                borderRadius: 25,
                onToggle: (val) {
                  setState(() {
                    setsunday = val;
                  });
                },
              ),
              time: sunday,
              nameofDay: 'Sunday',
            ),
            timeCard(
              context: context,
              color: const Color.fromRGBO(252, 254, 229, 1),
              openTime: openTime,
              closeTime: closeTime,
              width: width,
              setOpenTiming: ({required Time time}) =>
                  setState(() => monday["open"] = time),
              setCloseTiming: ({required Time time}) =>
                  setState(() => monday["close"] = time),
              setDay: setmonday,
              toggle: FlutterSwitch(
                padding: 4,
                width: 50,
                height: 25,
                activeColor: const Color.fromRGBO(134, 141, 49, 1),
                inactiveColor: Colors.grey.shade300,
                inactiveToggleColor: Colors.grey,
                activeToggleColor: const Color.fromRGBO(252, 254, 229, 1),
                value: setmonday,
                borderRadius: 25,
                onToggle: (val) {
                  setState(() {
                    setmonday = val;
                  });
                },
              ),
              time: monday,
              nameofDay: 'Monday',
            ),
            timeCard(
              context: context,
              color: const Color.fromRGBO(250, 192, 255, 1),
              openTime: openTime,
              closeTime: closeTime,
              width: width,
              setOpenTiming: ({required Time time}) =>
                  setState(() => tuesday["open"] = time),
              setCloseTiming: ({required Time time}) =>
                  setState(() => tuesday["close"] = time),
              setDay: settuesday,
              toggle: FlutterSwitch(
                padding: 4,
                width: 50,
                height: 25,
                activeColor: const Color.fromRGBO(133, 57, 140, 1),
                inactiveColor: Colors.grey.shade300,
                inactiveToggleColor: Colors.grey,
                activeToggleColor: const Color.fromRGBO(250, 192, 255, 1),
                value: settuesday,
                borderRadius: 25,
                onToggle: (val) {
                  setState(() {
                    settuesday = val;
                  });
                },
              ),
              time: tuesday,
              nameofDay: 'Tuesday',
            ),
            timeCard(
                context: context,
                color: const Color.fromRGBO(201, 188, 255, 1),
                openTime: openTime,
                closeTime: closeTime,
                width: width,
                setOpenTiming: ({required Time time}) =>
                    setState(() => wednesday["open"] = time),
                setCloseTiming: ({required Time time}) =>
                    setState(() => wednesday["close"] = time),
                setDay: setwednesday,
                toggle: FlutterSwitch(
                  padding: 4,
                  width: 50,
                  height: 25,
                  activeColor: const Color.fromRGBO(56, 42, 114, 1),
                  inactiveColor: Colors.grey.shade300,
                  inactiveToggleColor: Colors.grey,
                  activeToggleColor: const Color.fromRGBO(201, 188, 255, 1),
                  value: setwednesday,
                  borderRadius: 25,
                  onToggle: (val) {
                    setState(() {
                      setwednesday = val;
                    });
                  },
                ),
                nameofDay: 'Wednesday',
                time: wednesday),
            timeCard(
                context: context,
                color: const Color.fromRGBO(254, 228, 163, 1),
                openTime: openTime,
                closeTime: closeTime,
                width: width,
                setOpenTiming: ({required Time time}) =>
                    setState(() => thursday["open"] = time),
                setCloseTiming: ({required Time time}) =>
                    setState(() => thursday["close"] = time),
                setDay: setthursday,
                toggle: FlutterSwitch(
                  padding: 4,
                  width: 50,
                  height: 25,
                  activeColor: const Color.fromRGBO(109, 88, 31, 1),
                  inactiveColor: Colors.grey.shade300,
                  inactiveToggleColor: Colors.grey,
                  activeToggleColor: const Color.fromRGBO(254, 228, 163, 1),
                  value: setthursday,
                  borderRadius: 25,
                  onToggle: (val) {
                    setState(() {
                      setthursday = val;
                    });
                  },
                ),
                nameofDay: 'Thursday',
                time: thursday),
            timeCard(
                context: context,
                color: const Color.fromRGBO(145, 255, 106, 1),
                openTime: openTime,
                closeTime: closeTime,
                width: width,
                setOpenTiming: ({required Time time}) =>
                    setState(() => friday["open"] = time),
                setCloseTiming: ({required Time time}) =>
                    setState(() => friday["close"] = time),
                setDay: setfriday,
                toggle: FlutterSwitch(
                  padding: 4,
                  width: 50,
                  height: 25,
                  activeColor: const Color.fromRGBO(70, 122, 52, 1),
                  inactiveColor: Colors.grey.shade300,
                  inactiveToggleColor: Colors.grey,
                  activeToggleColor: const Color.fromRGBO(145, 255, 106, 1),
                  value: setfriday,
                  borderRadius: 25,
                  onToggle: (val) {
                    setState(() {
                      setfriday = val;
                    });
                  },
                ),
                nameofDay: 'Friday',
                time: friday),
            timeCard(
                context: context,
                color: const Color.fromRGBO(252, 255, 106, 1),
                openTime: openTime,
                closeTime: closeTime,
                width: width,
                setOpenTiming: ({required Time time}) =>
                    setState(() => saturday["open"] = time),
                setCloseTiming: ({required Time time}) =>
                    setState(() => saturday["close"] = time),
                setDay: setsaturday,
                toggle: FlutterSwitch(
                  padding: 4,
                  width: 50,
                  height: 25,
                  activeColor: const Color.fromRGBO(57, 57, 21, 1),
                  inactiveColor: Colors.grey.shade300,
                  inactiveToggleColor: Colors.grey,
                  activeToggleColor: const Color.fromRGBO(252, 255, 106, 1),
                  value: setsaturday,
                  borderRadius: 25,
                  onToggle: (val) {
                    setState(() {
                      setsaturday = val;
                    });
                  },
                ),
                nameofDay: 'Saturday',
                time: saturday)
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(width, 50)),
            onPressed: () {},
            child: const Text(
              "Set Timing",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            )),
      ),
    );
  }
}
