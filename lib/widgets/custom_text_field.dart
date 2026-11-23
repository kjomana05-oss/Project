import 'package:flutter/material.dart';

import '../utils/resources/app_color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      // نوع الكيبورد حسب الحقل (نص، أرقام، إيميل...)
      obscureText: isPassword,
      // إخفاء النص على هيئة نقاط في حالة الباسورد
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColor.blackColor,
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        // النص الإرشادي داخل الحقfilled: true,
        // تفعيل تلوين خلفية الحقل
        fillColor: Colors.transparent,
        // خلفية شفافة ليظهر ما خلفها
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        // مسافة داخلية مناسبة للشكل الكبسولي
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // استدارة قوية لإعطاء شكل كبسولي
          borderSide: BorderSide(
            color: AppColor.blackColor,
            width: 2,
          ), // حدود سوداء افتراضية
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // نفس الاستدارة في الوضع العادي
          borderSide: BorderSide(
            color: AppColor.blackColor,
            width: 2,
          ), // سمك الحد الأسود في الوضع العادي
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          // نفس الاستدارة عند الضغط والكتابة
          borderSide: BorderSide(
            color: AppColor.blackColor,
            width: 2,
          ), // زيادة سمك الحد عند التركيز على الحقل
        ),
      ),
    );
  }
}
