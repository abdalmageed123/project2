import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "سياسة الخصوصية",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              "نحن في أكاديميتي نحترم خصوصيتك وملتزمون بحماية بياناتك.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 12),
            Text(
              "1. لا نقوم بمشاركة معلوماتك الشخصية مع أي طرف ثالث دون إذنك.\n"
              "2. يتم استخدام البيانات فقط لتحسين جودة الخدمات التعليمية.\n"
              "3. نقوم بتأمين البيانات باستخدام أحدث تقنيات الحماية.\n"
              "4. لك الحق في طلب حذف بياناتك في أي وقت.\n"
              "5. باستخدامك للتطبيق، فإنك توافق على سياسة الخصوصية هذه.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}