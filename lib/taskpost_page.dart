import 'package:flutter/material.dart';

class TaskpostPage extends StatelessWidget {
  const TaskpostPage({Key? key}) : super(key: key);

  static const List<Map<String, dynamic>> tasks = [
    {
      'title': 'Tugas Matematika',
      'description': 'Kerjakan halaman 45-47',
      'deadline': '19 Mei 2025',
      'icon': Icons.calculate,
      'subject': 'Matematika',
      'progress': 0.0,
      'priority': 'Tinggi',
    },
    {
      'title': 'Bahasa Inggris',
      'description': 'Essay tentang liburanmu',
      'deadline': '20 Mei 2025',
      'icon': Icons.language,
      'subject': 'Bahasa Inggris',
      'progress': 0.3,
      'priority': 'Sedang',
    },
    {
      'title': 'IPA - Praktikum',
      'description': 'Laporan hasil eksperimen',
      'deadline': '21 Mei 2025',
      'icon': Icons.science,
      'subject': 'IPA',
      'progress': 0.7,
      'priority': 'Rendah',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(),
                    _buildTaskStatusTabs(),
                    _buildTasksList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Taskpost',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2D3748),
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Kelola tugas akademik Anda',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF718096),
                    ),
                  ),
                ],
              ),
              _buildTaskCompletionCircle(),
            ],
          ),
          const SizedBox(height: 30),
          _buildTaskOverview(),
        ],
      ),
    );
  }

  static Widget _buildTaskCompletionCircle() {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 55,
          width: 55,
          child: CircularProgressIndicator(
            value: 0.67,
            strokeWidth: 6,
            backgroundColor: Color(0xFFE2E8F0),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF86A3BE)),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              '67%',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF86A3BE),
              ),
            ),
            Text(
              'Selesai',
              style: TextStyle(
                fontSize: 10,
                color: Color(0xFF718096),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Widget _buildTaskOverview() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          _buildTaskStatCard(
            title: 'Belum Selesai',
            count: '3',
            color: Color(0xFFFEF5E7),
            textColor: Color(0xFFED8936),
            iconData: Icons.watch_later_outlined,
          ),
          _buildTaskStatCard(
            title: 'Dalam Proses',
            count: '2',
            color: Color(0xFFE6F6FF),
            textColor: Color(0xFF3182CE),
            iconData: Icons.autorenew_rounded,
          ),
          _buildTaskStatCard(
            title: 'Selesai',
            count: '6',
            color: Color(0xFFE6FFFA),
            textColor: Color(0xFF38B2AC),
            iconData: Icons.check_circle_outline,
          ),
        ],
      ),
    );
  }

  static Widget _buildTaskStatCard({
    required String title,
    required String count,
    required Color color,
    required Color textColor,
    required IconData iconData,
  }) {
    return Flexible(
      child: Container(
        height: 80,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: textColor, size: 26),
            const SizedBox(height: 6),
            Text(
              count,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: textColor.withOpacity(0.85),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskStatusTabs() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 14),
      child: Row(
        children: [
          _buildTaskTab(title: 'Semua', isActive: true),
          _buildTaskTab(title: 'Prioritas', isActive: false),
          _buildTaskTab(title: 'Terlambat', isActive: false),
        ],
      ),
    );
  }

  Widget _buildTaskTab({required String title, required bool isActive}) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 9),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF86A3BE) : Colors.transparent,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: isActive ? Colors.transparent : const Color(0xFFCBD5E0),
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.normal,
          color: isActive ? Colors.white : const Color(0xFF718096),
        ),
      ),
    );
  }

  Widget _buildTasksList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: tasks.map((task) => _buildTaskCard(task)).toList(),
      ),
    );
  }

  Widget _buildTaskCard(Map<String, dynamic> task) {
    Color priorityColor;
    switch (task['priority']) {
      case 'Tinggi':
        priorityColor = const Color(0xFFE53E3E);
        break;
      case 'Sedang':
        priorityColor = const Color(0xFFED8936);
        break;
      default:
        priorityColor = const Color(0xFF38B2AC);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: const Color(0xFF86A3BE).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    task['icon'],
                    color: const Color(0xFF86A3BE),
                    size: 26,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task['title'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D3748),
                        ),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        task['subject'],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF718096),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: priorityColor.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Text(
                    task['priority'],
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: priorityColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Text(
              task['description'],
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF4A5568),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_rounded,
                      size: 15,
                      color: Color(0xFF718096),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Deadline: ${task['deadline']}',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF718096),
                      ),
                    ),
                  ],
                ),
                _buildActionButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF86A3BE),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      child: const Text(
        'Lihat Detail',
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF86A3BE),
      onPressed: () {},
      child: const Icon(Icons.add),
    );
  }
}
