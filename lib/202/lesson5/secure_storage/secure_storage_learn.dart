import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum _SecureKeys { token }

class SecureStorageLearn extends StatefulWidget {
  const SecureStorageLearn({super.key});

  @override
  State<SecureStorageLearn> createState() => _SecureStorageLearnState();
}

class _SecureStorageLearnState extends State<SecureStorageLearn> {
  final _storage = const FlutterSecureStorage();
  String _title = '';
  TextEditingController _controller = TextEditingController();
  void saveItems(String data) {
    setState(() {
      _title = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems() async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';

    if (_title.isNotEmpty) {
      print('Bu adam onceden appi kullanmis ve tokene bu ');
      _controller.text = _title;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: const Text('Save'),
      ),
      body: TextField(
        controller: _controller,
        minLines: 2,
        maxLines: 4,
        onChanged: saveItems,
      ),
    );
  }
}
