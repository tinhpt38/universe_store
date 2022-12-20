import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui.dart';
import 'package:universe_store/app/values/colors.dart';

class FormalButton extends StatelessWidget {
  const FormalButton({super.key, required this.label, required this.onPress});
  final String label;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: AppColors.cardColor,
            // border: Border(bottom: BorderSide(color: AppColors.secondaryButton)),
            borderRadius: BorderRadius.circular(4)),
        width: double.infinity,
        child: TextButton(
            child: Text(
              label,
              style: TextStyle(fontSize: 18, color: AppColors.highLight),
            ),
            onPressed: () {
              onPress();
            }),
      ),
    );
  }
}
