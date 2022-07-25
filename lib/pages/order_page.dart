import 'package:flutter/material.dart';

import '../resources/string_resource.dart';
import '../utils/colors/colors_style.dart';
import '../utils/routes/route_name.dart';
import '../widgets/atom/button_widget.dart';
import '../widgets/atom/warning_widget.dart';
import '../widgets/moleculs/header_widget.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            HeaderWidget(
                text: StringResource.orderPageTitle,
                colorText: MyColors.green,
                function: () {}),
            const SizedBox(
              height: 20,
            ),
            WarningWidget(text: StringResource.textWarningForOrder),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              width: MediaQuery.of(context).size.width - 50,
              color: MyColors.green,
              textButton: StringResource.textJoin,
              function: () =>
                  Navigator.pushNamed(context, RoutesName.registerMemberPage),

              // Align(
              //   alignment: Alignment.topLeft,

              //   child: Padding(
              //     padding: const EdgeInsets.all(SizeResource.paddingHorizontal),
              //     child: TextWidget(text: StringResource.textHitoryJoin)))
            )
          ],
        ),
      ),
    );
  }
}
