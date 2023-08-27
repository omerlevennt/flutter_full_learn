import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});
  final String title = 'food';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: _PaddingUtility.horizantalPadding,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CustomFoodButton(
                    text: title,
                    onPressed: () {},
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: _PaddingUtility.horizantalPadding,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: CustomFoodButton(
                    text: title,
                    onPressed: () {},
                  )),
            ),
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: _PaddingUtility.horizantalPadding,
              child: CustomFoodButton(
                text: title,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin class _ColorUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

mixin class _PaddingUtility {
  final EdgeInsets paddingNormal = const EdgeInsets.all(8);
  final EdgeInsets padding2xNormal = const EdgeInsets.all(16);
  static const EdgeInsets horizantalPadding =
      EdgeInsets.symmetric(horizontal: 10.0);
}

class CustomFoodButton extends StatelessWidget
    with _ColorUtility, _PaddingUtility {
  CustomFoodButton({super.key, required this.text, required this.onPressed});
  final String text;
  //final VoidCallback onPressed;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: redColor, shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: padding2xNormal,
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(color: whiteColor, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
