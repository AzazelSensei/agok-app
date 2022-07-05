// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore, no_leading_underscores_for_local_identifiers

import 'package:agok_app/core/init/router/app_router.dart';
import 'package:agok_app/core/utils/toast.dart';
import 'package:agok_app/features/login/bloc/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:getwidget/getwidget.dart';
import 'package:rive/rive.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool _visible = true;

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SlidingUpPanel(
          body: Stack(
            children: const [
              RiveAnimation.asset(
                'assets/imgs/3d_raster_test.riv',
                fit: BoxFit.cover,
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 310),
                  child: AnimatedText(),
                ),
              )
            ],
          ),
          maxHeight: 700.0,
          minHeight: 70.0,
          panel: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Pull up tab
              AnimatedOpacity(
                // ignore: dead_code
                opacity: _visible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withAlpha(200),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 170.0,
                      height: 12.0,
                    ),
                  ),
                ),
              ),

              //Panel code
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoaded) {
                    context.router.pushAndPopUntil(
                      const HomeRoute(),
                      predicate: (route) => false,
                    );

                    toastMessage(
                      mess:
                          'Sayın ${state.user.name} ${state.user.surName} Hoş Geldiniz :)',
                      toastType: ToastType.success,
                    );
                  } else if (state is LoginError) {
                    toastMessage(
                      mess: 'Error: ${state.errorMessage}',
                      toastType: ToastType.error,
                    );
                  }
                },
                builder: (context, state) {
                  return Container(
                      height: 675,
                      //panel Background
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(235),
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0)),
                      ),

                      //Main Layout Column
                      child: (state is LoginLoading)
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 50,
                                      ),

                                      const Text(
                                        "Giriş Yap",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 30),
                                      ),

                                      const SizedBox(
                                        height: 5,
                                      ),

                                      const Text(
                                        "Kullanıcı Adı veya Mail Adresiniz ile Giriş yapabilirsiniz. - admin/123456",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 17,
                                        ),
                                      ),

                                      const SizedBox(
                                        height: 40,
                                      ),

                                      //field
                                      const Text(
                                        "Kullanıcı Adı",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _controller,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: const InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Color.fromARGB(255, 30, 26, 26),
                                            hintText: " "),
                                      ),

                                      const SizedBox(
                                        height: 50,
                                      ),

                                      //Password
                                      const Text(
                                        "Şifre",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      TextField(
                                        controller: _controller2,
                                        obscureText: true,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                        decoration: const InputDecoration(
                                            filled: true,
                                            fillColor:
                                                Color.fromARGB(255, 30, 26, 26),
                                            hintText: ""),
                                      ),
                                      const Divider(
                                        height: 15,
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          "Şifremi Unuttum?",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: loginButton(context),
                                ),
                              ],
                            ));
                },
              ),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(70),
              blurRadius: 40,
            ),
          ],
          color: Colors.green.withAlpha(0),
          onPanelClosed: () {
            setState(() {
              _visible = false;
            });
          },
        ),
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    return GFButton(
        onPressed: () {
          context
              .read<LoginCubit>()
              .login(username: _controller.text, password: _controller2.text);
        },
        text: "Giriş Yap",
        textStyle: const TextStyle(
            color: Color.fromRGBO(240, 255, 255, 100),
            fontSize: 22,
            letterSpacing: 2,
            fontWeight: FontWeight.bold),
        size: 65,
        fullWidthButton: true,
        color: const Color.fromRGBO(255, 124, 23, 1));
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          'Sağlığınız İçin Aradığınız',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            // shadows: <Shadow> [
            //   Shadow(
            //     offset: Offset(3.0, 1.0),
            //     blurRadius: 5.0,
            //     color: Color.fromARGB(127, 0, 0, 0),
            //   ),
            // ],
          ),
          speed: const Duration(milliseconds: 75),
        ),
        TypewriterAnimatedText(
          'Her Şey Bu Uygulamada',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 100),
        ),
        TypewriterAnimatedText(
          'Kontrollü Sağlık',
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          speed: const Duration(milliseconds: 100),
        ),
      ],
      totalRepeatCount: 1,
    );
  }
}
