import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('cc')),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 上部分容器
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                height: 80.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                padding: const EdgeInsets.all(20.0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('花费'),
                    Text('平均'),
                    Text('收入'),
                  ],
                ),
              ),

              // 下部分容器
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                height: 400.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(title: Text('列表项 $index'));
                  },
                ),
              ),
            ],
          ),

          Positioned(
            top: 470.0,
            left: MediaQuery.of(context).size.width - 100.0,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/AddNew');
              },
              child: const Text('+ 添加', style: TextStyle(color: Colors.black)),
            ),
          ),
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