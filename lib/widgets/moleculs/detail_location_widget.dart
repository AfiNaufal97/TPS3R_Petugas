import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_show_detail_state.dart';
import 'package:petugas_tps3r/widgets/atom/button_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../bloc/bloc_show_detail.dart';
import '../../pages/chat_page.dart';
import '../../resources/size_resource.dart';
import '../../resources/string_resource.dart';
import '../../utils/colors/colors_style.dart';
import '../../utils/fonts/fonts_style.dart';
import '../atom/text_widget.dart';
import 'icon_text_widget.dart';

class DetailLocationWidget extends StatelessWidget {
  const DetailLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(SizeResource.paddingS),
      width: MediaQuery.of(context).size.width - 70,
      decoration: BoxDecoration(
          color: MyColors.white,
          borderRadius: BorderRadius.circular(SizeResource.radius)),
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset('assets/assets/image/profile.png', width: 100,),
              BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
                builder: (context, state) {
                  if(state is StateSuccess){
                    return TextWidget(
                      text: state.model.nameLocation,
                      style: FontsStyle.textMedium,
                    );
                  }
                  return TextWidget(
                    text: "Name User",
                    style: FontsStyle.textMedium,
                  );

                },

              ),
              BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
                builder: (context, state) {
                  if(state is StateSuccess){
                    return IconTextWidget(
                        withExpanded: true,
                        widget: const Icon(
                          Icons.location_pin,
                          size: 25,
                        ),
                        text: state.model.address);
                  }
                  return IconTextWidget(
                      withExpanded: true,
                      widget: const Icon(
                        Icons.location_pin,
                        size: 25,
                      ),
                      text: StringResource.textLocationTps3r);
                },

              ),
              BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
                builder: (context, state) {
                  if(state is StateSuccess){
                    return IconTextWidget(
                        withExpanded: false,
                        widget: const Icon(
                          Icons.phone_android,
                          size: 25,
                        ),
                        text: state.model.noTelepon);
                  }
                  return IconTextWidget(
                      withExpanded: false,
                      widget: const Icon(
                        Icons.phone_android,
                        size: 25,
                      ),
                      text: StringResource.textLocationTps3r);
                },

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
                      builder: (context, state) {
                        if(state is StateSuccess){
                          return ButtonWidget(textButton: 'Telpon', function: ()async{
                            var no = Uri.parse('tel:${state.model.noTelepon}');
                            await launchUrl(no);
                          }, color: MyColors.green, width:100, height: 30,);
                        }
                        return ButtonWidget(textButton: 'Telpon', function: (){}, color: MyColors.green, width:100, height: 30,);
                      },
                  ),

                  BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
                    builder: (context, state) {
                      if(state is StateSuccess){
                        return ButtonWidget(textButton: 'Chat', function: ()async{
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(name: state.model.nameLocation, noHp: state.model.noTelepon,)));
                        }, color: MyColors.green, width:100, height: 30,);
                      }
                      return ButtonWidget(textButton: 'Chat',color: MyColors.green, width: 100,height: 30,function: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(

                        )));
                      });
                    },
                  ),
                  // ButtonWidget(textButton: 'Chat',color: MyColors.green, width: 100,height: 30,function: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatPage(
                  //
                  //   )));
                  // })
                ],
              )
            ],
          ),
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: (){
                context.read<BlocShowDetail>().endShow();
              },
              child: const CircleAvatar(
                radius: 15,
                backgroundColor: MyColors.red,
                child: Icon(Icons.close, color: MyColors.white,))),
          )
        ],
      ),
    );
  }
}
