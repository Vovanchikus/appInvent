import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'warehouse_page.dart';
import 'history_page.dart';
import 'documents_page.dart';
import 'scan_page.dart';
import '../database/app_database.dart';
import '../services/sync_service.dart';
import '../api/api_service.dart';

class HomePage extends StatefulWidget {
  final ApiService api;
  final AppDatabase db;
  final SyncService syncService;

  const HomePage({
    super.key,
    required this.api,
    required this.db,
    required this.syncService,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      WarehousePage(db: widget.db),
      HistoryPage(),
      DocumentsPage(db: widget.db),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: pages[index],
      ),

      // FLOAT BUTTON
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 68,
        height: 68,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              Color(0xFF4461F2),
              Color(0xFF8E97FD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: IconButton(
          icon:
              const Icon(Icons.qr_code_scanner, color: Colors.white, size: 32),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ScanPage()),
            );
          },
        ),
      ),

      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _navItem(Icons.store, "Склад", 0),
            _navItem(Icons.history, "История", 1),
            const SizedBox(width: 52),
            _navItem(Icons.description, "Документы", 2),
            _navItem(Icons.more_horiz, "Еще", 3),
          ],
        ),
      ),
    );
  }

  Widget _navItem(IconData icon, String label, int i) {
    final bool active = (index == i);

    return GestureDetector(
      onTap: () => setState(() => index = i),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: active ? const Color(0xFF4461F2) : Colors.grey),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: active ? const Color(0xFF4461F2) : Colors.grey,
              fontWeight: active ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}
