import 'package:ayo_beraksi_flutter/core/config/theme_constants.dart';
import 'package:ayo_beraksi_flutter/features/notification/domain/entities/notification.dart' as ne;
import 'package:ayo_beraksi_flutter/features/notification/presentation/bloc/notification/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifikasiBody extends StatefulWidget {
  const NotifikasiBody({Key? key, required this.size}) : super(key: key);

  final Size size;

  @override
  State<NotifikasiBody> createState() => _NotifikasiBodyState();
}

class _NotifikasiBodyState extends State<NotifikasiBody> {
  List<ne.Notification> notifications = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: ListView.builder(
            shrinkWrap: true,
            reverse: true,
            itemCount: state.notifications?.length ?? 0,
            itemBuilder: (context, index) {
              return NotificationItem(
                size: widget.size,
                title: notifications[index].title,
                body: notifications[index].body,
              );
            },
          ),
        );
      },
      listener: (context, state) {
        if (state is SaveNotificationSuccess) {
          BlocProvider.of<NotificationBloc>(context).add(GetAllNotificationEvent());
        }
        if (state is GetNotificationSuccess) {
          setState(() => notifications = state.notifications!);
        }
      },
    );
    // Column(
    //   children: [
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //     NotificationItem(size: widget.size),
    //   ],
    // );
  }
}

class NotificationItem extends StatefulWidget {
  const NotificationItem({Key? key, required this.size, required this.title, required this.body}) : super(key: key);

  final Size size;
  final String title;
  final String body;

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  bool isRead = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isRead = true),
      child: Container(
        color: isRead ? Colors.black12 : Colors.transparent,
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isRead
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
                    const Padding(
                      padding: EdgeInsets.only(top: 5.0),
                      child: Text(
                        "3 menit yang lalu",
                        style: TextStyle(
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
