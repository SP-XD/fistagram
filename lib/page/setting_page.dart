import 'Package:flutter/material.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:fistagram/utils/colors.dart';
import 'package:fistagram/custom_icons_icons.dart';
import 'package:iconforest_clarity/clarity.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final TextStyle settingsOptionsTextStyle = TextStyle(
    color: Colors.blueGrey.shade900,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  final ButtonStyle settingsOptionsButtonStyle = TextButton.styleFrom(
    splashFactory: InkRipple.splashFactory,
    foregroundColor: Colors.blueGrey.shade100,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: primaryInputBoxColor,
                    filled: true,
                    prefixIcon: Icon(CustomIcons.clarity_search_line,
                        color: Colors.blueGrey.shade300, size: 25),
                    hintText: "Search settings...",
                    hintStyle: TextStyle(
                      color: Colors.blueGrey.shade300,
                      fontSize: 18.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.users_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Folow and Invite Friends",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.notification_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Notifications",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.lock_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Privacy",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.cursor_hand_click_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Ads",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.user_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Account",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.help_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Help",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
                const SizedBox(height: 10),
                TextButton(
                    onPressed: () {},
                    style: settingsOptionsButtonStyle,
                    child: Row(
                      children: [
                        Clarity(Clarity.help_info_line,
                            height: 30,
                            width: 30,
                            color: Colors.blueGrey.shade500),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "About",
                          style: settingsOptionsTextStyle,
                        ),
                      ],
                    )),
              ],
            )),
      ),
    );
  }
}
