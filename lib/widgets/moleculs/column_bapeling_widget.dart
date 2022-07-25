import 'package:flutter/material.dart';

import '../../utils/colors/colors_style.dart';
import '../atom/button_widget.dart';
import '../atom/text_widget.dart';
// ignore: must_be_immutable
class ColumnBapelingWidget extends StatelessWidget {
  String title;
  String value;
  String nameButton;

  ColumnBapelingWidget(
      {Key? key,
      required this.nameButton,
      required this.title,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(text: title),
        TextWidget(text: value),
        ButtonWidget(
          textButton: nameButton,
          color: MyColors.main,
          function: () {},
        )
      ],
    );
  }
}
