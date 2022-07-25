import 'package:flutter/material.dart';
import 'package:petugas_tps3r/utils/colors/colors_style.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';
import 'package:petugas_tps3r/widgets/moleculs/header_widget.dart';

class RatingPage extends StatelessWidget{
  const RatingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(function: (){}, text: 'Rating', colorText: MyColors.green,),
          Column(
            children: [
              Text('Ulasan Pelanggan', style: FontsStyle.textSmallBlack,),
              Padding(padding: const EdgeInsets.all(10), child: Column(
                children: [
                      //
                ],
              ),)
            ],
          )
        ],
      ),
    );
  }

}