import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // 在 _CalendarPageState 类中添加一个 List 来保存日程数据
  List<Map<String, dynamic>> events = [];
  TextEditingController eventNameController = TextEditingController();
  TextEditingController noteController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('日程计划'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
          ),
          // 添加日程按钮
          ElevatedButton(
            onPressed: () {
              // 弹出对话框或导航到添加日程页面
              _showAddEventDialog(context);
            },
            child: const Text('添加日程'),
          ),
          // TODO: 在此处展示已添加的日程列表
          // 日程列表部分
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                final event = events[index];
                return ListTile(
                  title: Text(event['eventName']),
                  subtitle: Text(event['note']),
                );
              },
            ),
          )
        ],
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

  void _addEventToCalendar() {
    // 从文本框中获取输入的日程名称和备注
    String eventName = eventNameController.text;
    String note = noteController.text;

    // 将新的日程数据添加到 events 列表中
    events.add({
      'date': _selectedDay, // 使用 _selectedDay 作为日期
      'eventName': eventName, // 使用从文本框获取的日程名称
      'note': note, // 使用从文本框获取的备注
    });
    // 清空文本框
    eventNameController.clear();
    noteController.clear();
    // 刷新UI以显示新的日程数据
    setState(() {});
  }


  // 弹出添加日程对话框
  void _showAddEventDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('添加日程'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextField(
                  controller: eventNameController,
                  decoration: const InputDecoration(labelText: '日程名称'),
                  // 处理日程名称输入
                ),
                TextField(
                  controller: noteController,
                  decoration: const InputDecoration(labelText: '备注'),
                  // 处理备注输入
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // 处理取消按钮点击事件
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // 处理确定按钮点击事件
                // 这里可以添加日程到日历中
                _addEventToCalendar();
                Navigator.of(context).pop();
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }
}