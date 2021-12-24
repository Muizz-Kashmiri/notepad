// ignore_for_file: deprecated_member_use
import 'dart:ui';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:notepad/ad_helper.dart';
import 'package:notepad/app_icons.dart';
import 'package:notepad/main.dart';
import 'package:notepad/screen/settings_screen.dart';
import 'package:notepad/service/sharedPref.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, User;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';
import 'package:notepad/model/note.dart';
import 'package:notepad/icons.dart' show AppIcons;
import 'package:notepad/models.dart'
    show CurrentUser, Note, NoteState, NoteStateX, NoteFilter;
import 'package:notepad/services.dart' show notesCollection, CommandHandler;
import 'package:notepad/styles.dart';
import 'package:notepad/utils.dart';
import 'package:notepad/widgets.dart' show AppDrawer, NotesGrid, NotesList;
import 'package:notepad/constants.dart';
import '../my.i18n.dart';


  bool isLoaded = false;
  BannerAd ad;

  /// these bool values manage the list and grid view in the app
bool notesView = false;
bool toListView = false;
bool toGridView = true;
bool pressed = true;
bool ADpref = true;
int adVal = 0;
/// this is used to order the query, predefined is alphabetically, you can change it by title using title
String sortIt = 'createdAt';

/// this bool value will give us the ascending and descending order in the querey
bool AD = false;
int toggleSwitch = 0;

/// this enum manages list/grid view
enum Selected {
  left,
  right,
}

/// this enum manages sorting
enum SortIcon { atoz, time }

QuerySnapshot searchResultSnapshot;

/// to get firebase values in our app
final FirebaseAuth auth = FirebaseAuth.instance;
final User user = auth.currentUser;
final uid = user.uid;
String searchKey = null;
Stream streamQuery;

/// Home screen, displays [Note] grid or list.
class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

/// [State] of [HomeScreen].
class _HomeScreenState extends State<HomeScreen> with CommandHandler {
  /// this will give predefined colors in bottom sheet
  Color listViewColor = kActive;
  Color gridViewColor = kInactive;
  Color atozViewColor = kInactive;
  Color timeViewColor = kActive;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
 
  Selected selectedIcon;
  SortIcon sortion;

Widget checkForAd(){
  if(isLoaded == true){
    return StatefulBuilder(
      builder: (context, setState) =>
     Container(
        child: AdWidget(
          ad: ad,
        ),
        width: ad.size.width.toDouble(),
        alignment: Alignment.center,
      ),
    );
  }
  else{
    return CircularProgressIndicator();
  }
}
 

  @override
  void initState() {
    super.initState();
    AD = LangPreferences.getAD() ?? false;
    if(AD == false)
      {
        adVal = 0;
      }
    else{
      adVal = 1;
    }
    ad = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(
            () {
              isLoaded = true;
            },
          );
        },
        onAdFailedToLoad: (_, error) {
          print('Ad failed to load with error $error');
        },
      ),
    );
    ad.load();

  }

  onSwitchValueAD(bool newVal) {
    setState(() {
      ADpref = newVal;
      LangPreferences.saveAD(ADpref);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    ad?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus.unfocus();
          searchController.clear();
          searchKey = null;
          // Phoenix.rebirth(context);
        },
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            //      statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => NoteFilter(), // watching the note filter
              ),
              Consumer<NoteFilter>(
                builder: (context, filter, child) => StreamProvider.value(
                  value: searchKey == null
                      ? _createNoteStream(context, filter)
                      : _SearchedNoteStream(context,
                          filter), // applying the filter to Firestore query
                  child: child,
                ),
              ),
            ],
            child: Consumer2<NoteFilter, List<Note>>(
              builder: (context, filter, notes, child) {
                final hasNotes = notes?.isNotEmpty == true;
                final canCreate = filter.noteState.canCreate;
                return Scaffold(
                  key: _scaffoldKey,
                  body: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(width: 720),
                      child: CustomScrollView(
                        slivers: <Widget>[
                          _appBar(context, filter, child),
                          if (hasNotes)
                            const SliverToBoxAdapter(
                              child: SizedBox(height: 24),
                            ),
                          ..._buildNotesView(context, filter, notes),
                          if (hasNotes)
                            SliverToBoxAdapter(
                              child: SizedBox(
                                  height: (canCreate ? kBottomBarSize : 10.0) +
                                      10.0),
                            ),
                        ],
                      ),
                    ),
                  ),
                  drawer: AppDrawer(),
                  floatingActionButton: canCreate ? _fab(context) : null,
                  bottomNavigationBar: canCreate ? _bottomActions() : null,
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.endDocked,
                  extendBody: true,
                );
              },
            ),
          ),
        ),
      );

  Widget _appBar(BuildContext context, NoteFilter filter, Widget bottom) =>
      filter.noteState < NoteState.archived
          ? SliverAppBar(
              floating: true,
              snap: true,
              title: _topActions(context),
              automaticallyImplyLeading: false,
              centerTitle: true,
              titleSpacing: 0,
              backgroundColor: Colors.transparent,
              elevation: 0,
            )
          : SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                filter.noteState.filterName,
                style: TextStyle(
                  fontFamily: selectedFont,
                ),
              ),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () => _scaffoldKey.currentState?.openDrawer(),
              ),
              automaticallyImplyLeading: false,
            );

  Widget _topActions(BuildContext context) => Container(
        // width: double.infinity,
        constraints: const BoxConstraints(
          maxWidth: 720,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: isNotAndroid ? 7 : 5),
            child: Row(
              children: <Widget>[
                const SizedBox(width: 20),
                InkWell(
                  child: const Icon(Icons.menu),
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child:
                      //TextFormField()
                      TextField(
                    style: TextStyle(
                      fontFamily: selectedFont,
                    ),
                    controller: searchController,
                    autofocus: false,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: search.i18n,
                        suffixIcon: IconButton(
                          onPressed: () {
                            FocusManager.instance.primaryFocus.unfocus();
                            searchController.clear();
                            searchKey = null;
                            Phoenix.rebirth(context);
                          },
                          icon: searchKey == null
                              ? Icon(Icons.search)
                              : Icon(Icons.cancel),
                        )),
                    onChanged: (value) {
                      //TODO: search filter here
                      setState(() {
                        searchKey = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 16),
                InkWell(
                  child: const Icon(MyFlutterApp.diamond),
                  onTap: () {
                    //Todo diamond function here
                  },
                ),
                const SizedBox(width: 16),
                InkWell(
                    child: Icon(Icons.more_vert_rounded),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                            SingleChildScrollView(
                          child: Container(
                            // decoration: BoxDecoration(
                            //   color: Colors.grey,
                            // ),
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        view.i18n,
                                        style: kBottomSheetHeading,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(14.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                //function of sorting in list view here
                                                selectedIcon = Selected.left;
                                                notesView = toListView;
                                                listViewColor = kActive;
                                                gridViewColor = kInactive;

                                                Navigator.pop(context);

                                                //updateColor(1);
                                              });
                                            },
                                            child: Text(
                                              list.i18n,
                                              style: TextStyle(
                                                fontFamily: selectedFont,
                                                fontSize: 16,
                                                fontWeight: FontWeights.bold,
                                                color: listViewColor,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                //function of sorting in list view here
                                                selectedIcon = Selected.left;
                                                notesView = toListView;

                                                listViewColor = kActive;
                                                gridViewColor = kInactive;

                                                Navigator.pop(context);

                                                //updateColor(1);
                                              });
                                            },
                                            child: Icon(
                                              Icons.list,
                                              color: listViewColor,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                //function of sorting in list view here
                                                selectedIcon = Selected.right;
                                                notesView = toGridView;

                                                listViewColor = kInactive;
                                                gridViewColor = kActive;

                                                Navigator.pop(context);

                                                //updateColor(2);
                                              });
                                            },
                                            child: Text(
                                              grid.i18n,
                                              style: TextStyle(
                                                fontFamily: selectedFont,
                                                fontSize: 16,
                                                fontWeight: FontWeights.bold,
                                                color: gridViewColor,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                //function of sorting in list view here
                                                selectedIcon = Selected.right;
                                                notesView = toGridView;

                                                gridViewColor = kActive;
                                                listViewColor = kInactive;

                                                Navigator.pop(context);

                                                // updateColor(2);
                                              });
                                            },
                                            child: Icon(
                                              Icons.grid_view,
                                              color: gridViewColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        sort.i18n,
                                        style: kBottomSheetHeading,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  sortion = SortIcon.atoz;
                                                  sortIt = 'title';
                                                  atozViewColor = kActive;
                                                  timeViewColor = kInactive;

                                                  Navigator.pop(context);

                                                  //function of sorting in list view here
                                                },
                                              );
                                            },
                                            child: Text(
                                              'A to Z',
                                              style: TextStyle(
                                                fontFamily: selectedFont,
                                                fontSize: 16,
                                                fontWeight: FontWeights.bold,
                                                color: atozViewColor,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  //function of sorting in list view here
                                                  sortion = SortIcon.atoz;
                                                  sortIt = 'title';
                                                  atozViewColor = kActive;
                                                  timeViewColor = kInactive;

                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.sort_by_alpha_outlined,
                                              color: atozViewColor,
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  sortion = SortIcon.time;
                                                  sortIt = 'createdAt';
                                                  timeViewColor = kActive;
                                                  atozViewColor = kInactive;

                                                  Navigator.pop(context);

                                                  //function of sorting in list view here
                                                },
                                              );
                                            },
                                            child: Text(
                                              time.i18n,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: selectedFont,
                                                fontWeight: FontWeights.bold,
                                                color: timeViewColor,
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  //function of sorting in list view here
                                                  sortion = SortIcon.time;
                                                  sortIt = 'createdAt';

                                                  timeViewColor = kActive;
                                                  atozViewColor = kInactive;

                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.access_time,
                                              color: timeViewColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                adVal = 0;
                                              });
                                            },
                                            child: Text(
                                              ascending.i18n,
                                              style: kBottomSheetHeading,
                                            ),
                                          ),
//TODO: switch change kro
//                                           Switch(
//                                             value: ADpref,
//                                             onChanged: (newVal) {
//                                               setState(() {
//                                               onSwitchValueAD(newVal);
//                                               });
//                                             },
//                                           ),

                                          ToggleSwitch(
                                            minWidth: 30.0,
                                            minHeight: 25.0,
                                            cornerRadius: 20.0,
                                            activeBgColors: [
                                              [Colors.green[800]],
                                              [Colors.red[800]]
                                            ],
                                            activeFgColor: Colors.white,
                                            inactiveBgColor: Colors.grey,
                                            inactiveFgColor: Colors.white,
                                            initialLabelIndex: adVal,
                                            totalSwitches: 2,
                                            radiusStyle: true,
                                            onToggle: (index) {
                                              setState(() {
                                                if (index == 0) {
                                                  AD = false;
                                                  onSwitchValueAD(AD);
                                                } else {
                                                  AD = true;
                                                  onSwitchValueAD(AD);
                                                }
                                              });
                                            },
                                          ),
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                adVal = 1;
                                              });
                                            },
                                            child: Text(
                                              descending.i18n,
                                              style: kBottomSheetHeading,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    const Divider(),
                                   
                                    // Padding(
                                    //   padding: const EdgeInsets.all(12.0),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceEvenly,
                                    //     children: [
                                    //       BottomCardButton(
                                    //         vtext: 'CONFIRM',
                                    //         Tcolour: Colors.white,
                                    //         buttonColor: Colors.black,
                                    //         onPressed: () {
                                    //           Navigator.pop(context);
                                    //           //Function here to show the button arrangement and relations.
                                    //         },
                                    //       ),
                                    //       BottomCardButton(
                                    //         vtext: 'CANCEL',
                                    //         Tcolour: Colors.white,
                                    //         buttonColor: Colors.pinkAccent,
                                    //         onPressed: () {
                                    //           Navigator.pop(context);
                                    //         },
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ),
      );

  Widget _bottomActions() => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: kBottomBarSize,
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: <Widget>[
              Center(
                child: checkForAd(),
              ),
                       

              // const Icon(AppIcons.checkbox, size: 26),
              // const SizedBox(width: 30),
              // const Icon(AppIcons.brush_sharp, size: 26),
              // const SizedBox(width: 30),
              // const Icon(AppIcons.mic, size: 26),
              // const SizedBox(width: 30),
              // const Icon(AppIcons.insert_photo,
              //     size: 26),

            ],
          ),
        ),
      );

  Widget _fab(BuildContext context) => FloatingActionButton(
      backgroundColor: Theme.of(context).accentColor,
      child: const Icon(Icons.file_copy),
      onPressed: () async {
        final command = await Navigator.pushNamed(context, '/note');
        debugPrint('--- noteEditor result: $command');
        processNoteCommand(_scaffoldKey.currentState, command);
      });

  // Widget _buildAvatar(BuildContext context) {
  //   final url = Provider.of<CurrentUser>(context)?.data?.photoURL;
  //   return CircleAvatar(
  //     backgroundImage: url != null ? NetworkImage(url) : null,
  //     child: url == null ? const Icon(Icons.face) : null,
  //     radius: isNotAndroid ? 19 : 17,
  //   );
  // }

  /// A grid/list view to display notes
  ///
  /// Notes are divided to `Pinned` and `Others` when there's no filter,
  /// and a blank view will be rendered, if no note found.

  List<Widget> _buildNotesView(
      BuildContext context, NoteFilter filter, List<Note> notes) {
    if (notes?.isNotEmpty != true) {
      return [_buildBlankView(filter.noteState)];
    }

    final asGrid = filter.noteState == NoteState.deleted || notesView;
    final factory = asGrid ? NotesGrid.create : NotesList.create;
    final showPinned = filter.noteState == NoteState.unspecified;

    if (!showPinned) {
      return [
        factory(notes: notes, onTap: _onNoteTap),
      ];
    }

    final partition = _partitionNotes(notes);
    final hasPinned = partition.item1.isNotEmpty;
    final hasUnpinned = partition.item2.isNotEmpty;

    final _buildLabel = (String label, [double top = 26]) => SliverToBoxAdapter(
          child: Container(
            padding:
                EdgeInsetsDirectional.only(start: 26, bottom: 25, top: top),
            child: Text(
              label,
              style: const TextStyle(
                  color: kHintTextColorLight,
                  fontWeight: FontWeights.medium,
                  fontSize: 12),
            ),
          ),
        );

    return [
      if (hasPinned) _buildLabel('PINNED', 0),
      if (hasPinned) factory(notes: partition.item1, onTap: _onNoteTap),
      if (hasPinned && hasUnpinned) _buildLabel('OTHERS'),
      factory(notes: partition.item2, onTap: _onNoteTap),
    ];
  }

  Widget _buildBlankView(NoteState filteredState) => SliverFillRemaining(
        hasScrollBody: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Expanded(flex: 1, child: SizedBox()),
            Icon(
              AppIcons.thumbtack,
              size: 120,
              color: kAccentColorLight.shade300,
            ),
            Expanded(
              flex: 2,
              child: Text(
                filteredState.emptyResultMessage,
                style: TextStyle(
                  fontFamily: selectedFont,
                  color: kHintTextColorLight,
                  fontSize: 14,
                ),
              ),
            ),
            checkForAd(),

          ],
        ),
      );

  /// Callback on a single note clicked
  void _onNoteTap(Note note) async {
    final command =
        await Navigator.pushNamed(context, '/note', arguments: {'note': note});
    processNoteCommand(_scaffoldKey.currentState, command);
  }

  /// Partition the note list by the pinned state
  Tuple2<List<Note>, List<Note>> _partitionNotes(List<Note> notes) {
    if (notes?.isNotEmpty != true) {
      return Tuple2([], []);
    }

    final indexUnpinned = notes?.indexWhere((n) => !n.pinned);
    return indexUnpinned > -1
        ? Tuple2(notes.sublist(0, indexUnpinned), notes.sublist(indexUnpinned))
        : Tuple2(notes, []);
  }

  /// Create notes query
  Stream<List<Note>> _createNoteStream(
      BuildContext context, NoteFilter filter) {
    final user = Provider.of<CurrentUser>(context)?.data;
    final sinceSignUp = DateTime.now().millisecondsSinceEpoch -
        (user?.metadata?.creationTime?.millisecondsSinceEpoch ?? 0);
    final useIndexes = sinceSignUp >=
        _10_min_millis; // since creating indexes takes time, avoid using composite index until later

    final collection = notesCollection(user?.uid);
    final query = filter.noteState == NoteState.unspecified
        ? collection
            .where('state',
                isLessThan: NoteState.archived
                    .index) // show both normal/pinned notes when no filter specified
            .orderBy('state', descending: true) // pinned notes come first
        : collection.where('state', isEqualTo: filter.noteState.index);
    return (useIndexes ? query.orderBy('$sortIt', descending: AD) : query)
        .snapshots()
        .handleError((e) => debugPrint('query notes failed: $e'))
        .map((snapshot) => Note.fromQuery(snapshot));
  }

  /// search note stream

  Stream<List<Note>> _SearchedNoteStream(
      BuildContext context, NoteFilter filter) {
    final user = Provider.of<CurrentUser>(context)?.data;
    final sinceSignUp = DateTime.now().millisecondsSinceEpoch -
        (user?.metadata?.creationTime?.millisecondsSinceEpoch ?? 0);
    final useIndexes = sinceSignUp >=
        _10_min_millis; // since creating indexes takes time, avoid using composite index until later

    final collection = notesCollection(user?.uid);
    final query = collection
        .where('title', isGreaterThanOrEqualTo: searchKey.toUpperCase())
        .where('title', isLessThan: searchKey.toUpperCase() + 'z')
    .where('state', isEqualTo: 0);

    print(query);
    return query
        .snapshots()
        .handleError((e) => debugPrint('query notes failed: $e'))
        .map((snapshot) => Note.fromQuery(snapshot));
  }
}

const _10_min_millis = 600000;

