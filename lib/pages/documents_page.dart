import 'package:flutter/material.dart';
import '../database/app_database.dart';
import '../models/document.dart';

class DocumentsPage extends StatefulWidget {
  final AppDatabase db;

  const DocumentsPage({super.key, required this.db});

  @override
  State<DocumentsPage> createState() => _DocumentsPageState();
}

class _DocumentsPageState extends State<DocumentsPage> {
  List<InvDocument> documents = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadDocs();
  }

  Future<void> loadDocs() async {
    final list = await widget.db.select(widget.db.documentsTable).get();

    setState(() {
      documents = list
          .map((d) => InvDocument(
                id: d.id,
                name: d.name ?? '',
                fileUrl: d.fileUrl ?? '',
                fileName: d.fileName ?? '',
                createdAt: d.createdAt ?? '',
              ))
          .toList();
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(child: CircularProgressIndicator())
        : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: documents.length,
            itemBuilder: (_, i) {
              final d = documents[i];
              return Card(
                child: ListTile(
                  title: Text(d.name ?? '-'),
                  subtitle: Text(d.fileName ?? '-'),
                ),
              );
            },
          );
  }
}
