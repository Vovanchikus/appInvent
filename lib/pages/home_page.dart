import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      WarehousePage(db: widget.db),
      HistoryPage(),
      DocumentsPage(db: widget.db),
    ];
  }

  void openScan() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ScanPage(db: widget.db)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: Scaffold(
        extendBody: true,
        body: AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: pages[index],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: openScan,
          child: Container(
            height: 68,
            width: 68,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFF4461F2), Color(0xFF8E97FD)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.3),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: const Icon(Icons.qr_code_scanner,
                color: Colors.white, size: 32),
          ),
        ),
        bottomNavigationBar: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, -4),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _navItem('lib/assets/icons/box.svg', "Склад", 0),
              _navItem('lib/assets/icons/note.svg', "История", 1),
              const SizedBox(width: 52),
              _navItem('lib/assets/icons/document.svg', "Документы", 2),
              _navItem('lib/assets/icons/more.svg', "Еще", 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _navItem(String asset, String label, int i) {
    final bool active = (index == i);

    return GestureDetector(
      onTap: () => setState(() => index = i),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            asset,
            width: 24,
            height: 24,
            color: active ? const Color(0xFF4461F2) : Colors.grey,
          ),
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
