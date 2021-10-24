import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/auth/forget_password_page.dart';
import 'package:test_app_batch21/screens/auth/register_page.dart';
import 'package:test_app_batch21/widgets/buttons/custom_material_button.dart';
import 'package:test_app_batch21/widgets/buttons/custom_text_button.dart';
import 'package:test_app_batch21/widgets/inputs/email_text_form_field.dart';
import 'package:test_app_batch21/widgets/layout/background_image_widget.dart';
import 'package:test_app_batch21/widgets/layout/header_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  late TextEditingController _emailController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );

    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.linear)
          ..addListener(() => setState(() {}))
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });

    _animationController.forward();

    super.initState();
  }

  void _submitFormLogin() {
    final isValid = _loginFormKey.currentState!.validate();
    print('isValid $isValid');
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundImageWidget(animation: _animation),
            Container(
              padding: EdgeInsets.symmetric(horizontal: _size.width * 0.05),
              child: ListView(
                children: [
                  HeaderWidget(
                    headerTitle: 'Login',
                    headerSubTitle: 'Don\'t have an Account',
                    headerButtonTitle: 'Register',
                    pageRoute: RegisterPage(),
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        EmailTextFromField(),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return "Please Enter valid email";
                            } else {
                              return null;
                            }
                          },
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.02),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Passowrd',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: _size.height * 0.01),
                        CustomTextButton(
                          pageRoute: ForgetPasswordPage(),
                          text: 'Forget Password',
                        ),
                        SizedBox(height: _size.height * 0.05),
                        CustomMaterialButton(
                          onPressed: _submitFormLogin,
                          text: "login",
                          icon: Icons.login,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
