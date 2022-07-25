import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc_auth.dart';
import '../bloc/cubit/bloc_auth_state.dart';
import '../resources/size_resource.dart';
import '../resources/string_resource.dart';
import '../utils/colors/colors_style.dart';
import '../utils/fonts/fonts_style.dart';
import '../utils/routes/route_name.dart';
import '../widgets/atom/button_widget.dart';
import '../widgets/atom/edit_text_widget.dart';
import '../widgets/atom/text_widget.dart';

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String noHp = '';
  String password = '';
  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: SizeResource.paddingHorizontal),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Image.asset(
                    'assets/assets/image/logo_green.png',
                    width: 110,
                  )),
                  TextWidget(
                    text: StringResource.titleRegister,
                    style: FontsStyle.textTitleOnboarding
                        .copyWith(color: MyColors.green, fontSize: 25),
                  ),
                  TextWidget(
                    text: StringResource.textRegister,
                    style:
                        FontsStyle.textRegular.copyWith(color: MyColors.green),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          EditTextWidget(
                              hint: StringResource.textInputName,
                              textTitleField: StringResource.textInputName,
                              validator: (valueIn) {
                                if (valueIn == null || valueIn.isEmpty) {
                                  return 'Please enter some text';
                                }
                                name = valueIn;
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          EditTextWidget(
                              hint: StringResource.hintEmail,
                              textTitleField: StringResource.titleFieldEmail,
                              validator: (valueIn) {
                                if (valueIn == null || valueIn.isEmpty) {
                                  return 'Please enter some text';
                                }
                                if (!valueIn.contains('@')) {
                                  return 'Email invalid';
                                }
                                email = valueIn;
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          // TextWidget(text: StringResource.titleGender),
                          // const RadioButtonWidget(),
                          // const SizedBox(
                          //   height: 16,
                          // ),
                          EditTextWidget(
                              hint: StringResource.hintPhone,
                              type: TextInputType.number,
                              textTitleField: StringResource.titleFieldPhone,
                              validator: (valueIn) {
                                if (valueIn == null || valueIn.isEmpty) {
                                  return 'Please enter some text';
                                }
                                noHp = valueIn;
                                return null;
                              }),
                          const SizedBox(
                            height: 16,
                          ),
                          EditTextWidget(
                              hint: StringResource.hintPassword,
                              cantRead: true,
                              textTitleField: StringResource.titleFieldPassword,
                              validator: (valueIn) {
                                if (valueIn == null || valueIn.isEmpty) {
                                  return 'Please enter some text';
                                }
                                password = valueIn;
                                return null;
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          TextWidget(
                            text: StringResource.textTerms,
                            style: FontsStyle.textSmall
                                .copyWith(color: MyColors.green),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          BlocConsumer<BlocAuth, BlocAuthState>(
                            builder: (context, state) {
                              if (state is BlocAuthStateLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                              return ButtonWidget(
                                textButton: StringResource.titleRegister,
                                color: MyColors.main,
                                function: () {
                                  if (_formKey.currentState!.validate()) {
                                    context
                                        .read<BlocAuth>()
                                        .registerPetugasWithEmailAndPassword(
                                            nama: name,
                                            password: password,
                                            email: email,
                                            noHp: noHp);
                                  }
                                },
                              );
                            },
                            listener: (context, state) {
                              if (state is BlocAuthStateError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(state.error)));
                              }
                              if (state is BlocAuthStateSuccess) {
                                Navigator.pushNamedAndRemoveUntil(context,
                                    RoutesName.mainPage, (route) => false);
                              }
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
