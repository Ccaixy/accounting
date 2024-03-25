import 'package:flutter/material.dart';
import 'package:collection/collection.dart'; // 引入用于分组的包

// 原始记账数据
final List<Map<String, dynamic>> accountData = [
  {'date': '2024-03-03', 'item': '买菜', 'description': '在超市购买日常蔬菜', 'amount': -20},
  {'date': '2024-03-02', 'item': '学习', 'description': '购买在线课程资料费用', 'amount': -20},
  {'date': '2024-03-01', 'item': '就餐', 'description': '与朋友聚餐消费', 'amount': -300},
  {'date': '2024-03-01', 'item': '购物', 'description': '购买生活日用品', 'amount': -20},
];


// 图标和描述映射表
final Map<String, IconData> iconMap = {
  '买菜': Icons.shopping_cart,
  '学习': Icons.school,
  '咖啡': Icons.coffee,
  '就餐': Icons.local_dining,
  '交通': Icons.train,
  '购物': Icons.local_grocery_store,
  '电影': Icons.movie_filter,
  '维修': Icons.home_repair_service,
  '手机费': Icons.phone_android,
  '其他': Icons.other_houses,
  // 添加可能存在的其他映射，比如：
  // '看病': Icons.medical_services,
  // '鸡蛋': Icons.fastfood, // 或者选择其他更合适的图标
};

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 对数据按日期分组
    final groupedList = groupBy(accountData, (entry) => entry['date']);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // 隐藏返回按钮
        title: Row(
          children: [
            // 左侧图标
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'images/home_icon.png', // 替换成您的图片路径
                width: 85, // 图片宽度
              ),
            ),
            // 中间搜索框
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: '',
                ),
                // 添加搜索框输入处理
              ),
            ),
            // 右侧搜索图标按钮和个人头像
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // 添加搜索按钮点击事件处理
                  },
                ),
                GestureDetector(
                  onTap: () {
                    // 添加个人头像点击事件处理
                    Navigator.pushNamed(context, '/profile'); // 导航到个人主页
                  },
                  child: const CircleAvatar(
                    radius: 20, // 头像大小
                    backgroundImage:
                        AssetImage('images/avatar.png'), // 替换成您的头像图片路径
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 上部分容器
              Row(
                children: [
                  // 左箭头按钮
                  const Spacer(),
                  IconButton(
                    padding: const EdgeInsets.all(25.0),
                    icon: const Icon(Icons.arrow_left),
                    onPressed: () {
                      // 处理向左箭头按钮点击事件
                    },
                  ),
                  // 日期选择器
                  Image.asset(
                    'images/data.png', // 替换成您的图片路径
                    width: 150,
                  ),
                  // 右箭头按钮
                  IconButton(
                    padding: const EdgeInsets.all(25.0),
                    icon: const Icon(Icons.arrow_right),
                    onPressed: () {
                      // 处理向右箭头按钮点击事件
                    },
                  ),
                  const Spacer(),
                ],
              ),
              //中间容器
              Container(
                width: 328,
                height: 94,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // 花费
                    Column(
                      children: [
                        Image.asset(
                          'images/expenses.png', // 替换为花费图片路径
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          '-2000支出',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                    // 平衡
                    Column(
                      children: [
                        Image.asset(
                          'images/balance.png', // 替换为平衡图片路径
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          '+200平衡',
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                    // 收入
                    Column(
                      children: [
                        Image.asset(
                          'images/income.png', // 替换为收入图片路径
                          width: 30,
                          height: 30,
                        ),
                        const Text(
                          '+2200收入',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // 下部分容器
              // 在 ListView.builder 中使用不同的数据
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 400,
                width: 328,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: groupedList.length,
                  itemBuilder: (context, index) {
                    final date = groupedList.keys.elementAt(index);
                    final dayRecords = groupedList[date] as List<Map<String, dynamic>>;

                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(
                              date,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 8.0, // 间距
                            runSpacing: 4.0, // 行间距
                            children: dayRecords.map((record) {
                              // 查找对应的图标
                              final IconData icon = iconMap[record['item'].toLowerCase()] ?? Icons.help;

                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(icon, size: 35), // 将Image替换成Icon
                                  SizedBox(width: 8),
                                  Expanded(
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(record['description']),
                                        Text(
                                          '${record['amount']}',
                                          style: TextStyle(
                                            color: record['amount'] < 0
                                                ? Colors.red
                                                : Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          // 添加按钮
          Positioned(
            bottom: 30.0,
            left: (MediaQuery.of(context).size.width - 130) / 2, // 按钮居中显示
            child: SizedBox(
              width: 130,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/AddNew');
                },
                icon: const Icon(Icons.add, color: Colors.white), // 白色的加号图标
                label: const Text('添加', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // 按钮颜色为蓝色
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.report),
            label: '报道',
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
        currentIndex: 1, // 当前选中项，默认为0
        onTap: (int index) {
          // 在此处处理导航栏点击事件
        },
      ),
    );
  }
}
