class JsonDataModel {
  App? app;
  List<Widgets>? widgets;

  JsonDataModel({
    this.app,
    this.widgets,
  });

  JsonDataModel.fromJson(Map<String, dynamic> json) {
    app = json['app'] != null ? App.fromJson(json['app']) : null;
    if (json['widgets'] != null) {
      widgets = <Widgets>[];
      json['widgets'].forEach((v) {
        widgets!.add(Widgets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (app != null) {
      data['app'] = app!.toJson();
    }
    if (widgets != null) {
      data['widgets'] = widgets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class App {
  String? theme;

  App({this.theme});

  App.fromJson(Map<String, dynamic> json) {
    theme = json['theme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['theme'] = theme;
    return data;
  }
}

class Widgets {
  String? type;
  String? image;
  String? headerText;
  String? footerText;
  bool? footerIcon;
  String? color;
  String? title;
  double? paddingTop;
  double? paddingBottom;
  double? paddingLeft;
  double? paddingRight;
  double? borderRadius;
  List<CarouselBannerAndItemClass>? items;

  Widgets({
    this.type,
    this.image,
    this.headerText,
    this.footerText,
    this.footerIcon,
    this.color,
    this.title,
    this.items,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
  });

  Widgets.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    image = json['image'];
    headerText = json['header_text'];
    footerText = json['footer_text'];
    footerIcon = json['footer_icon'];
    color = json['color'];
    title = json['title'];
    paddingTop = json['paddingTop'];
    paddingBottom = json['paddingBottom'];
    paddingLeft = json['paddingLeft'];
    paddingRight = json['paddingRight'];
    borderRadius = json['borderRadius'];

    if (json['items'] != null) {
      items = <CarouselBannerAndItemClass>[];
      json['items'].forEach((v) {
        items!.add(CarouselBannerAndItemClass.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['image'] = image;
    data['header_text'] = headerText;
    data['footer_text'] = footerText;
    data['footer_icon'] = footerIcon;
    data['color'] = color;
    data['title'] = title;
    data['paddingTop'] = paddingTop;
    data['paddingBottom'] = paddingBottom;
    data['paddingLeft'] = paddingLeft;
    data['paddingRight'] = paddingRight;
    data['borderRadius'] = borderRadius;

    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarouselBannerAndItemClass {
  String? type;
  String? text;
  String? image;

  String? headerText;
  String? footerText;
  bool? footerIcon;
  String? color;
  String? title;
  double? paddingTop;
  double? paddingBottom;
  double? paddingLeft;
  double? paddingRight;
  double? borderRadius;

  CarouselBannerAndItemClass({
    this.type,
    this.text,
    this.image,

    this.headerText,
    this.footerText,
    this.footerIcon,
    this.color,
    this.title,
    this.paddingTop,
    this.paddingBottom,
    this.paddingLeft,
    this.paddingRight,
  });

  CarouselBannerAndItemClass.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    image = json['image'];

    headerText = json['header_text'];
    footerText = json['footer_text'];
    footerIcon = json['footer_icon'];
    color = json['color'];
    title = json['title'];
    paddingTop = json['paddingTop'];
    paddingBottom = json['paddingBottom'];
    paddingLeft = json['paddingLeft'];
    paddingRight = json['paddingRight'];
    borderRadius = json['borderRadius'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['text'] = text;
    data['image'] = image;

    data['header_text'] = headerText;
    data['footer_text'] = footerText;
    data['footer_icon'] = footerIcon;
    data['color'] = color;
    data['title'] = title;
    data['paddingTop'] = paddingTop;
    data['paddingBottom'] = paddingBottom;
    data['paddingLeft'] = paddingLeft;
    data['paddingRight'] = paddingRight;
    data['borderRadius'] = borderRadius;

    return data;
  }
}
