enum AppTheme {
  light,
  dark,
}

enum WidgetType {
  banner('banner'),
  horizontalList('horizontal_list'),
  bannerCarousel('banner_carousel');

  const WidgetType(this.type);
  final String type;
}

enum HorizontalListWidgetType {
  circularItem('circular_item'),
  boxItem('box_item');

  const HorizontalListWidgetType(this.type);
  final String type;
}

enum BannerWidgetType {
  backgroundImage,
  backgroundColor,
}
