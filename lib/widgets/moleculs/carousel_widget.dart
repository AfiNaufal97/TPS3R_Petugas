import 'package:flutter/material.dart';

import '../../resources/size_resource.dart';
import '../../resources/string_assets.dart';
import '../../resources/string_resource.dart';
import '../../utils/colors/colors_style.dart';
import '../../utils/fonts/fonts_style.dart';
import '../atom/text_widget.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeResource.padding),
      decoration: BoxDecoration(
          color: MyColors.white,
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                blurStyle: BlurStyle.outer,
                color: MyColors.grey,
                spreadRadius: 0.9,
                offset: Offset.zero)
          ],
          borderRadius: BorderRadius.circular(SizeResource.radius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: StringResource.textTitleCarousel, style: FontsStyle.textMedium.copyWith(
                  color: MyColors.green
                ),),
                TextWidget(text: StringResource.textValueCarousel)
              ],
            ),
          ),
          const SizedBox(width: 5,),
          Image.asset(
            StringAssets.imgCarousel,
            width: 80,
          )
        ],
      ),
    );
  }
}
