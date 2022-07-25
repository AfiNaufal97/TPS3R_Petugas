import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/bloc/bloc_get_petugas_id.dart';
import 'package:petugas_tps3r/bloc/bloc_get_user.dart';
import 'package:petugas_tps3r/bloc/bloc_message.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_get_user_by_id_state.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_get_user_state.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_message_state.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';
import 'package:petugas_tps3r/widgets/moleculs/buble_chat_widget.dart';
import '../../utils/colors/colors_style.dart';
import '../../widgets/moleculs/header_widget.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BlocMessage>().message(FirebaseAuth.instance.currentUser!.uid);

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: SingleChildScrollView(child:  Column(
      children: [
        HeaderWidget(
          text: 'Pesan',
          function: () {},
          colorText: MyColors.green,
        ),
        BlocBuilder<BlocMessage, BlocMessageState>(builder: (context, state) {
            print('proses');
            if(state is BlocMessageStateSuccess){
              var msg = state.messageUser;
              var listId = state.messageUser.map((e) => e.from).toList();
              return SizedBox(
                    height: 100,
                    child: ListView.builder(
                        itemCount: msg.length,
                        itemBuilder: (context, index) {
                          context.watch()<BlocGetUser>().getUserById(listId[index]);
                          return BlocBuilder<BlocGetUser, BlocGetUserState>(
                            builder: (context, state) {
                            if(state is BlocGetUserStateSuccess){
                              return Column(
                                children: [
                                  Text(state.user.nama),
                                  Text(msg[index].text)
                                ],
                              );
                            }
                            return Container();
                          },);
                        },),
                  );
                }
                return Container(
                );
            }

        ,)
      ],
    ),));
  }
}
