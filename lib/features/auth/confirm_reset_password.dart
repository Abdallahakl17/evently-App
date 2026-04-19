import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:enently/core/validators/validator.dart';
import 'package:enently/features/home/custom_arroe_back_button.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmResetPassword extends HookWidget {
  const ConfirmResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final emailController = useTextEditingController();
    final key = useMemoized(() => GlobalKey<FormState>());

    return Scaffold(
      appBar: AppBar(
        leading: CustomArrowBack(),

        title: Text(appLocalizations.reset_password),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(20.0),
          child: Form(
            key: key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(flex: 1),
                CustomTextField(
                  prefixIcon: Icon(Icons.email_outlined),
                  validator: Validators.validateEmail,
                  controller: emailController,
                  hintText: appLocalizations.enter_your_email,
                ),
                SizedBox(height: 40.h),
        
                ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) ;
                  },
                  child: Text(appLocalizations.reset_password),
                ),
                Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
