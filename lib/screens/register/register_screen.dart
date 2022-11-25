import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import 'login_screen.dart';
import 'password_input.dart';
import 'text_button.dart';
import 'text_field.dart';

class RegisterPage extends StatefulWidget {
  static const id = 'register';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameCnt = TextEditingController();
  final emailCnt = TextEditingController();
  final passCnt = TextEditingController();
  bool _toggleValue = true;
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainBlue,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: const BoxDecoration(color: mainBlue),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              textAlign: TextAlign.center,
                              "Ro'yxatdan o'tish",
                              style: headText,
                            ),
                            const Text(
                              textAlign: TextAlign.center,
                              "Yangi akkaunt yarating",
                              style: bodyTextSmall,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            AuthTextField(
                              hintText: 'Name',
                              inputType: TextInputType.name,
                              fieldCnt: usernameCnt,
                            ),
                            AuthTextField(
                              hintText: 'Email',
                              inputType: TextInputType.emailAddress,
                              fieldCnt: emailCnt,
                            ),
                            MyPasswordField(
                              isPasswordVisible: passwordVisibility,
                              passCnt: passCnt,
                              onTap: () {
                                setState(() {
                                  passwordVisibility = !passwordVisibility;
                                });
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Switch(
                                      value: _toggleValue,
                                      onChanged: ((value) {
                                        setState(() {
                                          _toggleValue = value;
                                        });
                                      })),
                                  Text(
                                    _toggleValue
                                        ? 'Maydon egasi'
                                        : 'Foydalanuvchi',
                                    style: buttonText.copyWith(
                                        color: Colors.white, fontSize: 24),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Akkauntingiz mavjudmi?   ",
                            style: bodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, LoginPage.id);
                            },
                            child: Text(
                              "Kirish",
                              style: bodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextButton(
                        buttonName: 'Ro\'yxatdan o\'tish',
                        onTap: () {},
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
