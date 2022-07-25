import 'package:flutter/material.dart';
import 'package:petugas_tps3r/utils/colors/colors_style.dart';
import 'package:petugas_tps3r/widgets/atom/button_widget.dart';
import 'package:petugas_tps3r/widgets/atom/edit_text_widget.dart';
import 'package:petugas_tps3r/widgets/moleculs/header_widget.dart';

class BroadcastPage extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  String message = '';

  BroadcastPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(function: (){}, text: 'Broadcast Page', colorText: MyColors.green,),
          Column(
            children: [
              EditTextWidget(
                minLine: 5,
                hint: 'Broadcast Message', validator: (input){
                  if(input!.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error')));
                  }else{
                    message = input;
                    return null;
                  }

              }, textTitleField: 'Add Broadcast',),

              const SizedBox(height: 20,),
              ButtonWidget(textButton: 'Kirim', function:(){
                if(_formKey.currentState!.validate()){
                    //
                }
    })
            ],
          )
        ],
      ),
    );
  }
  
}