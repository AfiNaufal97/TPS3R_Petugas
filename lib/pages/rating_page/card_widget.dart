import 'package:flutter/material.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';

import '../../utils/colors/colors_style.dart';

Widget cardWidget({
  required String nama,
  required String nilai,
  required String comentar,
  required String date,
}
    ){
  return Container(
    decoration: BoxDecoration(
      color: MyColors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: const [
        BoxShadow(
          color: MyColors.grey,
          spreadRadius: 0.9,
          blurRadius: 1.0,
          blurStyle: BlurStyle.outer,
          offset: Offset.zero
        )
      ]

    ),
    child: Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Wrap(
                    children: [Text(nama, style: FontsStyle.textSmallBlack,)])),
            Expanded(
                flex: 1,
                child: Text(date))
          ],
        ),
        Text(comentar),
        Text(nilai, style: FontsStyle.textSmallBlack.copyWith(
          color: MyColors.red
        ),)
      ],
    ),
  );
}