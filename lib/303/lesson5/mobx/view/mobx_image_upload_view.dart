import 'package:flutter/material.dart';
import 'package:flutter_full_learn/303/lesson5/mobx/viewModel/image_upload_view_model.dart';
import 'package:flutter_full_learn/product/utility/image_upload.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class MobxImageUploadView extends StatefulWidget {
  const MobxImageUploadView({super.key});

  @override
  State<MobxImageUploadView> createState() => _MobxImageUploadViewState();
}

class _MobxImageUploadViewState extends State<MobxImageUploadView> {
  final String path =
      'https://lottie.host/ef5a378f-ee0d-4d92-8395-9dd38fbd7f54/cRlgrdK5K3.json';

  final _imageUploadViewModel = ImageUploadViewModel();
  final _imageUploadManager = ImageUploadManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          _imageUploadViewModel.saveDataToService();
        },
      ),
      appBar: AppBar(
        title: const Text('Image upload'),
        actions: [
          Observer(builder: (_) {
            return _imageUploadViewModel.isLoading
                ? const CircularProgressIndicator()
                : const SizedBox.shrink();
          }),
          Observer(builder: (_) {
            return Text(_imageUploadViewModel.downloadText);
          })
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Card(
                elevation: 10,
                child: Row(
                  children: [
                    Expanded(
                      child: _localImage(),
                    ),
                    Expanded(
                      child: _imageUploadButton(),
                    ),
                  ],
                )),
          ),
          const Divider(),
          Expanded(flex: 4, child: _imageNetwork())
        ],
      ),
    );
  }

  Observer _localImage() {
    return Observer(
      builder: (context) {
        return _imageUploadViewModel.file != null
            ? Image.file(_imageUploadViewModel.file!)
            : const SizedBox();
      },
    );
  }

  FittedBox _imageUploadButton() {
    return FittedBox(
      child: IconButton(
          onPressed: () async {
            _imageUploadViewModel
                .saveLocalFile(await _imageUploadManager.fecthFromLibrary());
          },
          icon: Lottie.network(path)),
    );
  }

  Observer _imageNetwork() {
    return Observer(builder: (_) {
      return _imageUploadViewModel.imageUrl.isNotEmpty
          ? Image.network(_imageUploadViewModel.imageUrl)
          : const SizedBox();
    });
  }
}
