import 'package:enently/core/validators/feilds/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: Padding(
      padding:   REdgeInsets.all(24.0),
      child: Column(
        children: 
        
        [
          CustomTextField(),
          SizedBox(height: 30.h,),
          CustomTextField(),
            SizedBox(height: 30.h,),
            ElevatedButton(onPressed: (){


              
            }, child: Text('Add'))
        ],
      ),
    ),);
  }
}