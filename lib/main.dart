import 'package:code/pages/register.dart';
import 'package:code/pages/login.dart';
import 'package:code/pages/addNew.dart';
import 'package:code/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image with Button',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WelcomePage(),
      routes: {
        '/home': (context) => const MyHomePage(), // 定义路由规则
        '/AddNew': (context) => const AddNewPage(), // 定义路由规则'
        '/login': (context) => const LoginPage(), // 定义路由规则'
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset( // 加载assets中的图片
              'images/Kitty-Logo.png',
              width: 120, // 图片宽度
              height: 120, // 图片高度
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 136), // 添加一些间距
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // 跳转到下一个页面
              },
              child: const Text('登录', style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      )
    );
  }
}