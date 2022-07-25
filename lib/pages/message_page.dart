import 'package:flutter/material.dart';

import '../utils/colors/colors_style.dart';
import '../utils/fonts/fonts_style.dart';
import '../widgets/atom/edit_text_widget.dart';
import '../widgets/atom/text_widget.dart';
import '../widgets/moleculs/header_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.main,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            HeaderWidget(
              function: () {},
              text: 'Pesan',
              colorText: MyColors.green,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: MyColors.white),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 50,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'alexa',
                          style: FontsStyle.textMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: MyColors.main,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: TextWidget(
                            text: 'Sampah Segera diambil',
                            style: FontsStyle.textRegular,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: EditTextWidget(
                              hint: 'Input',
                              validator: (input) {},
                              textTitleField: ''),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(Icons.send),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
