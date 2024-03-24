import 'package:flutter/material.dart';

final List<Map<String, dynamic>> iconsAndDescriptions = [
  {'icon': Icons.shopping_cart, 'text': '买菜'},
  {'icon': Icons.school, 'text': '学习'},
  {'icon': Icons.coffee, 'text': '咖啡'},
  {'icon': Icons.local_dining, 'text': '就餐'},
  {'icon': Icons.train, 'text': '交通'},
  {'icon': Icons.local_grocery_store, 'text': '购物'},
  {'icon': Icons.movie_filter, 'text': '电影'},
  {'icon': Icons.home_repair_service, 'text': '维修'},
  {'icon': Icons.phone_android, 'text': '手机费'},
  {'icon': Icons.other_houses, 'text': '其他'},
];

class AddNewPage extends StatefulWidget {
  const AddNewPage({super.key});

  @override
  _TransactionsPageState createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<AddNewPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(end: 16.0), // 右侧内边距
                child: TabBar(
                  controller: _tabController,
                  indicatorWeight: 2, // 调整indicator宽度以适应屏幕
                  tabs: const [
                    Tab(text: '支出'),
                    Tab(text: '收入'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, // 根据需求调整列数
              childAspectRatio: 1 / 1.5, // 根据需求调整宽高比
            ),
            itemCount: iconsAndDescriptions.length,
            itemBuilder: (BuildContext context, int index) {
              final item = iconsAndDescriptions[index];
              return Padding(
                padding: const EdgeInsets.all(25),// 调整间距
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 40), // 调整图标大小
                    const SizedBox(height: 1),// 调整间距
                    Text(item['text'], style: const TextStyle(fontSize: 10),                    ), // 调整字体大小
                  ],
                ),
              );
            },
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16.0),
            child: const Text('此处将展示收入相关信息', style: TextStyle(fontSize: 18)),
          ),

        ],
      ),
    );
  }
}
