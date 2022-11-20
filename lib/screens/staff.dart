import 'package:flutter/material.dart';
import 'package:wastify/style.dart';
import 'package:wastify/ui/app_colors.dart';

class StaffPage extends StatefulWidget {
  final String staffId;
  const StaffPage({Key? key, required this.staffId}) : super(key: key);

  @override
  _StaffPageState createState() => _StaffPageState();
}

class _StaffPageState extends State<StaffPage> {
  double credit = 2200.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.black,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        title: Image.asset(
          "assets/logo.png",
          height: 30,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: SizedBox(
                  height: 75,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          "assets/user.png",
                          height: 30,
                          width: 30,
                        ),
                        Text(
                          "  Staff Id : ",
                          style: subheading,
                        ),
                        Text(
                          widget.staffId,
                          style: heading.copyWith(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Monthly Credit",
                        style: subheading,
                      ),
                      Text(
                        "Rs. $credit",
                        style: heading,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: Container(
                  color: Colors.green.withOpacity(0.1),
                  child: Image.asset(
                    "assets/mapview.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: SizedBox(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Next scheduling",
                        style: heading.copyWith(fontSize: 22),
                      ),
                      sheduleRow("Monday", "8:00 AM", "10:00 AM"),
                      sheduleRow("Tuesday", "8:00 AM", "10:00 AM"),
                      sheduleRow("Wednesday", "8:00 AM", "10:00 AM"),
                      sheduleRow("Thursday", "8:00 AM", "10:00 AM"),
                      sheduleRow("Friday", "8:00 AM", "10:00 AM"),
                      sheduleRow("Saturday", "8:00 AM", "10:00 AM"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  Row sheduleRow(String date, String startTime, String endTime) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/calendar.png",
            height: 30,
            width: 30,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date,
              style: normal.copyWith(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              "$startTime - $endTime",
              style: normal,
            )
          ],
        )
      ],
    );
  }
}
