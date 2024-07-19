import 'package:contact_app/controller/data/database.dart';
import 'package:contact_app/controller/data/shared_preference.dart';
import 'package:contact_app/controller/utils/button.dart';
import 'package:contact_app/controller/utils/ext/navigation.dart';
import 'package:contact_app/controller/utils/helper/avatar_word.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/view/home/detail_view.dart';
import 'package:contact_app/view/login/login_view.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Future<ContactResponse?> _contact;
  @override
  void initState() {
    super.initState();
    _loadUserId();
  }

  Future<void> _loadUserId() async {
    String? userId = await PreferenceHandler.retrieveUserID();
    if (userId != null) {
      setState(() {
        _contact = DatabaseHelper().getContactById(userId);
      });
    }
  }

  void _refreshContacts() {
    setState(() {
      _loadUserId();
    });
  }

  void _navigateEditData(ContactResponse contact) {
    context
        .push(DetailView(
      contact: contact,
      isAdd: false,
    ))
        .then((result) {
      if (result == true) {
        _refreshContacts();
      }
    });
  }

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
        body: FutureBuilder<ContactResponse?>(
            future: _contact,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.kPrimaryColor,
                ));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data == null) {
                return const Center(child: Text('No profile data found'));
              } else {
                final contact = snapshot.data!;
                return Padding(
                  padding: sizePaddingAll(context),
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColor.kPrimaryColor,
                          child: Text(
                              getAvatarWord(
                                  '${contact.firstName} ${contact.lastName}'),
                              style: AppStyle.extraLight(
                                  color: AppColor.kWhiteColor,
                                  fontSize: FontSize.font30)),
                        ),
                      ),
                      spaceHeight04,
                      Text('${contact.firstName} ${contact.lastName}',
                          style: AppStyle.regular(
                            fontSize: FontSize.font15,
                            color: AppColor.kGrayColor,
                          )),
                      spaceHeight02,
                      Text(contact.email ?? "",
                          style: AppStyle.regular(
                            fontSize: FontSize.font15,
                            color: AppColor.kGrayColor,
                          )),
                      spaceHeight02,
                      Text(contact.dob ?? "",
                          style: AppStyle.regular(
                            fontSize: FontSize.font15,
                            color: AppColor.kGrayColor,
                          )),
                      spaceHeight02,
                      Row(
                        children: [
                          DefaultButton(
                            text: "Update my detail",
                            onPressed: () {
                              _navigateEditData(contact);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            }));
  }
}
