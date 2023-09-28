import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/service_demo/fake_user_model.dart';
import 'package:flutter_full_learn/demos/service_demo/fake_user_service.dart';

class FakeUserView extends StatefulWidget {
  const FakeUserView({super.key});

  @override
  State<FakeUserView> createState() => _FakeUserViewState();
}

class _FakeUserViewState extends State<FakeUserView> {
  late final IFakeStoreService fakeStoreService;
  List<UserModel>? _userItem;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    fakeStoreService = FakeUserService();
    fetchUserItems();
  }

  Future<void> fetchUserItems() async {
    _changeLoading();
    _userItem = await fakeStoreService.fetchFakeUserItems();
    _changeLoading();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(isLoading: _isLoading),
      body: _userItem == null
          ? const Placeholder()
          : ListView.builder(
              padding: PagePadding.horizontalNormal,
              itemCount: _userItem?.length ?? 0,
              itemBuilder: (context, index) {
                return UserCard(model: _userItem?[index]);
              },
            ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({
    required bool isLoading,
  }) : _isLoading = isLoading;

  final bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        _isLoading
            ? const CircularProgressIndicator.adaptive()
            : const SizedBox.shrink()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required UserModel? model,
  }) : _model = model;

  final UserModel? _model;
  final String _imageUrl = 'https://randomuser.me/api/portraits/lego/5.jpg';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.bottomLow,
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          trailing: Card(
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(_model?.username ?? ''),
              )),
          dense: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              _imageUrl,
            ),
          ),
          title: Text(_model?.name ?? ''),
          subtitle: Text(_model?.email ?? ''),
        ),
      ),
    );
  }
}

class PagePadding {
  static const EdgeInsets horizontalNormal =
      EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets bottomLow = EdgeInsets.only(bottom: 10.0);
}
