import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/utils/app_colors.dart';
import 'package:food_subs/view/auth/bloc/auth_event.dart';
import 'package:food_subs/view/auth/bloc/auth_state.dart';
import 'package:food_subs/view/auth/registration_screen.dart';
import 'package:food_subs/view/landing/landing_screen.dart';
import 'package:food_subs/view/widgets/custom_loader.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bloc/auth_bloc.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          } else if (state is AuthSuccess) {
            // Navigate to home screen
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LandingScreen()));
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const CustomLoader();
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            final email = emailController.text;
                            final password = passwordController.text;
                            BlocProvider.of<AuthBloc>(context).add(
                                LoginEvent(email: email, password: password));
                          },
                    child: state is AuthLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text('Login'),
                  ),
                  const SizedBox(height: 12),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have account?',
                          style: GoogleFonts.ptSans(fontSize: 14),
                        ),
                        TextSpan(
                          text: ' Register',
                          style: GoogleFonts.ptSans(
                              fontSize: 14, color: AppColors.primary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen())),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
