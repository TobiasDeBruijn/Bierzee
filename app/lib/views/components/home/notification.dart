
import 'package:bierzee/api/common.dart';
import 'package:bierzee/api/notification/complete.dart';
import 'package:bierzee/api/notification/list.dart';
import 'package:bierzee/entities/user.dart';
import 'package:bierzee/proto/payloads/notifications.pb.dart' as proto;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationListComponent extends StatefulWidget {
  final User user;
  
  const NotificationListComponent({Key? key, required this.user}) : super(key: key);
  
  @override
  State<NotificationListComponent> createState() => _NotificationListComponentState();
}

class _NotificationListComponentState extends State<NotificationListComponent> {
  List<NotificationComponent> notificationComponents = [];

  @override
  void initState() {
    super.initState();
    _getNotifications();
  }

  void _getNotifications() async {
    Response<proto.GetListNotificationResponse> notifications = await NotificationList.list(widget.user.sessionId);
    if(!notifications.handleNotOk(context)) {
      return;
    }

    setState(() {
      notificationComponents = notifications.value!.notifications.map((e) => NotificationComponent(user: widget.user, notification: e, getNotificationsFunction: _getNotifications)).toList();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: notificationComponents,
    );
  }
}

class NotificationComponent extends StatefulWidget {
  final proto.Notification notification;
  final Function() getNotificationsFunction;
  final User user;

  const NotificationComponent({Key? key, required this.notification, required this.user, required this.getNotificationsFunction}) : super(key: key);

  @override
  State<NotificationComponent> createState() => _NotificationComponentState();
}

class _NotificationComponentState extends State<NotificationComponent> {
  bool isOkLoading = false;
  
  @override
  Widget build(BuildContext context) {
   return SizedBox(
     width: double.infinity,
     child: Card(
       elevation: 2,
       color: Colors.red[300],
       child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.notification.text,
              style: GoogleFonts.oxygen(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: isOkLoading ? SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  ) : const Text('OK'),
                  onPressed: () => handleOkPressed(context),
                )
              ],
            )
          ],
        ),
       ),
     ),
   );
  }

  void handleOkPressed(BuildContext context) async {
    setState(() {
      isOkLoading = true;
    });

    Response<void> success = await NotificationComplete.complete(proto.PostCompleteNotificationRequest(notificationId: widget.notification.id, completed: true), widget.user.sessionId);
    if(!success.handleNotOk(context)) {
      return;
    }

    setState(() {
      isOkLoading = false;
    });

    widget.getNotificationsFunction();
  }
}