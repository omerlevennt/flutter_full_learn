import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson2/call_back_learn.dart';

class CallBackDropDown extends StatefulWidget {
  const CallBackDropDown({super.key, required this.onUserSelected});
  final void Function(CallBackUser user) onUserSelected;
  @override
  State<CallBackDropDown> createState() => _CallBackDropDownState();
}

//DK 22
class _CallBackDropDownState extends State<CallBackDropDown> {
  CallBackUser? _user;

  void _updateUser(CallBackUser? item) {
    setState(() {
      _user = item;
    });
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<CallBackUser>(
      value: _user,
      items: CallBackUser.dummyUsers()
          .map((e) => DropdownMenuItem(
                value: e,
                child: Text(
                  e.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ))
          .toList(),
      onChanged: _updateUser,
    );
  }
}
