import 'package:flutter/material.dart';
import 'package:ui_rendering_engine/models/models.dart';
import 'package:ui_rendering_engine/screens/screens.dart';
import 'package:ui_rendering_engine/utils/utils.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    // if bannerWidgetData is null, then the flow is coming from the banner carousel, or else, is is a single banner widget
    super.key,
    this.bannerWidgetData,
    this.bannerWidgetDataAsCarouselItems,
    this.widgetType = WidgetType.banner,
  });

  final Widgets? bannerWidgetData;
  final CarouselBannerAndItemClass? bannerWidgetDataAsCarouselItems;
  final WidgetType widgetType;

  @override
  Widget build(BuildContext context) {
    bool isDataValid = validateData();    // validating the data

    double? borderRadius;
    double? paddingTop;
    double? paddingBottom;
    double? paddingLeft;
    double? paddingRight;
    String? color;
    String? image;
    String? headerText;
    String? footerText;

    if (widgetType == WidgetType.banner) {
      borderRadius = bannerWidgetData?.borderRadius;
      paddingTop = bannerWidgetData?.paddingTop;
      paddingBottom = bannerWidgetData?.paddingBottom;
      paddingLeft = bannerWidgetData?.paddingLeft;
      paddingRight = bannerWidgetData?.paddingRight;
      color = bannerWidgetData?.color;
      image = bannerWidgetData?.image;
      headerText = bannerWidgetData?.headerText;
      footerText = bannerWidgetData?.footerText;
    } else {
      borderRadius = bannerWidgetDataAsCarouselItems?.borderRadius;
      paddingTop = bannerWidgetDataAsCarouselItems?.paddingTop;
      paddingBottom = bannerWidgetDataAsCarouselItems?.paddingBottom;
      paddingLeft = bannerWidgetDataAsCarouselItems?.paddingLeft;
      paddingRight = bannerWidgetDataAsCarouselItems?.paddingRight;
      color = bannerWidgetDataAsCarouselItems?.color;
      image = bannerWidgetDataAsCarouselItems?.image;
      headerText = bannerWidgetDataAsCarouselItems?.headerText;
      footerText = bannerWidgetDataAsCarouselItems?.footerText;
    }

    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(
        isDataValid && borderRadius != null ? borderRadius : 12,
      ),
      child: SizedBox(
        width: context.screenWidth,
        height: context.screenHeight * 0.2,
        child: !isDataValid
            ? const PlaceholderWidget()   // displaying placeholder if data is not valid
            : ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius ?? 12),
                child: Container(
                  padding: EdgeInsets.only(
                    top: paddingTop ?? context.screenHeight * 0.015,
                    bottom: paddingBottom ?? context.screenHeight * 0.015,
                    left: paddingLeft ?? context.screenWidth * 0.03,
                    right: paddingRight ?? context.screenWidth * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: color != null ? Constants.colorsHashMap[color] : null,
                    image: image != null
                        ? DecorationImage(
                            image: NetworkImage(image),
                            fit: BoxFit.fill,
                          )
                        : null,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _ReusableTitleTile(text: headerText),
                      _ReusableTitleTile(
                        text: footerText,
                        includeFooterIcon: true,
                        isTitle: false,
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  bool validateData() {
    bool isDataValid = true;
    if (widgetType == WidgetType.banner) {
      if (bannerWidgetData == null ||
          (bannerWidgetData!.image == null && bannerWidgetData!.color == null) ||
          bannerWidgetData!.headerText == null ||
          bannerWidgetData!.footerText == null) {
        isDataValid = false;
      }
    } else {
      if (bannerWidgetDataAsCarouselItems == null ||
          (bannerWidgetDataAsCarouselItems!.image == null && bannerWidgetDataAsCarouselItems!.color == null) ||
          bannerWidgetDataAsCarouselItems!.headerText == null ||
          bannerWidgetDataAsCarouselItems!.footerText == null) {
        isDataValid = false;
      }
    }

    return isDataValid;
  }
}

class _ReusableTitleTile extends StatelessWidget {
  const _ReusableTitleTile({
    this.text,
    this.includeFooterIcon = false,
    this.isTitle = true,
  });

  final String? text;
  final bool isTitle;
  final bool includeFooterIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: AppColors.black.withOpacity(0.5)),
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.025,
        vertical: 5,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text ?? '',
            style: isTitle ? tsWhite18600 : tsWhite16,
          ),
          if (includeFooterIcon) ...[
            SizedBox(width: context.screenWidth * 0.03),
            const Icon(
              Icons.arrow_right_alt_outlined,
              color: AppColors.white,
            )
          ]
        ],
      ),
    );
  }
}
