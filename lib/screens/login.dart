import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wastify/screens/staff.dart';
import 'package:wastify/screens/user.dart';
import 'package:wastify/style.dart';
import 'package:wastify/ui/app_colors.dart';
import 'package:wastify/ui/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isStaff = false;
  String staffid = "";

  String userid = "";

  String dustbinid = "";
  void onsubmit() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (isStaff) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => StaffPage(
                staffId: staffid,
              )));
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => UserPage(
                userid: userid,
                dustbinid: dustbinid,
              )));
    }
  }

  Widget _buildTextField(String t) {
    return TextFormField(
      decoration: InputDecoration(
        // prefixIcon: const Icon(CupertinoIcons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
        labelText: t,
        labelStyle: const TextStyle(color: AppColors.textSecondaryColor, height: 1),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      keyboardType: TextInputType.text,
      style: const TextStyle(fontSize: 16, height: 1),
      cursorColor: AppColors.primaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return t + ' is required';
        }

        if (value.length < 5 || value.length > 12) {
          return t + ' must be betweem 5 and 12 characters';
        }

        return null;
      },
      onChanged: (v) {
        if (t == "Staff Id") {
          setState(() {
            // print("puts");
            staffid = v;
          });
        } else if (t == "UserName") {
          setState(() {
            //print("putu");
            userid = v;
          });
        } else if (t == "Dustbin id") {
          setState(() {
            //print("putd");
            dustbinid = v;
          });
        }
      },
    );
  }

  Widget _buildPasswordField(String t) {
    return TextFormField(
      decoration: InputDecoration(
        // prefixIcon: const Icon(CupertinoIcons.person),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(35)),
        labelText: t,
        labelStyle: const TextStyle(color: AppColors.textSecondaryColor, height: 1),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      ),
      keyboardType: TextInputType.text,
      obscureText: true,
      style: const TextStyle(
        fontSize: 16,
        height: 1,
      ),
      cursorColor: AppColors.primaryColor,
      validator: (value) {
        if (value!.isEmpty) {
          return t + ' is required';
        }

        if (value.length < 5 || value.length > 12) {
          return t + ' must be betweem 5 and 12 characters';
        }

        return null;
      },
    );
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 120,
                  child: Image.asset(
                    'assets/trash.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  child: Image.asset(
                    'assets/title.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.all(13),
                    alignment: Alignment.center,
                    child: Text(
                      "Login to your account",
                      style: AppTextStyle.headline1.copyWith(color: AppColors.textPrimaryColor),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Consumer", style: normal),
                    CupertinoSwitch(
                        trackColor: AppColors.accentColor,
                        value: isStaff,
                        onChanged: (b) {
                          setState(() {
                            isStaff = b;
                          });
                        }),
                    Text("Staff", style: normal),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Form(
                    //autovalidate: true,
                    key: _formKey,

                    child: Column(
                      children: <Widget>[
                        isStaff ? _buildTextField("Staff Id") : _buildTextField("UserName"),
                        const SizedBox(height: 20),
                        isStaff ? Container() : _buildTextField("Dustbin id"),
                        isStaff ? Container() : const SizedBox(height: 20),
                        _buildPasswordField("Password"),
                        const SizedBox(height: 20),
                        CupertinoButton(
                            // padding: EdgeInsets.symmetric(horizontal: 30),
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(25),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              onsubmit();
                            }),
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
}
