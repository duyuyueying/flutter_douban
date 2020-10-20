// 颜色
import 'dart:ui';

import 'package:flutter/material.dart';

class DBColors {
  static const Color primaryValue = Color(0xff42bd56);
  static const Color textPrimaryValue = Color(0xff3ba94d);
  static const Color textValue = Color(0xff000000);
  static const Color subTextValue = Color(0xff494949);
  static const Color textDeepGreyValue = Color(0xff191919);
  static const Color textGreyValue = Color(0xff818181);
  static const Color textGreyLightValue = Color(0xffc0c0c0);
  static const Color borderValue = Color(0xffcccccc);
  static const Color border1Value = Color(0xffe0e0e0);
  static const Color border2Value = Color(0xffb2b2b2);
  static const Color bgValue = Color(0xffededed);
  static const Color tagBgValue = Color(0xfff7f7f7);
  static const Color writeValue = Color(0xffffffff);
}

// 文本样式
class DBTextStyle {
  // static const biggerTextSize = 32;
  // static const bigTextSize = 32;
  static const normalTextSize = 36.0;
  static const middleTextSize = 32.0;
  static const smallTextSize = 14.0;
  static const minTextSize = 20.0;

  static const smallGreyLightText = TextStyle(
    color: DBColors.textGreyLightValue,
    fontSize: smallTextSize,
  );
  static const smallDeepGreyText = TextStyle(
    color: DBColors.textDeepGreyValue,
    fontSize: smallTextSize,
  );
  static const nomalSubText = TextStyle(
    color: DBColors.subTextValue,
    fontSize: normalTextSize
  );
  static const nomalBoldText = TextStyle(
    color: DBColors.textValue,
    fontSize: normalTextSize,
    fontWeight: FontWeight.bold
  );
  static const middleGreyText = TextStyle(
    fontSize: middleTextSize,
    color: DBColors.textGreyValue,
  );
  static const middlePrimayBoldText = TextStyle(
    fontSize: middleTextSize,
    fontWeight: FontWeight.bold,
    color: DBColors.textPrimaryValue,
  );
  
}
