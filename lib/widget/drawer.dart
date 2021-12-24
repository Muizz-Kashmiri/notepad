// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:notepad/screen/tasks/tasks.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

import 'package:notepad/models.dart';
import 'package:notepad/icons.dart';
import 'package:notepad/styles.dart';
import 'package:notepad/utils.dart';
import '../my.i18n.dart';
import 'drawer_filter.dart';

/// Navigation drawer for the app.
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Consumer<NoteFilter>(
        builder: (context, filter, _) => Drawer(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  _drawerHeader(context),
                  if (isNotIOS) const SizedBox(height: 25),
                  DrawerFilterItem(
                    icon: AppIcons.thumbtack,
                    title: notes.i18n,
                    isChecked: filter.noteState == NoteState.unspecified,
                    onTap: () {
                      filter.noteState = NoteState.unspecified;
                      Navigator.pop(context);
                    },
                  ),
//
                  const Divider(),

                  DrawerFilterItem(
                    icon: AppIcons.pin,
                    title: task.i18n,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Tasks()));
                    },
                  ),
//
                  const Divider(),
                  // DrawerFilterItem(
                  //   icon: AppIcons.archive_outlined,
                  //   title: 'Archive',
                  //   isChecked: filter.noteState == NoteState.archived,
                  //   onTap: () {
                  //     filter.noteState = NoteState.archived;
                  //     Navigator.pop(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) => archiveScreen()));
                  //   },
                  // ),
                  DrawerFilterItem(
                    icon: AppIcons.delete_outline,
                    title: trash.i18n,
                    isChecked: filter.noteState == NoteState.deleted,
                    onTap: () {
                      filter.noteState = NoteState.deleted;
                      Navigator.pop(context);
                    },
                  ),
                  const Divider(),
                  DrawerFilterItem(
                    icon: AppIcons.settings_outlined,
                    title: settings.i18n,
                    onTap: () {
                      Navigator.popAndPushNamed(context, '/settings');

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(builder: (context) => Settings()),

                    },
                  ),

                  const Divider(),
                  DrawerFilterItem(
                    icon: AppIcons.label,
                    title: logout.i18n,
                    onTap: () => _signOut(context),
                  ),
                  // DrawerFilterItem(
                  //   icon: Icons.help_outline,
                  //   title: 'About',
                  //   onTap: () => launch(''),
                  //  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _drawerHeader(BuildContext context) => SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
          child: RichText(
            text:  TextSpan(
              style: TextStyle(
                color: kHintTextColorLight,
                fontSize: 26,
                fontWeight: FontWeights.light,
                letterSpacing: -2.5,
              ),
              children: [
                  TextSpan(
                  text: 'Note',
                  style: TextStyle(

                    color: kAccentColorLight,
                    fontWeight: FontWeights.medium,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                 TextSpan(text: 'Pad'),
              ],
            ),
          ),
        ),
      );
}

void _signOut(BuildContext context) async {
  final yes = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      content:  Text(question.i18n),
      actions: <Widget>[
        FlatButton(
          child:  Text(no.i18n),
          onPressed: () => Navigator.pop(context, false),
        ),
        FlatButton(
          child: Text(yess.i18n),
          onPressed: () => Navigator.pop(context, true),
        ),
      ],
    ),
  );

  if (yes) {
    FirebaseAuth.instance.signOut();
    Navigator.pop(context);
  }
}
