import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/components/rounded_button.dart';
import 'package:universe_store/app/components/rounded_text_field.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_store.dart';
import 'package:universe_store/app/modules/sign_up/sign_up_state.dart';
import 'package:universe_store/app/modules/sign_up/sign_up_store.dart';
import 'package:universe_store/app/values/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final store = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ScopedBuilder<SignupStore, Exception, SignupState>(
        store: store,
        onState: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Create new  Account!',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    'Please fill in the form to continue',
                    style:
                        TextStyle(fontSize: 14, color: AppColors.secondaryText),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 42, bottom: 8),
                    child: RoundedTextField(
                      controller: state.fnController,
                      hintText: 'First name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: RoundedTextField(
                      controller: state.lnController,
                      hintText: 'Last name',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: RoundedTextField(
                      controller: state.emailController,
                      hintText: 'Email Address',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      hintText: 'Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      password: true,
                      hintText: 'Confirm Password',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child:
                        RoundedButton(onPress: store.signUp, label: 'Sign Up'),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 8),
                  //   child: RoundedButton(
                  //       onPress: () {}, label: 'Sign In with Google'),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('You already have an account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: AppColors.primaryButton),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        onError: (context, error) => Center(child: Text(error.toString())),
        onLoading: (context) =>
            const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
