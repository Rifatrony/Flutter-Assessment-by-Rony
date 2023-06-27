import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment_test_rony/utils/diamentions.dart';
import 'package:flutter_assessment_test_rony/view/movie_view.dart';
import 'package:flutter_assessment_test_rony/widgets/app_text_form.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();

  RegExp emailRegExp = RegExp(
    r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
  );
  final RegExp passwordRegExp = RegExp(r'^.{8,}$');

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final buttonFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                height: 50,
                width: 50,
                image: AssetImage(
                  "assets/images/img1.jpg",
                ),
              ),
              SizedBox(height: Diamentions.height15,),
              Text(
                "Log in to WebCommander",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Diamentions.font16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Diamentions.height10,
              ),
              Text(
                "A complete eCommerce platform",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Diamentions.font14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: Diamentions.height35,
              ),
              AppTextForm(
                controller: emailController,
                currentFocus: emailFocusNode,
                nextFocus: passwordFocusNode,
                emptyMessage: "Please enter an email address",
                validationErrorMessage: "Please enter a valid email address",
                exception: emailRegExp,
                myLabel: "Email",
              ),
              AppTextForm(
                controller: passwordController,
                currentFocus: passwordFocusNode,
                isObscure: true,
                nextFocus: buttonFocusNode,
                emptyMessage: "Please enter a password",
                validationErrorMessage:
                    "Password must be at least 8 characters long",
                exception: passwordRegExp,
                myLabel: "Password",
              ),
              SizedBox(
                height: Diamentions.height15,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: Diamentions.widtht10,
                  right: Diamentions.widtht10,
                  top: Diamentions.height15,
                ),
                width: double
                    .infinity, // Set width to take up full available width
                height: 45, // Set desired height
                child: ElevatedButton(
                  focusNode: buttonFocusNode,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MovieView()));
                    } else {
                      if (kDebugMode) {
                        print("Error");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      // Customize button style if needed
                      ),
                  child: const Text('Login'),
                ),
              ),
              SizedBox(
                height: Diamentions.height15,
              ),
              Text(
                "Forget Password?",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: Diamentions.font16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
