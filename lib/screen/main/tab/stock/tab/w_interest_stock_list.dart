import 'package:fast_app_base/screen/main/tab/stock/stocks_dummy.dart';
import 'package:fast_app_base/screen/main/tab/stock/tab/w_stock_item.dart';
import 'package:flutter/material.dart';

class InterestStockList extends StatefulWidget {
  const InterestStockList({super.key});

  @override
  State<InterestStockList> createState() => _InterestStockListState();
}

class _InterestStockListState extends State<InterestStockList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...myInterestStocks.map(
          (e) => StockItem(
            stock: e,
          ),
        ),
      ],
    );
  }
}
