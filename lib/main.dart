import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/bloc/bloc_auth.dart';
import 'package:petugas_tps3r/bloc/bloc_get_user.dart';
import 'package:petugas_tps3r/bloc/bloc_message.dart';
import 'package:petugas_tps3r/pages/bloc_side_menu.dart';
import 'package:petugas_tps3r/pages/edit_profile_page.dart';
import 'package:petugas_tps3r/pages/first_page.dart';
import 'package:petugas_tps3r/pages/location_page.dart';
import 'package:petugas_tps3r/pages/login_page.dart';
import 'package:petugas_tps3r/pages/main_page.dart';
import 'package:petugas_tps3r/pages/order_page.dart';
import 'package:petugas_tps3r/pages/register_member_page.dart';
import 'package:petugas_tps3r/pages/register_page.dart';
import 'package:petugas_tps3r/pages/tracking_page.dart';
import 'package:petugas_tps3r/utils/routes/route_name.dart';

import 'bloc/bloc_add_image.dart';
import 'bloc/bloc_page.dart';
import 'bloc/bloc_show_detail.dart';
import 'bloc/bloc_user.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'SecondaryApp',
      options: const FirebaseOptions(
          appId: '1:155123729462:android:19702a87723e085119c497',
          apiKey: 'AIzaSyDF3B20IHdcSUfbK5RYsV_VGT03WMC6u2A',
          messagingSenderId: '155123729462',
          projectId: 'tps3r-32948'
      )
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BlocPage()),
        BlocProvider(create: (context) => BlocAddImage()),
        BlocProvider(create: (context) => BlocShowDetail()),
        BlocProvider(create: (context) => BlocAuth()),
        BlocProvider(create: (context) => BlocSideMenu()),
        BlocProvider(create: (context) => BlocUser()),
        BlocProvider(create: (context) => BlocMessage()),
        BlocProvider(create: (context) => BlocGetUser())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.first,
        routes: {
          RoutesName.login: (context) => LoginPage(),
          RoutesName.register: (context) => RegisterPage(),
          RoutesName.profileEdit: (context) => const EditProfilePage(),
          RoutesName.locationPage: (context) => const LocationPage(),
          RoutesName.mainPage: (context) => const MainPage(),
          RoutesName.trackingPage: (context) => const TrackingPage(),
          RoutesName.orderPage: (context) => OrderPage(),
          RoutesName.registerMemberPage: (context) => RegisterMember(),
          RoutesName.first: (context) => FirstPage(),
        },
      ),
    );
  }
}

