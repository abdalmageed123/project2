import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            Text(
              "منصة أكاديميتي",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 12),
            Text(
              "أكاديميتي هي منصة تعليمية رقمية انطلقت من سوريا بهدف مساعدة الطلاب في أداء واجباتهم، التحضير للامتحانات، وحجز دروس خصوصية أونلاين مع مدرسين معتمدين، بطريقة سهلة وآمنة.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 12),
            Text(
              "نحن نؤمن بقوة التعليم كوسيلة لتغيير المستقبل، ونوفر أدوات ذكية تعتمد على الذكاء الاصطناعي لتوصيل الطالب بالمدرس الأنسب له بسرعة وكفاءة.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 12),
            Text(
              "تهدف أكاديميتي لتكون الجسر الذي يربط بين الطالب والمدرس في العالم العربي، مع الحفاظ على أعلى معايير الجودة والثقة.",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}