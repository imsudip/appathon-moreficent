import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wastify/indicator.dart';
import 'package:wastify/style.dart';
import 'package:wastify/ui/app_colors.dart';

class UserPage extends StatefulWidget {
  final String userid;
  final String dustbinid;
  const UserPage({Key? key, required this.userid, required this.dustbinid}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late int touchedIndex;
  @override
  void initState() {
    touchedIndex = -1;
    super.initState();
  }

  bool marked = false;
  @override
  Widget build(BuildContext context) {
    int coins = 1000, waste = 15;
    Widget buildR(String title, String coinp, String icon) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              icon,
              height: 30,
              width: 30,
            ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: normal,
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  backgroundColor: Colors.orangeAccent.withOpacity(0.2),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: const Text("Are you sure?"),
                      content: Text("$title for $coinp"),
                      actions: <Widget>[
                        CupertinoButton(
                            child: const Text("yes"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              int a = int.parse(coinp);
                              coins = coins - a;
                              setState(() {
                                print(coins);
                              });
                            }),
                        CupertinoButton(
                            child: const Text("no"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  );
                },
                child: Row(
                  children: <Widget>[
                    Image.asset(
                      "assets/coin.png",
                      height: 20,
                    ),
                    Text(
                      coinp,
                      style: subheading.copyWith(color: Colors.black54),
                    ),
                  ],
                ))
          ],
        );
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
                  height: 15,
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                "assets/user.png",
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                "  UserName : ",
                                style: subheading,
                              ),
                              Text(
                                widget.userid,
                                style: heading.copyWith(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Image.asset(
                                "assets/dustbin.png",
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                "  Dustbin Id : ",
                                style: subheading,
                              ),
                              Text(
                                widget.dustbinid,
                                style: heading.copyWith(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    height: 110,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  "assets/coin.png",
                                  height: 35,
                                  width: 35,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  coins.toString(),
                                  style: heading.copyWith(fontSize: 22),
                                )
                              ],
                            ),
                            Text(
                              "Coins earned",
                              style: subheading,
                            )
                          ],
                        )),
                        Container(
                          width: 2,
                          color: Colors.black38,
                          height: 100,
                        ),
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  waste.toString(),
                                  style: heading,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "kgs",
                                  style: heading.copyWith(fontSize: 22),
                                )
                              ],
                            ),
                            Text(
                              "Waste disposed",
                              style: subheading,
                            )
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: 250,
                  child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                        backgroundColor: marked ? Colors.green.withOpacity(0.2) : Colors.yellow.withOpacity(0.2),
                      ),
                      onPressed: () {
                        setState(() {
                          marked = !marked;
                        });
                        showDialog(
                          context: context,
                          builder: (context) => CupertinoAlertDialog(
                            title: const Text("Your Dustbin is marked for Pickup"),
                            actions: <Widget>[
                              CupertinoButton(
                                  child: const Text("OK"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  }),
                            ],
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/pickup-truck.png",
                            height: 30,
                          ),
                          Text(
                            !marked ? "    Mark for Pickup" : "    Pickup Marked",
                            style: subheading.copyWith(color: Colors.black),
                          ),
                        ],
                      )),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    height: 230,
                    child: Column(
                      children: <Widget>[
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: buildR("Plant a tree", "200", "assets/plant.png"),
                        )),
                        const Divider(
                          thickness: 2,
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: buildR("Get 10% OFF you Taxes", "700", "assets/tax.png"),
                        )),
                        const Divider(
                          thickness: 2,
                        ),
                        Flexible(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: buildR("Help in children education", "300", "assets/book.png"),
                        )),
                        const Divider(
                          thickness: 2,
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text("Coming soon!"),
                                actions: <Widget>[
                                  CupertinoButton(
                                      child: const Text("ok"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      }),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "more",
                                style: normal.copyWith(color: Colors.lightBlue),
                              ),
                              const Icon(
                                Icons.chevron_right,
                                color: Colors.lightBlue,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: SizedBox(
                    height: 200,
                    child: Row(
                      children: <Widget>[
                        const SizedBox(
                          height: 18,
                        ),
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                  // pieTouchData: PieTouchData(touchCallback: (c, pieTouchResponse) {
                                  //   setState(() {
                                  //     if (pieTouchResponse!.touchInput is FlLongPressEnd ||
                                  //         pieTouchResponse!.touchInput is FlPanEnd) {
                                  //       touchedIndex = -1;
                                  //     } else {
                                  //       touchedIndex = pieTouchResponse.touchedSectionIndex;
                                  //     }
                                  //   });
                                  // }),
                                  borderData: FlBorderData(
                                    show: false,
                                  ),
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 32,
                                  sections: showingSections()),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text("OUT OF"),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  waste.toString(),
                                  style: heading,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "kgs",
                                  style: heading.copyWith(fontSize: 22),
                                )
                              ],
                            ),
                            const Indicator(
                              color: Color(0xff0293ee),
                              text: 'Bio-degradable',
                              isSquare: true,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Indicator(
                              color: Color(0xfff8b250),
                              text: 'Non-biodegradable',
                              isSquare: true,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            const Indicator(
                              color: Color(0xff845bef),
                              text: 'E-waste',
                              isSquare: true,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 28,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );

        default:
          return null!;
      }
    });
  }
}
