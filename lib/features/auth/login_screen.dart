// import 'package:enently/core/services/firebase_sevices/auth_service.dart';
// import 'package:enently/core/utils/utils_ui/utils_ui_toast.dart';
// import 'package:enently/core/validators/feilds/custom_textfeild.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class LoginScreen extends HookWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final emailController = useTextEditingController();
//     final passwordController = useTextEditingController();
//     final isLoading = useState(false);

//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding: REdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             children: [
//               SizedBox(height: 60.h),

//               CustomTextField(controller: emailController, hintText: "Email"),

//               SizedBox(height: 20.h),

//               CustomTextField(
//                 controller: passwordController,
//                 hintText: "Password",
//                 obscureText: true,
//               ),

//               SizedBox(height: 40.h),

//               ElevatedButton(
//                 onPressed: isLoading.value
//                     ? null
//                     : () async {
//                         isLoading.value = true;

//                         final result = await AuthService.signUp(
//                           emailController.text.trim(),
//                           passwordController.text.trim(),
//                         );

//                         isLoading.value = false;

//                         switch (result) {
//                           case AuthResult.success:
//                             DialogUtils.showToastMessage(
//                               message: "Account created successfully",
//                               bgColor: Colors.green,
//                             );
//                             break;

//                           case AuthResult.weakPassword:
//                             DialogUtils.showToastMessage(
//                               message: "Weak password",
//                               bgColor: Colors.red,
//                             );
//                             break;

//                           case AuthResult.emailExists:
//                             DialogUtils.showToastMessage(
//                               message: "Email already exists",
//                               bgColor: Colors.red,
//                             );
//                             break;

//                           case AuthResult.invalidEmail:
//                             DialogUtils.showToastMessage(
//                               message: "Invalid email format",
//                               bgColor: Colors.red,
//                             );
//                             break;

                          
//                           default:
//                             DialogUtils.showToastMessage(
//                               message: "Something went wrong",
//                               bgColor: Colors.red,
//                             );
//                             break;
//                         }
//                       },

//                 child: isLoading.value
//                     ? const SizedBox(
//                         height: 20,
//                         width: 20,
//                         child: CircularProgressIndicator(strokeWidth: 2),
//                       )
//                     : const Text("Register"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
