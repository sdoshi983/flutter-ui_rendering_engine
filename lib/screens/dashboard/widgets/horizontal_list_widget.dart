import 'package:flutter/material.dart';
import 'package:ui_rendering_engine/models/models.dart';
import 'package:ui_rendering_engine/screens/screens.dart';
import 'package:ui_rendering_engine/utils/utils.dart';

class HorizontalListWidget extends StatelessWidget {
  const HorizontalListWidget({super.key, this.itemData});

  final CarouselBannerAndItemClass? itemData;

  @override
  Widget build(BuildContext context) {
    bool isDataValid = validateData();
    if (isDataValid) {
      if (itemData?.type == HorizontalListWidgetType.circularItem.type) {
        return Column(
          children: [
            SizedBox(height: context.screenHeight * 0.02),
            Material(
              borderRadius: BorderRadius.circular(45),
              elevation: 3,
              shadowColor: Constants.isLightTheme ? null : AppColors.white,
              child: CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(itemData?.image ?? ''),
              ),
            ),
            SizedBox(height: context.screenHeight * 0.02),
            getTitleTextWidget(itemData?.text ?? '')
          ],
        );
      } else {
        return Material(
          borderRadius: BorderRadius.circular(8),
          elevation: 3,
          shadowColor: Constants.isLightTheme ? null : AppColors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Constants.isLightTheme ? AppColors.white.withOpacity(1) : AppColors.black.withOpacity(0.2),
              ),
              color: Constants.isLightTheme ? null : AppColors.chineseBlack,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.02,
            ),
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.04),
                ShimmerImageLoading(imageUrl: itemData?.image ?? ''),
                SizedBox(height: context.screenHeight * 0.02),
                getTitleTextWidget(itemData?.text ?? '')
              ],
            ),
          ),
        );
      }
    }

    return const PlaceholderWidget();
  }

  bool validateData() {
    bool isDataValid = true;
    if (itemData == null || itemData!.type == null || itemData!.text == null) {
      isDataValid = false;
    }

    return isDataValid;
  }

  Widget getTitleTextWidget(String title) => Expanded(
    child: Text(
      title,
      style: Constants.isLightTheme
          ? tsBlack16500
          : tsBlack16500.copyWith(
        color: AppColors.white,
      ),
    ),
  );
}
