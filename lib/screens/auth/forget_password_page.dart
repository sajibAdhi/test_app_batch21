import 'package:flutter/material.dart';
import 'package:test_app_batch21/screens/auth/login_page.dart';
import 'package:test_app_batch21/screens/widgets/buttons/custom_material_button.dart';
import 'package:test_app_batch21/screens/widgets/inputs/underline_input_border_colors.dart';
import 'package:test_app_batch21/screens/widgets/layout/background_image_widget.dart';
import 'package:test_app_batch21/screens/widgets/layout/header_widget.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  // ignore: unused_field
  late TextEditingController _emailController = TextEditingController(text: '');

  FocusNode _emailFocusNode = FocusNode();

  final _loginFormKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailFocusNode.dispose();

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

  // ignore: unused_element
  void _submitForm() {
    final isValid = _loginFormKey.currentState!.validate();
    print('isValid $isValid');
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
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
                    headerTitle: 'Forget Password',
                    headerSubTitle: '',
                    headerButtonTitle: '',
                    pageRoute: LoginPage(),
                  ),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email Address',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: _size.height * .01),
                        TextField(
                          controller: _emailController,
                          focusNode: _emailFocusNode,
                          textInputAction: TextInputAction.done,
                          onEditingComplete: _submitForm,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: UnderlineInputBorderColors.white,
                            focusedBorder: UnderlineInputBorderColors.white,
                          ),
                        ),
                        SizedBox(height: _size.height * .02),
                        CustomMaterialButton(
                          onPressed: _submitForm,
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
