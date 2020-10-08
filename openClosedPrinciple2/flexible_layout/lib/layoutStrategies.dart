import 'package:flexible_layout/main.dart';

abstract class LayoutStrategy {
  void compose(List<Component> components, double lineSize,
      List<int> lineBreaks, List<double> componentWidths);
}

class SqueezeToMinWidthStrategy extends LayoutStrategy {
  @override
  void compose(List<Component> components, double lineSize,
      List<int> lineBreaks, List<double> componentWidths) {
    int i = 0;
    double currentWidth = 0.0;
    for (Component c in components) {
      if (currentWidth + c.minWidth > lineSize) {
        lineBreaks.add(i);
        currentWidth = 0.0;
      }
      componentWidths.add(c.minWidth);
      currentWidth += c.minWidth;
      i++;
    }
  }
}

class ExpandToMaxWidthStrategy extends LayoutStrategy {
  @override
  void compose(List<Component> components, double lineSize,
      List<int> lineBreaks, List<double> componentWidths) {
    int i = 0;
    double currentWidth = 0.0;
    for (Component c in components) {
      if (currentWidth + c.maxWidth > lineSize) {
        lineBreaks.add(i);
        currentWidth = 0.0;
      }
      componentWidths.add(c.maxWidth);
      currentWidth += c.maxWidth;
      i++;
    }
  }
}

class FixedNumberOfElementsInARow extends LayoutStrategy {
  final int numberOfElements;

  FixedNumberOfElementsInARow(this.numberOfElements);
  @override
  void compose(List<Component> components, double lineSize,
      List<int> lineBreaks, List<double> componentWidths) {
    int i = 0;
    for (Component c in components) {
      if (i % numberOfElements == 0) {
        lineBreaks.add(i);
      }
      componentWidths.add(lineSize / numberOfElements);
      i++;
    }
  }
}
