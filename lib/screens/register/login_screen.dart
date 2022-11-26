import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import 'password_input.dart';
import 'register_screen.dart';
import 'text_button.dart';
import 'text_field.dart';

class LoginPage extends StatefulWidget {
  static const id = 'login';

  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  final emailCnt = TextEditingController();
  final passCnt = TextEditingController();
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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: const BoxDecoration(color: mainBlue),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        fit: FlexFit.loose,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              textAlign: TextAlign.center,
                              "Xush kelibsiz!",
                              style: cardHeaderText,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              textAlign: TextAlign.center,
                              "Xizmatlardan to'liq foydalanish uchun ro'yxatdan o'ting",
                              style: bodyTextSmall,
                            ),
                            const SizedBox(
                              height: 60,
                            ),
                            AuthTextField(
                              hintText: 'Email yoki akkaunt nomi',
                              inputType: TextInputType.text,
                              fieldCnt: emailCnt,
                            ),
                            MyPasswordField(
                              isPasswordVisible: isPasswordVisible,
                              passCnt: passCnt,
                              onTap: () {
                                setState(() {
                                  isPasswordVisible = !isPasswordVisible;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Akkauntingiz yo'qmi?   ",
                            style: bodyText,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, RegisterPage.id);
                            },
                            child: Text(
                              'Ro\'yxatdan o\'tish',
                              style: bodyText.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextButton(
                        buttonName: 'Kirish',
                        onTap: () {},
                        bgColor: Colors.white,
                        textColor: Colors.black87,
                      ),
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
