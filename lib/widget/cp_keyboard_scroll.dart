import 'package:flutter/material.dart';

class DismissKeyboardOnScroll extends StatelessWidget {
  final Widget child;
  final Function onDismiss;

  const DismissKeyboardOnScroll({Key key, this.child, this.onDismiss})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollStartNotification>(
      // ignore: missing_return
      onNotification: (x) {
        if (x.dragDetails == null) {
          return;
        }

        FocusScope.of(context).unfocus();
        if (onDismiss != null) {
          onDismiss();
        }
      },
      child: child,
    );
  }
}
