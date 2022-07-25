import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:petugas_tps3r/bloc/bloc_auth.dart';
import '../utils/colors/colors_style.dart';
import '../utils/fonts/fonts_style.dart';
import '../utils/routes/route_name.dart';
import '../widgets/atom/button_widget.dart';
import '../widgets/atom/text_widget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1000), (){
      if(FirebaseAuth.instance.currentUser != null){
        context.read<BlocAuth>().getUserById(FirebaseAuth.instance.currentUser!.uid);
        Navigator.pushNamedAndRemoveUntil(context, RoutesName.mainPage, (route) => false);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/assets/image/logo.png',
                    width: 100,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/assets/image/logo.png',
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      TextWidget(
                        text:
                            'Hai, petugas TPS3R! Sudah siap jemput sampah hari ini ?',
                        style: FontsStyle.textMedium,
                      ),
                      TextWidget(
                          text: 'Yuk, masuk dan memulai aksi dari sekarang'),
                      const SizedBox(
                        height: 20,
                      ),
                      ButtonWidget(
                        textButton: 'Masuk',
                        function: ()=>Navigator.pushNamed(context, RoutesName.login),
                        color: MyColors.green,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                        textButton: 'Daftar',
                        function: () {},
                        color: MyColors.green,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        text:
                            'Klik untuk memulai mendaftar, lanjutkan atau cek status pendaftaran.',
                        style: FontsStyle.textSmall,
                      )
                    ],
                  ),
                  Center(
                    child: TextWidget(
                      text: 'Hak Cipta Dilindungi Diskominfos Bali',
                      style: FontsStyle.textSmall,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
