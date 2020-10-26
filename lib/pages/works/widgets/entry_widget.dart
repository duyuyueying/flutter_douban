import 'package:flutter/material.dart';
import 'package:flutter_douban/common/style/style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EntryWidget extends StatelessWidget {
  final List<EntryItem> entryItems;

  const EntryWidget({Key key, this.entryItems}) : super(key: key);

  Widget _renderEntryItem(BuildContext context, EntryItem item) {
    double size =
        (MediaQuery.of(context).size.width - ScreenUtil().setWidth(150)) / 4;
    return GestureDetector(
      onTap: item.onTap,
      child: Container(
        width: size,
        padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
          color: DBColors.writeValue,
          border: Border.all(color: DBColors.border1Value),
          boxShadow: [
            BoxShadow(
              color: DBColors.border1Value.withOpacity(.4),
              blurRadius: 5.0,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(
              item.icon,
              color: item.iconColor,
              size: ScreenUtil().setWidth(50),
            ),
            // DBGaps.vGap15,
            Text(
              item.name,
              style: DBTextStyle.minGreyText,
            )
          ],
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    List<Widget> entryItemWidgets = List<Widget>();
    for(int i = 0, len = entryItems.length; i < len; i++) {
      entryItemWidgets.add(_renderEntryItem(context, entryItems[i]));
    }
    
    return Wrap(
      runSpacing: ScreenUtil().setWidth(30),
      spacing: ScreenUtil().setWidth(30),
      children: entryItemWidgets,
    );
  }
}

class EntryItem {
  final IconData icon;
  final String name;
  final Color iconColor;
  final Function onTap;

  EntryItem(this.icon, this.name, this.iconColor, this.onTap);
}