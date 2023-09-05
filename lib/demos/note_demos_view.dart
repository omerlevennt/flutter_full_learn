import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/lesson3/image_learn.dart';

class NoteDemosView extends StatelessWidget {
  const NoteDemosView({super.key});
  final _title = 'Create your first note';
  final _title2 = 'Add a note';
  final _buttonText = 'Create a note';
  final _textButton = 'Import notes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Padding(
        padding: PagePaddingItems.horizantalPadding,
        child: Column(
          children: [
            const PngImage(name: ImageItemsName.imageName),
            const SizedBox(height: ButtonHeight.buttonNormalHeight),
            _TitleWidget(title: _title),
            Padding(
                padding: PagePaddingItems.verticalPadding,
                child: _TitleWidget2(
                    title: _title2 * 7, textAlign: TextAlign.center)),
            const Spacer(),
            _createButton(context),
            TextButton(onPressed: () {}, child: Text(_textButton)),
            const SizedBox(height: ButtonHeight.buttonNormalHeight),
          ],
        ),
      ),
    );
  }

  ElevatedButton _createButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        child: SizedBox(
            height: ButtonHeight.buttonNormalHeight,
            child: Center(
                child: Text(
              _buttonText,
              style: Theme.of(context).textTheme.headlineSmall,
            ))));
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
    );
  }
}

class _TitleWidget2 extends StatelessWidget {
  const _TitleWidget2({
    required this.title,
    this.textAlign = TextAlign.center,
  });
  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(color: Colors.black, fontWeight: FontWeight.normal),
    );
  }
}

class PagePaddingItems {
  static const EdgeInsets horizantalPadding =
      EdgeInsets.symmetric(horizontal: 20.0);
  static const EdgeInsets verticalPadding =
      EdgeInsets.symmetric(vertical: 10.0);
}

class ButtonHeight {
  static const double buttonNormalHeight = 56;
}
