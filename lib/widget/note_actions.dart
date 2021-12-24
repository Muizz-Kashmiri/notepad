import 'package:flutter/material.dart';
import 'package:notepad/screen/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:notepad/icons.dart';
import 'package:notepad/models.dart';
import 'package:notepad/services.dart';
import 'package:notepad/styles.dart';

import '../my.i18n.dart';

/// Provide actions for a single [Note], used in a [BottomSheet].
class NoteActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final note = Provider.of<Note>(context);
    final state = note?.state;
    final id = note?.id;
    final uid = Provider.of<CurrentUser>(context)?.data?.uid;

    final textStyle = TextStyle(
      fontFamily: selectedFont,
      color: kHintTextColorLight,
     // fontSize: 16,
        fontSize: initFontValue,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // if (id != null && state < NoteState.archived) ListTile(
        //   leading: const Icon(AppIcons.archive_outlined),
        //   title: Text('Archive', style: textStyle),
        //   onTap: () => Navigator.pop(context, NoteStateUpdateCommand(
        //     id: id,
        //     uid: uid,
        //     from: state,
        //     to: NoteState.archived,
        //     dismiss: true,
        //   )),
        // ),
        // if (state == NoteState.archived) ListTile(
        //   leading: const Icon(AppIcons.unarchive_outlined),
        //   title: Text('Unarchive', style: textStyle),
        //   onTap: () => Navigator.pop(context, NoteStateUpdateCommand(
        //     id: id,
        //     uid: uid,
        //     from: state,
        //     to: NoteState.unspecified,
        //   )),
        // ),
        if (id != null && state != NoteState.deleted)
          ListTile(
            leading: const Icon(AppIcons.delete_outline),
            title: Text(delete.i18n, style: textStyle),
            onTap: () => Navigator.pop(
                context,
                NoteStateUpdateCommand(
                  id: id,
                  uid: uid,
                  from: state,
                  to: NoteState.deleted,
                  dismiss: true,
                )),
          ),
//        if (id != null) ListTile(
//          leading: const Icon(AppIcons.copy),
//          title: Text('Make a copy', style: textStyle),
//        ),
        if (state == NoteState.deleted)
          ListTile(
            leading: const Icon(Icons.restore),
            title: Text(restore.i18n, style: textStyle),
            onTap: () => Navigator.pop(
                context,
                NoteStateUpdateCommand(
                  id: id,
                  uid: uid,
                  from: state,
                  to: NoteState.unspecified,
                )),
          ),
        ListTile(
            leading: const Icon(AppIcons.share_outlined),
            title: Text(send.i18n, style: textStyle),
            onTap: () {
              /// send this note to other apps function here
              Share.share('${note.title.trim()}\n\n${note.content}');
            }),
      ],
    );
  }
}
