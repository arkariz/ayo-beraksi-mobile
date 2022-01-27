import 'package:ayo_beraksi_flutter/core/config/constant.dart';
import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/core/params/notification_params.dart';
import 'package:ayo_beraksi_flutter/features/laporan/presentation/bloc/laporan_list/laporan_list_bloc.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart' as ne;
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification/notification_bloc.dart';
import 'package:ayo_beraksi_flutter/screens/home/pages/notifikasi/components/notifikasi_empty.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jiffy/jiffy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotifikasiBody extends StatefulWidget {
  const NotifikasiBody({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<NotifikasiBody> createState() => _NotifikasiBodyState();
}

class _NotifikasiBodyState extends State<NotifikasiBody> with WidgetsBindingObserver {
  List<ne.Notification> notifications = [];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    var isActive = state == AppLifecycleState.resumed;
    if (isActive) {
      final prefs = await SharedPreferences.getInstance();

      int? notifId = prefs.getInt(CACHED_NOTIF_ID);
      String? title = prefs.getString(CACHED_NOTIF_TITLE);
      String? body = prefs.getString(CACHED_NOTIF_BODY);

      if (notifId != null) {
        NotificationParams notification = NotificationParams(
            notification: ne.Notification(
          notifId,
          title!,
          body!,
          DateTime.now(),
          false,
        ));
        BlocProvider.of<NotificationBloc>(context).add(SaveNotificationEvent(notification));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: notifications.isEmpty
              ? const NotifikasiEmpty()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    return NotificationItem(
                      size: widget.size,
                      title: notifications[index].title,
                      body: notifications[index].body,
                      dateTime: notifications[index].dateTime,
                      isRead: notifications[index].isRead,
                      index: notifications.length - 1 - index,
                    );
                  },
                ),
        );
      },
      listener: (context, state) {
        if (state is SaveNotificationSuccess) {
          BlocProvider.of<NotificationBloc>(context).add(GetAllNotificationEvent());
          BlocProvider.of<LaporanListBloc>(context).add(GetLaporanList());
        }
        if (state is GetNotificationSuccess) {
          setState(() => notifications = state.notifications!);
        }
        if (state is UpdateNotificationSuccess) {
          setState(() => notifications = state.notifications!);
        }
      },
    );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({
    Key? key,
    required this.size,
    required this.title,
    required this.body,
    required this.dateTime,
    required this.isRead,
    required this.index,
  }) : super(key: key);

  final Size size;
  final String title;
  final String body;
  final DateTime dateTime;
  final bool isRead;
  final int index;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<NotificationBloc>(context).add(
          UpdateNotificationEvent(
            UpdateNotificationParams(
              index: widget.index,
              notification: ne.Notification(
                widget.index,
                widget.title,
                widget.body,
                widget.dateTime,
                true,
              ),
            ),
          ),
        );
      },
      child: Container(
        color: widget.isRead ? Colors.black12 : Colors.transparent,
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.isRead
                ? const SizedBox()
                : const Icon(
                    Icons.brightness_1_rounded,
                    color: Colors.red,
                    size: 10,
                  ),
            const Icon(Icons.article_rounded),
            SizedBox(
              width: widget.size.width * 0.7,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        widget.body,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(
                        Jiffy(widget.dateTime).fromNow(),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black26,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
