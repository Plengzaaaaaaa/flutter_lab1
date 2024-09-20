import 'package:flutter/material.dart';
import 'package:flutter_lab1/HomePage.dart';
import 'package:flutter_lab1/models/user_model.dart';
import 'package:flutter_lab1/pages/AdminPage.dart';
import 'package:flutter_lab1/pages/UserPage.dart';
import 'package:provider/provider.dart';
import '../controllers/auth_service.dart';
import 'providers/user_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController =
      TextEditingController(text: "P123456");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");

  void _login() async {
    if (_formKey.currentState!.validate()) {
      final username = usernameController.text;
      final password = passwordController.text;
      // คุณสามารถทำสิ่งต่าง ๆ กับข้อมูลที่ได้รับ เช่น การตรวจสอบข้อมูล
      print('Username: $username, Password: $password');

      try {
        final result = await AuthService().login(username, password);

        if (result['success']) {
          UserModel authResponse = result['message'];

          // call onLogin () in Provider
          if (!mounted) return;
          Provider.of<UserProvider>(context,
                  listen: false) //ไม่ให้ต้องรีบิ้วหน้าใหม่ตลอด
              .onLogin(authResponse);

          print('Login successful. Welcome, ${authResponse.user.name}');
          print('Access Token: ${authResponse.accessToken}');
          print('Refresh Token: ${authResponse.refreshToken}');
          print('Role: ${authResponse.role}');

          if (authResponse.role == "admin") {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AdminPage()),
            );
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserPage()),
            );
          }
        } else {
          // หากล็อกอินไม่สำเร็จ แสดงข้อความแจ้งเตือน
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Login failed. Please try again.')),
          );
        }
      } catch (err) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับ AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _login,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับปุ่ม
                  textStyle: TextStyle(
                      color: Colors.black), // ตั้งค่าสีตัวอักษรเป็นสีดำ
                ),
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
