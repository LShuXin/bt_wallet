import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:bt_wallet/common/application.dart';
import 'package:bt_wallet/common/theme/color.dart';
import 'package:bt_wallet/store/identity_store.dart';
import 'package:bt_wallet/modules/home/mine/pages/chat_page.dart';
import 'package:bt_wallet/modules/home/mine/pages/users_page.dart';
import 'package:bt_wallet/widgets/layouts/common_layout.dart';

import '../../../../router/routers.dart';
import '../../../../service/firbase_service.dart';

class MessagePage extends StatefulWidget {
  const MessagePage();

  @override
  State<StatefulWidget> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final IdentityStore _identityStore = Get.find();
  final FirebaseService firebaseService = FirebaseService();
  bool _error = false;
  bool _initialized = false;
  User? _user;

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  Future<void> initializeFlutterFire() async {
    try {
      await firebaseService.initFirebase();
      await firebaseService
          .findOrCreateUser(_identityStore.selectedIdentity.first);
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        setState(() {
          _user = user;
        });
      });
      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      title: "Message",
      withFloatingBtn: true,
      bottomBackColor: WalletColor.messageBg,
      appBarActions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                fullscreenDialog: true,
                builder: (context) => UsersPage(),
              ),
            );
          },
        )
      ],
      // floatingBtn: FloatingActionButton(
      //   backgroundColor: WalletColor.red,
      //   child: const Icon(Icons.person_add_alt_1),
      //   onPressed: () {
      //     _handleScan(context);
      //   },
      // ),
      child: Column(
        children: [
          if (!_initialized || _user == null)
            _buildMessageEmpty(context)
          else
            _buildMessageList(context)
        ],
      ),
    );
  }

  Widget _buildMessageEmpty(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: WalletColor.messageBg,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/icons/new-identity.svg',
            ),
            Column(
              children: <Widget>[
                Text(
                  "IT'S EMPTY HERE", //没有联系人
                  style: TextStyle(
                    color: WalletColor.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
                Text(
                  "Start a new chat", //新启聊天
                  style: TextStyle(
                    color: WalletColor.lightGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: WalletColor.messageBg,
        ),
        child: StreamBuilder<List<types.Room>>(
          stream: FirebaseChatCore.instance.rooms(),
          initialData: const [],
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return _buildMessageEmpty(context);
            }
            snapshot.data!.sort((a, b) => b.updatedAt!.compareTo(a.updatedAt!));
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final room = snapshot.data![index];

                return _chatCard(
                  room,
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        room: room,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _chatCard(types.Room room, VoidCallback onTap) {
    final otherUser = room.users.firstWhere(
      (u) => u.id != _user!.uid,
    );
    final lastMessage = room.lastMessages?.last;

    return Material(
      color: WalletColor.messageBg,
      child: InkWell(
          onTap: () => onTap(),
          hoverColor: WalletColor.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 15,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundImage: NetworkImage(otherUser.imageUrl ??
                      'https://i.picsum.photos/id/1/200/300.jpg?hmac=jH5bDkLr6Tgy3oAg5khKCHeunZMHq0ehBZr6vGifPLY'),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          room.name ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: WalletColor.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Opacity(
                          opacity: 0.64,
                          child: lastMessage != null
                              ? Text(
                                  lastMessage.toString(),
                                  style: TextStyle(
                                    color: WalletColor.white,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )
                              : null,
                        )
                      ],
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.64,
                  child: room.updatedAt != null
                      ? Text(
                          DateFormat('hh:mm a').format(
                            DateTime.fromMillisecondsSinceEpoch(
                              room.updatedAt!,
                            ).toLocal(),
                          ),
                          style: TextStyle(color: WalletColor.white),
                        )
                      : null,
                ),
              ],
            ),
          )),
    );
  }
}

Future<void> _handleScan(BuildContext context) async {
  final String scanResult =
      await Application.router.navigateTo(context, Routes.qrScanner) as String;

  return Future.delayed(const Duration(milliseconds: 500)).then((_) async {
    try {} catch (_) {}
  });
}
