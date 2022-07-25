import 'package:flutter/material.dart';
import 'package:petugas_tps3r/pages/chat_page.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';

import '../../resources/size_resource.dart';
import '../../resources/string_assets.dart';
import '../../resources/string_resource.dart';
import '../../utils/colors/colors_style.dart';
import '../../utils/routes/route_name.dart';
import '../../widgets/atom/text_widget.dart';
import '../../widgets/moleculs/header_widget.dart';
import '../../widgets/moleculs/list_widget.dart';
class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
    
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: MyColors.green
          ),
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Notification', style: FontsStyle.textMedium.copyWith(
                color: MyColors.white
              ),),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(SizeResource.padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListWidget(
                   function: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage()));
                   },
                  title: StringResource.textBapeling,
                  prefixWidget: const CircleAvatar(
                    radius: 20,
                    backgroundColor: MyColors.green,
                    backgroundImage: AssetImage(StringAssets.imgLogoWhite),
                  ),
                  desc: StringResource.textSelamatDatangBapeling,
                  suffix: TextWidget(text: StringResource.textDate),
                ),

              const SizedBox(
                height: SizeResource.marginM,
              ),
              ListWidget(
                    function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ChatPage()));
                    },
                  title: StringResource.textBapeling,
                  prefixWidget: const CircleAvatar(
                    radius: 20,
                    backgroundColor: MyColors.green,
                    backgroundImage: AssetImage(StringAssets.imgLogoWhite),
                  ),
                  desc: StringResource.textSelamatDatangBapeling,
                  suffix: TextWidget(text: StringResource.textDate),
                ),

            ],
          ),
        )
      ],
    );
  }
}
