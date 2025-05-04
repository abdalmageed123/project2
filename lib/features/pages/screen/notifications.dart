import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project2/features/pages/widget/notificationtitle.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  final List<Map<String, String>> notifications = const [
    {
      'title': 'تم حجز درس جديد',
      'body': 'تم حجز درس مادة الرياضيات مع الطالب محمد.',
      'date': 'اليوم، 11:00 ص',
    },
    {
      'title': 'تم تعديل وقت الدرس',
      'body': 'تم تغيير وقت درس العلوم إلى الساعة 6:00 م.',
      'date': 'أمس، 9:30 م',
    },
    {
      'title': 'تم إلغاء الحجز',
      'body': 'قام الطالب سلمان بإلغاء درس اللغة الإنجليزية.',
      'date': 'الإثنين، 5:00 م',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff7f6fb),
      body: SafeArea(
        child: Column(
          children: [
            // رأس الصفحة
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 24.w), // مساحة وهمية
                  Text(
                    'الاشعارات',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_forward_ios, size: 20.sp),
                  ),
                ],
              ),
            ),

            // قائمة الإشعارات
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(20.w),
                itemCount: notifications.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final notif = notifications[index];
                  return notificationTile(
                    title: notif['title']!,
                    body: notif['body']!,
                    date: notif['date']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
