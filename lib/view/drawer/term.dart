import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "الشروط والأحكام",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              "باستخدامك لتطبيق أكاديميتي، فإنك توافق على الالتزام بالشروط التالية:",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 12),
            Text(
              "1. يُسمح باستخدام المنصة لأغراض تعليمية فقط، ويحظر استخدامها لأي نشاط غير قانوني.\n"
              "2. يتحمل كل من الطالب والمدرس المسؤولية الكاملة عن صحة المعلومات المتبادلة.\n"
              "3. يُمنع نشر أو تبادل أي محتوى مسيء أو غير لائق على المنصة.\n"
              "4. تحتفظ أكاديميتي بحقها في تعديل هذه الشروط في أي وقت دون إشعار مسبق.\n"
              "5. أي خرق للشروط قد يؤدي إلى إيقاف الحساب بشكل فوري.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}