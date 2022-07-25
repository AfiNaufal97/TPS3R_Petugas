import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/pages/section_main_page/maps_page.dart';
import 'package:petugas_tps3r/pages/section_main_page/notification_page.dart';
import '../bloc/bloc_page.dart';
import '../resources/string_resource.dart';
import '../utils/colors/colors_style.dart';
import '../utils/fonts/fonts_style.dart';
import '../widgets/atom/text_widget.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<BlocPage, int>(
        builder: (context, state) {
          switch (state) {
            case 0:
              return MapsPage();
            case 1:
              return NotificationPage() ;
            default:
              return NotificationPage();
          }
        },
      )),
      bottomNavigationBar: SizedBox(
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            GestureDetector(
              onTap: () {
                context.read<BlocPage>().maps();
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Icon(
                    Icons.location_on_sharp,
                    color: context.watch<BlocPage>().state == 0
                        ? MyColors.green
                        : MyColors.grey,
                  ),
                  TextWidget(
                    text: StringResource.textIconLocation,
                    style: FontsStyle.textSmall.copyWith(
                      fontSize: 10,
                      color: context.watch<BlocPage>().state == 0
                          ? MyColors.green
                          : MyColors.grey,
                    ),
                  )
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     context.read<BlocPage>().notif();
            //   },
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       const SizedBox(
            //         height: 3,
            //       ),
            //       Icon(
            //         Icons.notifications,
            //         color: context.watch<BlocPage>().state == 1
            //             ? MyColors.green
            //             : MyColors.grey,
            //       ),
            //       TextWidget(
            //         text: StringResource.textIconNotification,
            //         style: FontsStyle.textSmall.copyWith(
            //           fontSize: 10,
            //           color: context.watch<BlocPage>().state == 1
            //               ? MyColors.green
            //               : MyColors.grey,
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () {
                context.read<BlocPage>().message();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 3,
                  ),
                  Icon(
                    Icons.mail,
                    color: context.watch<BlocPage>().state == 1
                        ? MyColors.green
                        : MyColors.grey,
                  ),
                  TextWidget(
                    text: "Notification",
                    style: FontsStyle.textSmall.copyWith(
                      fontSize: 10,
                      color: context.watch<BlocPage>().state == 1
                          ? MyColors.green
                          : MyColors.grey,
                    ),
                  )
                ],
              ),
            )
          ])),
    );
  }
}
