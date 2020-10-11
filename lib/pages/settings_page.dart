import 'package:chat_app/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Container(
      width: s.width,
      height: s.height,
      color: lightGrey,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Column(
        children: [
          SizedBox(height: 164),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Column(
                children: List.generate(settingItems.length - 2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SettingItem(
                      settingItemModel: settingItems[index],
                    ),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: 24),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              child: Column(
                children: List.generate(2, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SettingItem(
                      settingItemModel: settingItems[index + 5],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingItemModel {
  Color iconColor;
  String iconPath;
  String title;
  bool hasAltMenu;
  bool isChecked;

  SettingItemModel(this.iconColor, this.iconPath, this.title, this.hasAltMenu,
      this.isChecked);
}

List<SettingItemModel> settingItems = [
  SettingItemModel(
    darkGrey,
    "assets/icons/moon.png",
    "Dark Mode",
    false,
    false,
  ),
  SettingItemModel(
    mainGreen,
    "assets/icons/profile_lock.png",
    "Profile Lock",
    false,
    true,
  ),
  SettingItemModel(
    mainPurple,
    "assets/icons/comments.png",
    "Chat Customize",
    true,
    false,
  ),
  SettingItemModel(
    mainRed,
    "assets/icons/notification.png",
    "Notification",
    true,
    false,
  ),
  SettingItemModel(
    mainPink,
    "assets/icons/privacy.png",
    "Privacy",
    true,
    false,
  ),
  SettingItemModel(
    mainYellow,
    "assets/icons/logout.png",
    "Logout",
    true,
    false,
  ),
  SettingItemModel(
    mainRed,
    "assets/icons/delete.png",
    "Delete Account",
    true,
    false,
  ),
];

class SettingItem extends StatelessWidget {
  final SettingItemModel settingItemModel;
  const SettingItem({Key key, this.settingItemModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          padding: EdgeInsets.all(8),
          child: Image.asset(
            settingItemModel.iconPath,
            width: 12,
            color: textWhite,
          ),
          decoration: BoxDecoration(
            color: settingItemModel.iconColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12),
        Text(
          settingItemModel.title,
          style: GoogleFonts.sourceSansPro(
            color: textBlack,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Spacer(),
        settingItemModel.hasAltMenu
            ? Icon(Icons.arrow_forward_ios, color: darkGrey)
            : CupertinoSwitch(
                activeColor: mainGreen,
                value: settingItemModel.isChecked,
                onChanged: (val) {}),
      ],
    );
  }
}
