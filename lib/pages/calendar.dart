import 'package:flutter/material.dart';


class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('date'),
      ),
      body: const Center(
        child: Text('date'),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: '日程计划',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '家',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '设置',
          ),
        ],
        currentIndex: 0, // 当前选中项，默认为0
        onTap: (int index) {
          // 在此处处理导航栏点击事件
        },
      ),
    );
  }
}

