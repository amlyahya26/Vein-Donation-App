import 'package:donation_app/shared/style/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future customDialog({
  required BuildContext context,
  required String title,
  required Widget body,
  String? actionButton,
  var actionOnPressed,
  var afterDismiss,
  bool buttonEnabled = true,
}) async {
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.tr(), style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 15,),
            body,
            const SizedBox(height: 15,),
            buttonEnabled == true ? GestureDetector(
              onTap: actionOnPressed,
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  decoration: BoxDecoration(color: CustomColors.primaryColor, borderRadius: const BorderRadius.all(Radius.circular(10))),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    actionButton!.tr(),
                    style: const TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ) : const SizedBox(),
          ],
        ),
        contentPadding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
      );
    },
  )/*.then(afterDismiss)*/;
}