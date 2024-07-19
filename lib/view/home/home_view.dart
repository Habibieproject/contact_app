import 'package:contact_app/controller/data/database.dart';
import 'package:contact_app/controller/data/shared_preference.dart';
import 'package:contact_app/controller/utils/ext/navigation.dart';
import 'package:contact_app/controller/utils/helper/avatar_word.dart';
import 'package:contact_app/controller/utils/query/query.dart';
import 'package:contact_app/controller/utils/text_field.dart';
import 'package:contact_app/controller/utils/theme/app_color.dart';
import 'package:contact_app/controller/utils/theme/app_style.dart';
import 'package:contact_app/controller/utils/theme/icont_icons.dart';
import 'package:contact_app/models/contact_model.dart';
import 'package:contact_app/view/home/detail_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<ContactResponse>> _contacts;
  String? _userId;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserId();
    _contacts = DatabaseHelper().getContacts();
  }

  Future<void> _loadUserId() async {
    var userIds = await PreferenceHandler.retrieveUserID();
    setState(() {
      _userId = userIds;
    });
  }

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
            CustomTextField(
              hintText: "Search your contact list...",
              suffixIcon: const Icon(Icont.search),
              controller: _searchController,
            ),
            spaceHeight04,
            Expanded(
              child: FutureBuilder<List<ContactResponse>>(
                  future: _contacts,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('No contacts found'));
                    } else {
                      final contacts = snapshot.data!;

                      return GridView.builder(
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: contacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final contact = contacts[index];
                          final isCurrentUser = contact.id == _userId;
                          final avatar = getAvatarWord(
                              '${contact.firstName} ${contact.lastName}');
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
                                border:
                                    Border.all(color: AppColor.kDarkGrayColor),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    child: CircleAvatar(
                                      radius: 100,
                                      backgroundColor: AppColor.kPrimaryColor,
                                      child: Text(avatar,
                                          style: AppStyle.extraLight(
                                              color: AppColor.kWhiteColor,
                                              fontSize: FontSize.font30)),
                                    ),
                                  ),
                                  spaceHeight02,
                                  RichText(
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(
                                      text:
                                          '${contact.firstName} ${contact.lastName}',
                                      style: AppStyle.regular(
                                          fontSize: FontSize.font13),
                                      children: [
                                        if (isCurrentUser)
                                          TextSpan(
                                            text: ' (you)',
                                            style: AppStyle.regular(
                                                    fontSize: FontSize.font13,
                                                    color: AppColor.kGrayColor)
                                                .copyWith(
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
