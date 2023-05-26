// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:tuchati/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuchati/services/SQLite/models/user.dart';

class FriendCard extends StatelessWidget {
  final MyUser? contact;
  final List selected;
  const FriendCard({
    Key? key,
    required this.contact,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Box<Uint8List> myProfile = Hive.box<Uint8List>("myProfile");
    Box<Uint8List> groupsIcon = Hive.box<Uint8List>("groups");
//  print("contact 0 is  ${contact.length}   ${contact[3]}..................");
    return Card(
      elevation: 8,
      shadowColor: const Color(0xff2da9ef),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        minLeadingWidth: 2,
        leading: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: MemoryImage(groupsIcon.get("userDefault")!),
                fit: BoxFit.fill),
            shape: BoxShape.circle,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            contact!.firstName.toString(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        subtitle: Text(
          contact!.phone.toString(),
          style: TextStyle(
            color: Colors.blue.shade700,
            fontSize: 15,
          ),
        ),
        trailing: !selected.contains(contact!.phone.toString())
            ? Text(
                "",
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              )
            : Icon(
                Icons.check,
                color: AppColors.appColor,
              ),
      ),
    );
  }
}
