import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              // 上部分容器
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
                          '-2000花费',
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
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 400,
                // 设置一个固定的高度
                width: 328,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.builder(
                  itemCount: 10, // 假设有10天的记账信息
                  itemBuilder: (context, index) {
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
                          Text(
                            '2024-03-${index + 1}', // 假设日期格式为YYYY-MM-DD
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          // 假设这里是该日期的记账信息列表
                          const Text('记账信息1'),
                          const Text('记账信息2'),
                          const Text('记账信息3'),
                          // 以此类推，显示当天的所有记账信息
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
