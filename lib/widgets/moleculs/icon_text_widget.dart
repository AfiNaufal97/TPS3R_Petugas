import 'package:flutter/material.dart';
import 'package:petugas_tps3r/resources/size_resource.dart';

import '../../utils/fonts/fonts_style.dart';
import '../atom/text_widget.dart';

// ignore: must_be_immutable
class IconTextWidget extends StatelessWidget {
  Widget widget;
  double? marginIcon;
  double? padding;
  String text;
  bool? withExpanded;
  TextStyle? style;
  IconTextWidget(
      {Key? key,
      required this.widget,
        this.marginIcon = 10,
        this.padding = 8,
      required this.text,
      this.style,
      this.withExpanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(padding!),
      child: Row(
        children: [
          widget,
           SizedBox(
            width: marginIcon,
          ),
          withExpanded!
              ? Expanded(
                  child: TextWidget(
                      text: text,
                      style: style ??
                          FontsStyle.textButtonOnboarding.copyWith(fontSize: 12)))
              : TextWidget(
                  text: text,
                  style: style ??
                      FontsStyle.textButtonOnboarding.copyWith(fontSize: 12),
                )
        ],
      ),
    );
  }
}
