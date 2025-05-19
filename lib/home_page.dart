import 'package:flutter/material.dart';

import 'package:smart_education/taskpost_page.dart';
import 'package:smart_education/chitchat_page.dart';
import 'package:smart_education/friends_page.dart';
import 'package:smart_education/gradeview_page.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      _buildMainContent(),
      const TaskpostPage(),
      const ChitchatPage(),
      const GradeviewPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: _buildDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: _pages[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: _buildCustomBottomNavigationBar(),
      extendBody: true,
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF86A3BE),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF86A3BE).withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(40)),
                child: const Icon(Icons.menu, color: Color(0xFF86A3BE)),
              ),
            ),
            Row(children: [
              Image.asset('assets/logo.png', height: 30),
              const SizedBox(width: 8),
              const Text(
                'Smart Education',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ]),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(40)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.asset('assets/profile.png', fit: BoxFit.cover),
              ),
            ),
          ]),
          const SizedBox(height: 15),
          Text(
            'Hello, ${widget.username}!',
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 5),
          Text(
            'Selamat datang di Smart Education!',
            style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2))
              ],
            ),
            child: Row(
              children: const [
                Icon(Icons.search, color: Color(0xFF86A3BE)),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Cari materi, tugas, atau teman...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          _buildFeatureCard(
            title: 'Taskpost',
            icon: Icons.assignment,
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.withOpacity(0.1),
            description: 'Upload dan kelola tugas Anda',
            onTap: () => setState(() => _selectedIndex = 1),
          ),
          _buildFeatureCard(
            title: 'Chitchat',
            icon: Icons.chat_bubble,
            iconColor: Colors.red,
            iconBgColor: Colors.red.withOpacity(0.1),
            description: 'Diskusi dengan teman sekelas',
            onTap: () => setState(() => _selectedIndex = 2),
          ),
          _buildFeatureCard(
            title: 'Friends',
            icon: Icons.people,
            iconColor: Colors.green,
            iconBgColor: Colors.green.withOpacity(0.1),
            description: 'Terhubung dengan teman sekolah',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const FriendsPage()),
            ),
          ),
          _buildFeatureCard(
            title: 'Gradeview',
            icon: Icons.trending_up,
            iconColor: Colors.amber,
            iconBgColor: Colors.amber.withOpacity(0.1),
            description: 'Lihat ranking kelas 7-9',
            onTap: () => setState(() => _selectedIndex = 3),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard({
    required String title,
    required IconData icon,
    required Color iconColor,
    required Color iconBgColor,
    required String description,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: iconBgColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 30),
              ),
              const SizedBox(height: 12),
              Text(title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
              const SizedBox(height: 5),
              Text(description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 12, color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF86A3BE)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 40),
                const SizedBox(height: 10),
                const Text('Smart Education',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.png')),
                const SizedBox(height: 10),
                Text(widget.username,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text('Kelas 8A - SMP Negeri 1',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          _buildDrawerItem(Icons.person, 'Profil', true),
          _buildDrawerItem(Icons.settings, 'Pengaturan', false),
          _buildDrawerItem(Icons.calendar_today, 'Jadwal', false),
          _buildDrawerItem(Icons.emoji_events, 'Prestasi', false),
          _buildDrawerItem(Icons.help, 'Bantuan', false),
          _buildDrawerItem(Icons.logout, 'Keluar', false),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, bool isActive) {
    return ListTile(
      leading: Icon(icon,
          color: isActive ? const Color(0xFF86A3BE) : Colors.grey),
      title: Text(
        title,
        style: TextStyle(
            color: isActive ? const Color(0xFF86A3BE) : Colors.black87,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal),
      ),
      tileColor: isActive ? const Color(0xFF86A3BE).withOpacity(0.1) : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget _buildCustomBottomNavigationBar() {
    final List<Map<String, dynamic>> navItems = [
      {'icon': Icons.home_rounded, 'label': 'Beranda', 'activeColor': const Color(0xFF86A3BE)},
      {'icon': Icons.assignment_rounded, 'label': 'Tugas', 'activeColor': Colors.blue},
      {'icon': Icons.chat_bubble_rounded, 'label': 'Chat', 'activeColor': Colors.red},
      {'icon': Icons.trending_up_rounded, 'label': 'Rapot', 'activeColor': Colors.amber},
    ];

    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 15,
              offset: const Offset(0, 5)),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          return _buildNavItem(
            icon: item['icon'],
            label: item['label'],
            activeColor: item['activeColor'],
            isSelected: _selectedIndex == index,
            onTap: () => setState(() => _selectedIndex = index),
          );
        }),
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required Color activeColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isSelected ? 130 : 50,
        height: 45,
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 15 : 10),
        decoration: BoxDecoration(
          color: isSelected ? activeColor.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment:
              isSelected ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? activeColor : Colors.grey,
                size: isSelected ? 26 : 24),
            if (isSelected)
              ...[
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                        color: activeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ]
          ],
        ),
      ),
    );
  }
}
