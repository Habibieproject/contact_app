import 'package:contact_app/controller/data/database.dart';
import 'package:contact_app/controller/utils/button.dart';
import 'package:contact_app/controller/utils/helper/avatar_word.dart';
import 'package:contact_app/controller/utils/helper/validator.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/text_field.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/controller/utils/theme/icont_icons.dart';
import 'package:contact_app/controller/utils/title.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key, required this.isAdd, this.contact});
  final ContactResponse? contact;
  final bool isAdd;
  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController = TextEditingController();
  late TextEditingController _lastNameController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.contact?.firstName);
    _lastNameController = TextEditingController(text: widget.contact?.lastName);
    _emailController = TextEditingController(text: widget.contact?.email);
    _dobController = TextEditingController(text: widget.contact?.dob);
  }

  Future<void> _updateContact() async {
    if (_formKey.currentState!.validate()) {
      final updatedContact = ContactResponse(
        id: widget.contact!.id,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        dob: _dobController.text,
      );

      await DatabaseHelper().updateContact(updatedContact);
      Navigator.pop(context, true); // return to the previous screen
    }
  }

  Future<void> _saveContact() async {
    if (_formKey.currentState!.validate()) {
      final newContact = ContactResponse(
        id: DateTime.now()
            .millisecondsSinceEpoch
            .toString(), // generate unique ID
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        dob: _dobController.text,
      );
      await DatabaseHelper().insertContact(newContact);
      Navigator.pop(context, true); // return to the previous screen
    }
  }

  Future<void> _deleteContact() async {
    await DatabaseHelper().deleteContact(widget.contact!.id);
    Navigator.pop(context, true); // return to the previous screen
  }

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
        body: Form(
          key: _formKey,
          child: ListView(
            padding: sizePaddingAll(context),
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: AppColor.kPrimaryColor,
                child: _firstNameController.text.isEmpty &&
                        _lastNameController.text.isEmpty
                    ? const Icon(
                        Icont.person,
                        size: 30,
                        color: AppColor.kWhiteColor,
                      )
                    : Text(
                        getAvatarWord(
                          "${_firstNameController.text} ${_lastNameController.text}",
                        ),
                        style: AppStyle.extraLight(
                            color: AppColor.kWhiteColor,
                            fontSize: FontSize.font30)),
              ),
              spaceHeight04,
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
              const TitleTextFieldConst(
                  title: "Sub Information", isItalic: true),
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
                  if (!isValidEmail(value)) {
                    return 'Please enter a valid email';
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
                    DefaultButton(text: "Save", onPressed: _saveContact),
                  ],
                ),
              ] else ...[
                Row(
                  children: [
                    DefaultButton(text: "Update", onPressed: _updateContact),
                  ],
                ),
                spaceHeight02,
                Row(
                  children: [
                    DefaultButton(
                      text: "Remove",
                      isOutline: true,
                      onPressed: _deleteContact,
                    ),
                  ],
                ),
              ]
            ],
          ),
        ));
  }

  Divider dividerWidget() {
    return const Divider(
      color: AppColor.kDarkGrayColor,
    );
  }
}
