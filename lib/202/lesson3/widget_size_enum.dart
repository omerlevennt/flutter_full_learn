enum WidgetSizes { normalCardHeight, circleProfileWidth }

extension WidgetSizesExtension on WidgetSizes {
  double value() {
    switch (this) {
      case WidgetSizes.normalCardHeight:
        return 20;
      case WidgetSizes.circleProfileWidth:
        return 50;
    }
  }
}
