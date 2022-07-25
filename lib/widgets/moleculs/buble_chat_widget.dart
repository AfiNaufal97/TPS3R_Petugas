

import 'package:flutter/material.dart';
import 'package:petugas_tps3r/utils/colors/colors_style.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';

Widget bubleChatWidget({required BuildContext context,required String text, required bool petugas}){
    return Align(
        alignment: petugas ? Alignment.topRight:Alignment.topLeft,
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          width: MediaQuery.of(context).size.width /2,
          decoration: BoxDecoration(
              color: petugas ?MyColors.white:MyColors.green, borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), bottomLeft: petugas? Radius.circular(10):Radius.circular(0), bottomRight: petugas?Radius.circular(0):Radius.circular(20))
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text, style: FontsStyle.textSmallBlack.copyWith(
                color: MyColors.white
            ),),
          ),
      ),
    );
}