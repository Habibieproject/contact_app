import 'package:contact_app/controller/utils/ext/navigation.dart';
import 'package:contact_app/controller/utils/helper/avatar_word.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/text_field.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/controller/utils/theme/icont_icons.dart';
import 'package:contact_app/view/home/detail_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: () {
          context.push(const DetailView(
            isAdd: true,
          ));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: Padding(
        padding: sizePaddingAll(context),
        child: Column(
          children: [
            const CustomTextField(
              hintText: "Search your contact list...",
              suffixIcon: Icon(Icont.search),
            ),
            spaceHeight04,
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: 8,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      context.push(const DetailView(
                        isAdd: false,
                      ));
                    },
                    child: Container(
                      padding: sizePaddingAll(context) / 2,
                      decoration: BoxDecoration(
                        color: AppColor.kWhiteColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColor.kDarkGrayColor),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: CircleAvatar(
                              radius: 100,
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
                          spaceHeight02,
                          Text('Andrea Surya',
                              style:
                                  AppStyle.regular(fontSize: FontSize.font13)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
