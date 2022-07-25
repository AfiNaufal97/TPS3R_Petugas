// ignore_for_file: non_constant_identifier_names
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:petugas_tps3r/bloc/bloc_auth.dart';
import 'package:petugas_tps3r/bloc/bloc_user.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_auth_state.dart';
import 'package:petugas_tps3r/bloc/cubit/bloc_user_state.dart';
import 'package:petugas_tps3r/services/auth_service.dart';
import 'package:petugas_tps3r/utils/fonts/fonts_style.dart';
import 'package:petugas_tps3r/utils/routes/route_name.dart';
import 'package:petugas_tps3r/widgets/moleculs/icon_text_widget.dart';

import '../../bloc/bloc_show_detail.dart';
import '../../bloc/cubit/bloc_show_detail_state.dart';
import '../../model/user.dart';
import '../../resources/size_resource.dart';
import '../../resources/string_resource.dart';
import '../../services/maps_service.dart';
import '../../utils/colors/colors_style.dart';
import '../../widgets/atom/edit_text_widget.dart';
import '../../widgets/moleculs/detail_location_widget.dart';
import '../bloc_side_menu.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  final Completer<GoogleMapController> _controller = Completer();
  TextEditingController controllerEdt = TextEditingController(text: '');
  double lat = -8.650000;
  double long = 115.216667;

  static const CameraPosition _start = CameraPosition(
    target: LatLng(-8.650000, 115.216667),
    zoom: 14.4746,
  );

  // ignore: unused_field
  static const CameraPosition _baliNesia = CameraPosition(
    target: LatLng(-8.650000, 115.216667),
    zoom: 14.4746,
  );

  Future<void> gotoBali() async {
    final GoogleMapController controller = await _controller.future;
    LatLng latLng = await MapsService().getLocation();
    setState(() {
      lat = latLng.latitude;
      long = latLng.longitude;
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(zoom: 14.0, target: latLng)));
  }


  @override
  void initState() {
    context.read<BlocUser>().getAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
        child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  context.read<BlocShowDetail>().endShow();
                },
                child: BlocConsumer<BlocUser, BlocUserState>(
                  builder: (context, state) {
                      if(state is BlocUserStateLoading){
                        return const Center(child: CircularProgressIndicator(),);
                      }else if(state is BlocUserStateSuccess){
                        return GoogleMap(
                          myLocationEnabled: true,
                          compassEnabled: false,
                          trafficEnabled: true,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          initialCameraPosition: _start,
                          markers: state.user.map((e) => Marker(markerId: MarkerId(e.id),
                              position: LatLng(double.parse(e.lat), double.parse(e.long)), infoWindow: InfoWindow(
                                title: e.nama,
                                onTap: (){
                                  context.read<BlocShowDetail>().showDetail(
                                      nameLoc: e.nama??"",
                                      noTelp: e.nohp??"",
                                    alamat: e.alamat
                                  );
                                },
                              ))).toList().toSet(),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        );
                      }
                      return Container();
                  },
                  listener:(context, state) {
                      if(state is BlocUserStateError){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                  },

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                        mini: true,
                        backgroundColor: MyColors.white.withOpacity(0.7),
                        onPressed: ()  {
                          context.read<BlocSideMenu>().show();
                        },
                        child: Image.asset('assets/assets/icon/menu.png', width: 20,)
                    ),
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: MyColors.white.withOpacity(0.7),
                      onPressed: () async {
                        await gotoBali();
                      },
                      child: const Icon(
                        Icons.my_location_rounded,
                        color: MyColors.black,
                      ),
                    ),
                  ],
                ),
              ),



            BlocBuilder<BlocSideMenu, int>(builder:(context, state) {
              if(state == 1){
                  return Container(
                    width: MediaQuery.of(context).size.width - 100,
                    decoration: BoxDecoration(
                      color: MyColors.white
                    ),
                    child: BlocBuilder<BlocAuth, BlocAuthState>(
                      builder: (context, state) {
                        if(state is BlocAuthStateSuccess){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 100,
                                decoration: BoxDecoration(
                                  color: MyColors.green
                                ),
                                child: Column(

                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: FloatingActionButton(
                                            mini: true,
                                            backgroundColor: MyColors.white.withOpacity(0.7),
                                            onPressed: ()  {
                                              context.read<BlocSideMenu>().hidden();
                                            },
                                            child: Icon(Icons.arrow_back, size: 25,)
                                        ),
                                      ),
                                    ),

                                    Image.asset('assets/assets/image/profile.png', width: 100,),
                                    Text(state.petugasModel.nama, style: FontsStyle.textSmallBlack.copyWith(
                                      fontSize: 18,
                                        color: MyColors.white
                                    ),),

                                    Text(state.petugasModel.role, style: FontsStyle.textSmallBlack.copyWith(
                                        color: MyColors.white
                                    ),), const SizedBox(height: 10,)
                                  ],
                                ),
                              ),

                              IconTextWidget(widget: Icon(Icons.person), text: 'Profile'),
                              IconTextWidget(widget: Icon(Icons.star), text: 'Rating'),
                              GestureDetector(
                                onTap: (){
                                  AuthService().logout();
                                  Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false);
                                },
                                child: IconTextWidget(widget: Icon(Icons.logout), text: 'Logout', style: FontsStyle.textSmallBlack.copyWith(
                                  color: MyColors.red
                                ),),
                              ),

                            ],
                          );
                        }

                        return Column(
                          children: [
                            FloatingActionButton(
                                mini: true,
                                backgroundColor: MyColors.white.withOpacity(0.7),
                                onPressed: ()  {
                                  context.read<BlocSideMenu>().hidden();
                                },
                                child: Icon(Icons.close, size: 25,)
                            ),

                            Image.asset('assets/assets/image/profile.png', width: 100,),
                            Text('')
                          ],
                        );
                      },

                    ),
                  );
              }
              return Container();
            }, ),




              BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
                builder: (context, state) {
                  if (state is StateInit) {
                    return Container();
                  }
                  return  Positioned(
                      left:  (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width-70)) / 2,
                      right:  (MediaQuery.of(context).size.width - (MediaQuery.of(context).size.width-70)) / 2,
                      bottom: 10
                      , child: DetailLocationWidget(
                  ));
                },
              ),

            ]));
  }
}


//
//   @override
//   Widget build(BuildContext context) {
//     // ignore: avoid_unnecessary_containers
//     return Container(
//         child: Stack(
//             children: [
//       GestureDetector(
//         onTap: () {
//           context.read<BlocShowDetail>().endShow();
//         },
//         child: GoogleMap(
//           myLocationEnabled: true,
//           trafficEnabled: true,
//           zoomControlsEnabled: false,
//           myLocationButtonEnabled: false,
//           initialCameraPosition: _start,
//           markers: markerList().toSet(),
//           onMapCreated: (GoogleMapController controller) {
//             _controller.complete(controller);
//           },
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             FloatingActionButton(
//               mini: true,
//               backgroundColor: MyColors.white.withOpacity(0.7),
//               onPressed: ()  {
//                 context.read<BlocSideMenu>().show();
//               },
//               child: Image.asset('assets/assets/icon/menu.png', width: 20,)
//             ),
//             FloatingActionButton(
//               mini: true,
//               backgroundColor: MyColors.white.withOpacity(0.7),
//               onPressed: () async {
//                 await gotoBali();
//               },
//               child: const Icon(
//                 Icons.my_location_rounded,
//                 color: MyColors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//      BlocBuilder<BlocSideMenu, int>(builder: (context, state) {
//         if(state == 1){
//           return Container(
//             width: MediaQuery.of(context).size.width - 100,
//             height: MediaQuery.of(context).size.height,
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               boxShadow:  [
//                 BoxShadow(
//                   color: MyColors.grey,
//                   blurRadius: 0.9,
//                   blurStyle: BlurStyle.outer,
//                   spreadRadius: 0.9
//                 )
//               ]
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 BlocBuilder<BlocAuth, BlocAuthState>(builder: (context, state) {
//                       if(state is BlocAuthStateSuccess){
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               decoration:  BoxDecoration(color: MyColors.green.withOpacity(0.7)),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                 Padding(
//                                   padding: const EdgeInsets.all(10),
//                                   child: FloatingActionButton(
//                                       mini: true,
//                                       backgroundColor: MyColors.white.withOpacity(0.7),
//                                       onPressed: ()  {
//                                         context.read<BlocSideMenu>().hidden();
//                                       },
//                                       child: const Icon(Icons.close, size: 30, color: MyColors.black,)
//                                   ),
//                                 ),
//
//                                 Center(
//                                   child: Column(
//                                     children: [
//                                       Image.asset('assets/assets/image/profile.png',width: 100,),
//                                     const SizedBox(height: 10,),
//                                     Wrap(
//                                       direction: Axis.horizontal,
//                                       children: [Text(state.petugasModel.nama, style: FontsStyle.textMedium.copyWith(
//                                           fontSize: 20,
//                                           fontWeight: FontWeight.w700,
//                                         color: MyColors.white
//                                       ),)],
//                                     ),
//                                     Text(state.petugasModel.role,  style: FontsStyle.textMedium.copyWith(
//                                         fontSize: 12,
//                                         fontWeight: FontWeight.w700, color: MyColors.white
//                                     )),
//                                       const SizedBox(height: 10,),
//                                   ],),
//                                 )
//                               ],),
//                             ),
//                             IconTextWidget(
//                                 marginIcon: 30,
//                                 widget: const Icon(Icons.person, size: 30,), text: 'Data Profile', style: FontsStyle.textMedium,),
//                             IconTextWidget(
//                               marginIcon: 30,
//                               widget: const Icon(Icons.history, size: 30,), text: 'Riwayat Angkut', style: FontsStyle.textMedium,),
//                             IconTextWidget(
//                               marginIcon: 30,
//                               widget: const Icon(Icons.star, size: 30,), text: 'Penilaian', style: FontsStyle.textMedium,),
//                             IconTextWidget(
//                               marginIcon: 30,
//                               widget: const Icon(Icons.broadcast_on_home, size: 30,), text: 'broadcast', style: FontsStyle.textMedium,),
//
//                             IconTextWidget(
//                               marginIcon: 30,
//                               widget: Image.asset('assets/assets/icon/broadcast.png', width: 30,), text: 'Logout', style: FontsStyle.textMedium.copyWith(
//                               color: MyColors.red
//                             ),),
//
//
//
//                           ],
//                         );
//                       }
//
//                       return Container();
//                 },)
//             ],),
//           );
//         }else{
//           return Container();
//         }
//      },),
//
//       BlocBuilder<BlocShowDetail, BlocShowDetailSstate>(
//         builder: (context, state) {
//           if (state is StateInit) {
//             return Container();
//           }
//           return const Positioned(bottom: 10, child: DetailLocationWidget());
//         },
//       ),
//
//     ]));
//   }
// }
