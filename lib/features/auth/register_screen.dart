import 'package:enently/core/assets/app_images.dart';
import 'package:enently/core/model/user_model.dart';
import 'package:enently/core/services/firebase_sevices/auth_service.dart';
import 'package:enently/core/services/firebase_sevices/store_service.dart';
import 'package:enently/core/utils/utils_ui/utils_ui_toast.dart';
import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:enently/core/validators/validator.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends HookWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final nameController = useTextEditingController();
    final isLoading = useState(false);
    final keyy = useMemoized(() => GlobalKey<FormState>());
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
                  appLocalizations.create_your_account,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
              CustomTextField(
                validator: Validators.validateName,
                prefixIcon: Icon(Icons.person_2_outlined),
                controller: nameController,
                hintText: appLocalizations.enter_your_name,
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
                  onPressed: () {},
                  icon: Icon(Icons.visibility_outlined),
                ),
                obscureText: false,
              ),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 16),
                child: CustomTextField(
                  prefixIcon: Icon(Icons.lock_outline),
                  validator: Validators.validatePassword,
                  controller: confirmPasswordController,
                  hintText: appLocalizations.confirm_your_password,
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.visibility_outlined),
                  ),
                  obscureText: false,
                ),
              ),

              SizedBox(height: 50.h),

              ElevatedButton(
                onPressed: isLoading.value
                    ? null
                    : () async {
                        if (!keyy.currentState!.validate()) return;

                        try {
                          DialogUtils.showLoading(context, dismissible: false);

                          final userCredential = await AuthService.sigUP(
                            emailController.text.trim().toLowerCase(),
                            passwordController.text.trim(),
                          );

                          Navigator.pop(context);

                          if (userCredential == null) {
                            DialogUtils.showToastMessage(
                              message: "Registration failed",
                              bgColor: Colors.red,
                            );
                            return;
                          }

                          final uid = userCredential.user!.uid;

                          final userModel = UserModel(
                            id: uid,
                            email: emailController.text.trim(),
                            name: nameController.text.trim(),
                          );

                          await StoreService.addUser(userModel);

                          DialogUtils.showToastMessage(
                            message: "Account created successfully",
                            bgColor: Colors.green,
                          );
                        } catch (e) {
                          Navigator.pop(context);

                          DialogUtils.showToastMessage(
                            message: "Something went wrong",
                            bgColor: Colors.red,
                          );
                        }
                      },

                child: Text("Register"),
              ),
              Padding(
                padding: REdgeInsets.symmetric(vertical: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appLocalizations.already_have_an_account),
                    Text(
                      appLocalizations.login,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
