import 'package:animations/animations.dart';
import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/datetime_extension.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/popular_stock_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/search/w_popular_stock_item.dart';
import 'package:flutter/material.dart';

import 's_stock_detail.dart';

class PopularSearchStockList extends StatelessWidget {
  const PopularSearchStockList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            '인기 검색'.text.bold.make(),
            '오늘 ${DateTime.now().formattedTime} 기준'.text.size(12).make(),
          ],
        ),
        height20,
        ...popularStockList.mapIndexed(
          (element, index) => OpenContainer(
            openColor: context.backgroundColor,
            closedColor: context.backgroundColor,
            openBuilder: (context, action) {
              return StockDetailScreen(stockName: element.name);
            },
            closedBuilder: (context, action) {
              return PopularStockItem(
                stock: element,
                number: index + 1,
              );
            },
          ),
        ),
      ],
    ).pSymmetric(h: 20);
  }
}
