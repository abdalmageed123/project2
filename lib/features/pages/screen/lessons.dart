import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LessonsScreen extends StatelessWidget {
  const LessonsScreen({super.key});

  final List<Map<String, String>> lessons = const [
    {
      'subject': 'رياضيات',
      'student': 'محمد أحمد',
      'date': 'الخميس 15 مايو 2025',
      'time': '4:00 م - 5:00 م',
      'status': 'مؤكد',
    },
    {
      'subject': 'علوم',
      'student': 'ليان خالد',
      'date': 'الأربعاء 14 مايو 2025',
      'time': '6:00 م - 7:00 م',
      'status': 'معلق',
    },
    {
      'subject': 'لغة إنجليزية',
      'student': 'سلمان ناصر',
      'date': 'الثلاثاء 13 مايو 2025',
      'time': '3:00 م - 4:00 م',
      'status': 'ملغي',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            // أزرار الفلاتر
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: [
                _filterButton('الدروس القادمة', selected: true),
                _filterButton('الحجوزات المعلقة'),
                _filterButton('جميع الدروس'),
                _filterButton('الدروس السابقة'),
              ],
            ),
            SizedBox(height: 20.h),

            // فلترة التاريخ
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month,
                          size: 16.sp, color: Colors.grey),
                      SizedBox(width: 5.w),
                      Text('آخر 3 شهور', style: TextStyle(fontSize: 12.sp)),
                    ],
                  ),
                ),
                Spacer(),
                Text('تاريخ الدروس من - إلى',
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ],
            ),
            SizedBox(height: 20.h),

            // قائمة الدروس
            Expanded(
              child: ListView.builder(
                itemCount: lessons.length,
                itemBuilder: (context, index) {
                  final lesson = lessons[index];
                  return _lessonCard(
                    subject: lesson['subject']!,
                    studentName: lesson['student']!,
                    date: lesson['date']!,
                    time: lesson['time']!,
                    status: lesson['status']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _filterButton(String label, {bool selected = false}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: selected ? Colors.green : Colors.grey.shade400, width: 1),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(fontSize: 13.sp)),
          if (selected) ...[
            SizedBox(width: 6.w),
            Icon(Icons.check_circle, color: Colors.green, size: 16.sp),
          ],
        ],
      ),
    );
  }

  Widget _lessonCard({
    required String subject,
    required String studentName,
    required String date,
    required String time,
    required String status,
  }) {
    Color statusColor;
    IconData statusIcon;

    switch (status) {
      case 'مؤكد':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'معلق':
        statusColor = Colors.orange;
        statusIcon = Icons.hourglass_top;
        break;
      case 'ملغي':
        statusColor = Colors.red;
        statusIcon = Icons.cancel;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help_outline;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.grey.shade50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subject,
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 6.h),
          Text('الطالب: $studentName', style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 6.h),
          Text('التاريخ: $date', style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 6.h),
          Text('الوقت: $time', style: TextStyle(fontSize: 14.sp)),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(statusIcon, color: statusColor, size: 18.sp),
              SizedBox(width: 5.w),
              Text('الحالة: $status',
                  style: TextStyle(fontSize: 14.sp, color: statusColor)),
            ],
          ),
        ],
      ),
    );
  }
}
