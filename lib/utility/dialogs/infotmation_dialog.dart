import 'package:flutter/material.dart';
import 'package:baxify/utility/dialogs/generic_dialog.dart';

Future<void> showInfoDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
      context: context,
      title: "Information",
      content: text,
      optionBuilder: () {
        return {
          'OK': null,
        };
      });
}
