import 'package:flutter/material.dart';

class RefundPolicyPage extends StatelessWidget {
  const RefundPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "سياسة الاسترداد",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              "نحن نحرص على رضاك الكامل عن خدماتنا، ولذلك نقدم سياسة استرداد واضحة وشفافة:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 12),
            Text(
              "1. يمكن استرداد المبلغ المدفوع في حال تم إلغاء الحصة قبل موعدها بـ 24 ساعة على الأقل.\n"
              "2. لا يمكن استرداد المبلغ في حال غياب الطالب عن الحصة دون إبلاغ مسبق.\n"
              "3. يتم معالجة طلبات الاسترداد خلال 3 إلى 5 أيام عمل.\n"
              "4. للاسترداد، يرجى التواصل مع فريق الدعم عبر التطبيق أو الواتساب.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}