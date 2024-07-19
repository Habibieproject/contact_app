import 'package:contact_app/controller/data/shared_preference.dart';
import 'package:contact_app/controller/utils/button.dart';
import 'package:contact_app/controller/utils/ext/navigation.dart';
import 'package:contact_app/controller/utils/helper/avatar_word.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          actions: [
            InkWell(
              onTap: () async {
                await PreferenceHandler.removeIsLoggedIn();
                await PreferenceHandler.removeUserID();
                context.pushRemoveAll(const LoginView());
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Logout',
                  style: AppStyle.bold(
                    fontSize: FontSize.font16,
                    color: AppColor.kPrimaryColor,
                  ).copyWith(fontWeight: FontWeight.w900),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: sizePaddingAll(context),
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: AppColor.kPrimaryColor,
                  child: Text(
                      getAvatarWord(
                        "Andrea Surya",
                      ),
                      style: AppStyle.extraLight(
                          color: AppColor.kWhiteColor,
                          fontSize: FontSize.font30)),
                ),
              ),
              spaceHeight04,
              Text("Andrea Surya",
                  style: AppStyle.regular(
                    fontSize: FontSize.font15,
                    color: AppColor.kGrayColor,
                  )),
              spaceHeight02,
              Text("andreasuryahabibie17@gmail.com",
                  style: AppStyle.regular(
                    fontSize: FontSize.font15,
                    color: AppColor.kGrayColor,
                  )),
              spaceHeight02,
              Text("26/6/1998",
                  style: AppStyle.regular(
                    fontSize: FontSize.font15,
                    color: AppColor.kGrayColor,
                  )),
              spaceHeight02,
              Row(
                children: [
                  DefaultButton(
                    text: "Update my detail",
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
