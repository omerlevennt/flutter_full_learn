enum LottieItems { themeChance }

extension LottieItemsExtension on LottieItems {
  String _path() {
    switch (this) {
      case LottieItems.themeChance:
        return 'theme_chance';
    }
  }

  String get lottiePath => 'assets/lottie/${_path()}.json';
}
