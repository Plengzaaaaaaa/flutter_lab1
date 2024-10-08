import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_lab1/controllers/admin_controller.dart';
import 'package:flutter_lab1/pages/admin/modules/admininfo.dart';
import 'package:flutter_lab1/pages/admin/modules/product/index.dart';
import 'package:flutter_lab1/pages/admin/modules/product/insert.dart';


class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  // เก็บ index ของแท็บที่เลือก
  late AdminPageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AdminPageController(); // Initialize the controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
        backgroundColor: Colors.yellow, // ตั้งค่าสีเหลืองให้กับ AppBar
      ),
      body: IndexedStack(
        index: _controller.selectedIndex, // แสดงหน้าที่เลือกตามแท็บ
        children: const [
          UserInfoTab(),
          ProductTab(),
          AddProductPage(),
        ],
      ),
      backgroundColor: Colors.grey[200], // ตั้งค่าพื้นหลังของหน้าเป็นสีเทาอ่อน
bottomNavigationBar: ConvexAppBar(
  style: TabStyle.react,
  backgroundColor: Colors.yellow,
  activeColor: Colors.black, // Color for the active tab
  color: Colors.black, // Color for inactive tabs (icon color)
  items: const [
    TabItem(icon: Icons.person, title: 'ข้อมูลผู้ใช้'),
    TabItem(icon: Icons.shopping_cart, title: 'สินค้า'),
    TabItem(icon: Icons.settings, title: 'ตั้งค่า'),
  ],
  initialActiveIndex: _controller.selectedIndex, // The initially selected tab
  onTap: (int i) {
    setState(() {
      _controller.updateIndex(i); // Update index through the controller
    });
  },
),

    );
  }
}
