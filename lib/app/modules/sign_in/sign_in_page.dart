import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:universe_store/app/components/rounded_button.dart';
import 'package:universe_store/app/components/rounded_text_field.dart';
import 'package:universe_store/app/modules/sign_in/sign_in_store.dart';
import 'package:universe_store/app/values/colors.dart';

import 'sign_in_state.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final store = SignInStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: ScopedBuilder<SignInStore, Exception, SignInModel>(
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
                  Text(
                    'Welcome Back!',
                    style:
                        TextStyle(fontSize: 20, color: AppColors.secondaryText),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Please sign in to your \naccount',
                      style: TextStyle(
                          fontSize: 24,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 42, bottom: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      hintText: 'Username or phone',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedTextField(
                      controller: state.pwdController,
                      password: true,
                      hintText: 'Password',
                    ),
                  ),
                  TextButton(
                    onPressed: store.forgetPassword,
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(color: AppColors.primaryText),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child:
                        RoundedButton(onPress: store.signIn, label: 'Sign In'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: RoundedButton(
                        onPress: store.signInWithGoogle,
                        label: 'Sign In with Google'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {
                          print('Sign Up');
                        },
                        child: Text(
                          'Sign Up',
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
