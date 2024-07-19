import 'package:contact_app/controller/utils/button.dart';
import 'package:contact_app/controller/utils/helper/avatar_word.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/text_field.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/controller/utils/theme/icont_icons.dart';
import 'package:contact_app/controller/utils/title.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.isAdd});
  final bool isAdd;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Contact Details'),
        ),
        body: ListView(
          padding: sizePaddingAll(context),
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColor.kPrimaryColor,
              child: Text(
                  getAvatarWord(
                    "Andrea Surya",
                  ),
                  style: AppStyle.extraLight(
                      color: AppColor.kWhiteColor, fontSize: FontSize.font30)),
            ),
            const TitleTextFieldConst(
                title: "Main Information", isItalic: true),
            dividerWidget(),
            const TitleTextFieldConst(title: "First Name", isRequired: true),
            spaceHeight02,
            CustomTextField(
              prefixIcon: const Icon(Icont.person),
              controller: _firstNameController,
              hintText: 'Enter first name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter first name';
                }
                return null;
              },
            ),
            spaceHeight04,
            const TitleTextFieldConst(title: "Last Name", isRequired: true),
            spaceHeight02,
            CustomTextField(
              prefixIcon: const Icon(Icont.person),
              controller: _lastNameController,
              hintText: 'Enter last name',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter last name';
                }
                return null;
              },
            ),
            spaceHeight06,
            const TitleTextFieldConst(title: "Sub Information", isItalic: true),
            dividerWidget(),
            const TitleTextFieldConst(
              title: "Email",
            ),
            spaceHeight02,
            CustomTextField(
              prefixIcon: const Icon(Icont.email),
              controller: _emailController,
              hintText: 'Enter email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),
            spaceHeight04,
            const TitleTextFieldConst(
              title: "Date Of Birth",
            ),
            spaceHeight02,
            CustomTextField(
              prefixIcon: const Icon(Icont.date),
              readOnly: true,
              controller: _dobController,
              hintText: 'Enter birthday',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter birthday';
                }
                return null;
              },
            ),
            spaceHeight06,
            if (widget.isAdd) ...[
              Row(
                children: [
                  DefaultButton(
                    text: "Save",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ] else ...[
              Row(
                children: [
                  DefaultButton(
                    text: "Update",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
              spaceHeight02,
              Row(
                children: [
                  DefaultButton(
                    text: "Remove",
                    isOutline: true,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ]
          ],
        ));
  }

  Divider dividerWidget() {
    return const Divider(
      color: AppColor.kDarkGrayColor,
    );
  }
}
