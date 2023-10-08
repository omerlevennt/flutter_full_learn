import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson5/cache/shared_manager.dart';
import 'package:flutter_full_learn/202/lesson5/cache/user_model.dart';

class SharedCacheLearn extends StatefulWidget {
  const SharedCacheLearn({super.key});

  @override
  State<SharedCacheLearn> createState() => _SharedCacheLearnState();
}

class _SharedCacheLearnState extends LoadingStateFull<SharedCacheLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> _userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    _userItems = UserItems().users;
    _initialize();
  }

  Future<void> _initialize() async {
    changeLoading();
    await _manager.init();
    changeLoading();
    getDefaultValue();
  }

  Future<void> getDefaultValue() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
          _removeValueButton(),
        ],
      ),
      appBar: AppBar(
        actions: [
          isLoading
              ? CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.error,
                )
              : const SizedBox.shrink()
        ],
        title: Text(_currentValue.toString()),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        changeLoading;
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        changeLoading;
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.remove),
      onPressed: () async {
        changeLoading;
        await _manager.removeItem(
          SharedKeys.counter,
        );

        changeLoading;
      },
    );
  }
}

//Generic
abstract class LoadingStateFull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
