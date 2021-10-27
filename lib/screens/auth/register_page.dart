import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/auth/login_page.dart';
import 'package:test_app_batch21/screens/widgets/buttons/custom_material_button.dart';
import 'package:test_app_batch21/screens/widgets/inputs/email_text_form_field.dart';
import 'package:test_app_batch21/screens/widgets/inputs/name_text_form_field.dart';
import 'package:test_app_batch21/screens/widgets/inputs/password_text_form_field.dart';
import 'package:test_app_batch21/screens/widgets/layout/background_image_widget.dart';
import 'package:test_app_batch21/screens/widgets/layout/header_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  // ignore: unused_field
  late TextEditingController _fullNameController =
      TextEditingController(text: '');
  late TextEditingController _emailController = TextEditingController(text: '');
  late TextEditingController _passwordController =
      TextEditingController(text: '');
  late TextEditingController _designationController =
      TextEditingController(text: '');

  FocusNode _fullNameFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _designationFocusNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _designationFocusNode.dispose();

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
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animationController.reset();
              _animationController.forward();
            }
          });
    _animationController.forward();
    super.initState();
  }

  void _submitForm() {
    final isValid = _loginFormKey.currentState!.validate();
    if (isValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
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
                    headerTitle: 'Register',
                    headerSubTitle: 'Already Have an account.',
                    headerButtonTitle: 'Login',
                    pageRoute: LoginPage(),
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        NameTextFormField(
                          controller: _fullNameController,
                          focusNode: _fullNameFocusNode,
                          hintText: 'Full Name',
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_emailFocusNode),
                        ),
                        SizedBox(height: _size.height * 0.01),
                        EmailTextFormField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.next,
                          hintText: "Email",
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_passwordFocusNode),
                        ),
                        SizedBox(height: _size.height * 0.01),
                        PasswordTextFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocusNode,
                          hintText: 'Password',
                          textInputAction: TextInputAction.next,
                          onEditingComplete: () => FocusScope.of(context)
                              .requestFocus(_designationFocusNode),
                        ),
                        SizedBox(height: _size.height * 0.01),
                        NameTextFormField(
                          controller: _designationController,
                          focusNode: _designationFocusNode,
                          hintText: 'Designation',
                          onEditingComplete: _submitForm,
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: _size.height * 0.05),
                        CustomMaterialButton(
                          onPressed: () {},
                          text: 'Registrartion',
                          icon: Icons.login_sharp,
                        ),
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
