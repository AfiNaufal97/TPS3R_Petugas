import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/bloc/bloc_get_user.dart';
import 'package:petugas_tps3r/bloc/bloc_message.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_get_user_state.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_message_state.dart';
import 'package:petugas_tps3r/utils/colors/colors_style.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';
import 'package:petugas_tps3r/widgets/moleculs/header_widget.dart';
import 'package:url_launcher/url_launcher.dart';


class ChatPage extends StatelessWidget{
  String? name;
  String? noHp;

   ChatPage({Key? key, this.name = 'name', this.noHp = ''}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: MyColors.green
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: ()=>Navigator.pop(context),
                        child: Icon(Icons.arrow_back, color: MyColors.white,)),
                    const SizedBox(width: 16,),
                    Image.asset('assets/assets/image/profile.png', width: 30,),
                    const SizedBox(width: 10,),

                           Expanded(
                            child: Text(name ?? 'your name', maxLines: 1, overflow: TextOverflow.fade,style: FontsStyle.textSmallBlack.copyWith(
                                color: MyColors.white,
                                fontSize: 15
                            ),),
                          ),




                    GestureDetector(
                        onTap: ()async{
                          var no = Uri.parse('tel:$noHp');
                          await launchUrl(no);
                        },
                        child: Icon(Icons.phone, size: 25,color: MyColors.white,)),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            ),
            

            BlocBuilder<BlocMessage, BlocMessageState>(
              builder: (context, state) {
                if(state is BlocMessageStateSuccess){
                  return Text(state.messageUser[0].text);
                }
                return Container();
              },
            )

          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: TextFormField(
          maxLines: 3,
          minLines: 1,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.send),
            hintText: 'Message',
              border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(10),

            )
          ),
        ),
      ),
    );
  }

}