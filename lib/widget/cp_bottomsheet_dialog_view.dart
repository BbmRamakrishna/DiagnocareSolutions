import 'package:flutter/material.dart';

class CPBottomSheetDialogView {
  BuildContext context;

  CPBottomSheetDialogView(this.context);

  void modalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Scaffold(
                  body: Container(
                    height: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                  ),
                );
              });
        });
  }
}
