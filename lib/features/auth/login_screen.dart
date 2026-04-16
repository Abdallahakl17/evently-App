import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/assets/routes_const.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/services/firebase_sevices/auth_service.dart';
import 'package:enently/core/services/firebase_sevices/store_service.dart';
import 'package:enently/core/utils/utils_ui/buttons.dart';
import 'package:enently/core/utils/utils_ui/utils_ui_toast.dart';
import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:enently/core/validators/validator.dart';
import 'package:enently/features/widget/social_google_sections.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends HookWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoading = useState(false);
    final isSecure = useState(true);
    final keyy = useMemoized(() => GlobalKey<FormState>());
    Future<void> login(BuildContext context) async {
      if (!keyy.currentState!.validate()) return;

      try {
        isLoading.value = true;

        DialogUtils.showLoading(context, dismissible: false);

        final userCredential = await AuthService.signIn(
          emailController.text.trim().toLowerCase(),
          passwordController.text.trim(),
        );

        if (userCredential == null) {
          Navigator.pop(context);

          DialogUtils.showToastMessage(
            message: "Login failed",
            bgColor: Colors.red,
          );
          return;
        }

        final user = await StoreService.getUser(userCredential.user!.uid);

        if (user == null) {
          Navigator.pop(context);

          DialogUtils.showToastMessage(
            message: "User data not found",
            bgColor: Colors.red,
          );
          return;
        }

        Navigator.pop(context);

        DialogUtils.showToastMessage(
          message: "Login successful",
          bgColor: Colors.green,
        );

        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
      } catch (e) {
        Navigator.pop(context);

        DialogUtils.showToastMessage(
          message: "Something went wrong",
          bgColor: Colors.red,
        );
      } finally {
        isLoading.value = false;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(AppImages.titleIamge, fit: BoxFit.contain),
      ),
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: keyy,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: REdgeInsets.symmetric(vertical: 24),
                child: Text(
                  appLocalizations.login_to_your_account,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),

              Padding(
                padding: REdgeInsets.symmetric(vertical: 16),
                child: CustomTextField(
                  prefixIcon: Icon(Icons.email_outlined),
                  validator: Validators.validateEmail,
                  controller: emailController,
                  hintText: appLocalizations.enter_your_email,
                ),
              ),
              CustomTextField(
                prefixIcon: Icon(Icons.lock_outline),
                validator: Validators.validatePassword,
                controller: passwordController,
                hintText: appLocalizations.enter_your_password,
                suffixIcon: IconButton(
                  onPressed: () {
                    isSecure.value = !isSecure.value;
                  },
                  icon: Icon(
                    isSecure.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                obscureText: isSecure.value,
              ),

              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    appLocalizations.forget_password,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              SizedBox(height: 48.h),

              AppCustomButton(
                text: appLocalizations.login,

                onPressed: isLoading.value ? null : () => login(context),
              ),
              SizedBox(height: 48.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(appLocalizations.dont_have_an_account),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.register,
                      );
                    },
                    child: Text(
                      appLocalizations.sing_up,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              SocialLoginSection(onGoogleTap: () {  },)
            ],
          ),
        ),
      ),
    );
  }
}
