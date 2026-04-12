import 'package:enently/core/services/firebase_sevices/auth_service.dart';
import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends HookWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.symmetric(vertical: 24),
              child: CustomTextField(controller: emailController),
            ),
            Padding(
              padding: REdgeInsets.symmetric(vertical: 24),
              child: CustomTextField(controller: passwordController),
            ),
            ElevatedButton(
              onPressed: () {
                AuthService.signIn(
                  emailController.text,
                  passwordController.text,
                );
                isLoading.value = isLoading.value;
              },
              child: Text(isLoading.value ? "Loading..." : "Register"),
            ),
          ],
        ),
      ),
    );
  }
}
