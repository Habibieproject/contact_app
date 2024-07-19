import 'package:contact_app/controller/data/database.dart';
import 'package:contact_app/controller/data/shared_preference.dart';
import 'package:contact_app/controller/utils/button.dart';
import 'package:contact_app/controller/utils/ext/navigation.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/text_field.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/controller/utils/theme/icont_icons.dart';
import 'package:contact_app/controller/utils/title.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/view/main/main_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late Future<List<ContactResponse>> _contacts;
  final TextEditingController _userIdController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _contacts = DatabaseHelper().getContacts();
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final userId = _userIdController.text;
      final contacts = await _contacts;
      final user = contacts.firstWhere(
        (user) => user.id == userId,
        orElse: () => ContactResponse(
            id: '', firstName: '', lastName: '', email: '', dob: ''),
      );

      if (user.id.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User ID not found"),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        await PreferenceHandler.storingIsLoggin(true);
        await PreferenceHandler.storingUserID(user.id);
        context.pushReplacement(const MainView());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi There!',
                  style: AppStyle.semiBold(color: AppColor.kPrimaryColor),
                ),
                Text('Please login to see your contact list',
                    style: AppStyle.regular(
                      color: AppColor.kGrayColor,
                    )),
                spaceHeight04,
                const TitleTextFieldConst(title: "User ID", isRequired: true),
                spaceHeight02,
                CustomTextField(
                  controller: _userIdController,
                  hintText: 'Enter User ID',
                  prefixIcon: const Icon(Icont.person),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter User ID';
                    }
                    return null;
                  },
                ),
                spaceHeight04,
                Row(
                  children: [
                    DefaultButton(
                      text: "Login",
                      onPressed: _login,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
