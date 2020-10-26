// 颜色
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class DBColors {
  static const Color primaryValue = Color(0xff42bd56);
  static const Color textPrimaryValue = Color(0xff3ba94d);
  static const Color textValue = Color(0xff000000);
  static const Color sub1TextValue = Color(0xff242424);
  static const Color subTextValue = Color(0xff494949);
  static const Color textDeepGreyValue = Color(0xff191919);
  static const Color textGreyValue = Color(0xff818181);
  static const Color textGrey1Value = Color(0xff7f7f7f);
  static const Color textGreyLightValue = Color(0xffc0c0c0);
  static const Color borderValue = Color(0xffcccccc);
  static const Color border1Value = Color(0xffe0e0e0);
  static const Color border2Value = Color(0xffb2b2b2);
  static const Color border3Value = Color(0xffbfbfbf);
  static const Color bgValue = Color(0xffededed);
  static const Color tagBgValue = Color(0xfff7f7f7);
  static const Color writeValue = Color(0xffffffff);

  static const Color iconBlueValue = Color(0xff2384e8);
  static const Color iconYellowValue = Color(0xffffac2d);
  static const Color iconGreenValue = Color(0xff4cc1a2);
  static const Color iconPurpleValue = Color(0xff785fcf);
}

// 文本样式
class DBTextStyle {
  // static const biggerTextSize = 32;
  static final bigTextSize = ScreenUtil().setSp(46.0);
  static final normalTextSize = ScreenUtil().setSp(36.0);
  static final middleTextSize = ScreenUtil().setSp(32.0);
  static final smallTextSize = ScreenUtil().setSp(28.0);
  static final smallerTextSize = ScreenUtil().setSp(24.0);
  static final minTextSize = ScreenUtil().setSp(20.0);

  static final minGreyText = TextStyle(
    fontSize: minTextSize,
    color: DBColors.textGreyValue,
  );
  static final minGrey1Text = TextStyle(
    fontSize: minTextSize,
    color: DBColors.textGrey1Value,
  );
  static final smallGreyLightText = TextStyle(
    color: DBColors.textGreyLightValue,
    fontSize: smallTextSize,
  );
  static final smallDeepGreyText = TextStyle(
    color: DBColors.textDeepGreyValue,
    fontSize: smallTextSize,
  );
  static final smallDeepGreyBoldText = TextStyle(
    color: DBColors.textDeepGreyValue,
    fontSize: smallTextSize,
    fontWeight: FontWeight.bold
  );
  static final smallGreyText = TextStyle(
    color: DBColors.textGreyValue,
    fontSize: smallTextSize,
  );
  // static final smallPrimayText = TextStyle(
  //   color: DBColors.primaryValue,
  //   fontSize: smallTextSize,
  // );
  
  static final smallerDeepGreyText = TextStyle(
    color: DBColors.textDeepGreyValue,
    fontSize: smallerTextSize,
  );
  static final smallerSub1Text = TextStyle(
    color: DBColors.sub1TextValue,
    fontSize: smallerTextSize,
    fontWeight: FontWeight.bold
  );
  static final smallerPrimayText = TextStyle(
    color: DBColors.primaryValue,
    fontSize: smallerTextSize,
  );
  static final middleSubText = TextStyle(
    color: DBColors.subTextValue,
    fontSize: middleTextSize
  );
  static final middleBoldText = TextStyle(
    color: DBColors.textValue,
    fontSize: middleTextSize,
    fontWeight: FontWeight.bold
  );
  static final middleGreyText = TextStyle(
    fontSize: middleTextSize,
    color: DBColors.textGreyValue,
  );
  static final middlePrimayBoldText = TextStyle(
    fontSize: middleTextSize,
    fontWeight: FontWeight.bold,
    color: DBColors.textPrimaryValue,
  );
  static final bigDeepGreyBoldText = TextStyle(
    fontSize: bigTextSize,
    fontWeight: FontWeight.bold,
    color: DBColors.textDeepGreyValue,
  );
  static final bigGrey1Text = TextStyle(
    fontSize: bigTextSize,
    color: DBColors.textGrey1Value,
  );
}


class DBGaps{
  static double gap_dp10 = 10;
  static double gap_dp15 = 15;
  
  static double gap_dp20 = 20;
  static double gap_dp30 = 30;
  static double gap_dp40 = 40;
  
  static double gap_dp54 = 54;
  static double gap_dp80 = 80;
  static double gap_dp100 = 100;
  static double gap_dp150 = 150;
  static double gap_dp250 = 250;

  static Widget vGap15 = SizedBox(height: ScreenUtil().setWidth(gap_dp15));
  static Widget vGap20 = SizedBox(height: ScreenUtil().setWidth(gap_dp20));
  
  static Widget vGap40 = SizedBox(height: ScreenUtil().setWidth(gap_dp40));
  static Widget vGap80 = SizedBox(height: ScreenUtil().setWidth(gap_dp80));

  static Widget hGap10 = SizedBox(width: ScreenUtil().setWidth(gap_dp10));
}
