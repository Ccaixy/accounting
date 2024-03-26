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

  get today => DateTime.now();

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
              childAspectRatio: 1 / 1, // 根据需求调整宽高比
            ),
            itemCount: iconsAndDescriptions.length,
            itemBuilder: (BuildContext context, int index) {
              final item = iconsAndDescriptions[index];
              return Padding(
                padding: const EdgeInsets.all(2),// 调整间距
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(item['icon'], size: 20), // 调整图标大小
                    const SizedBox(height: 1),// 调整间距
                    Text(item['text'], style: const TextStyle(fontSize: 15),                    ), // 调整字体大小
                  ],
                ),
              );
            },

          ),


          Padding(
            padding: const EdgeInsets.all(16.0),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,// 调整文本对齐方式
              children: [
                // 日期输入框
                //调整输入框宽度
                const TextField(

                  decoration: InputDecoration(
                    labelText: '日期',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
                const SizedBox(height: 1),

                // 类型
                const TextField(
                  decoration: InputDecoration(
                    labelText: '请选择类型',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 1),


                // 备注输入框
                const TextField(
                  decoration: InputDecoration(
                    labelText: '备注',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: null,
                ),
                const SizedBox(height: 1),

                // 金额输入框
                const TextField(
                  decoration: InputDecoration(
                    labelText: '请输入金额',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 1),


                ElevatedButton(
                  onPressed: () {
                    // 添加新数据到数据库
                    Navigator.pop(context);
                  },
                  // 移除const关键字
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: const Text(
                    "添加",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   alignment: Alignment.center,
          //   padding: const EdgeInsets.all(16.0),
          //   child: const Text('此处将展示收入相关信息', style: TextStyle(fontSize: 18)),
          // ),
          // 新增用于输入的容器组件



        ],
      ),
    );
  }
}
