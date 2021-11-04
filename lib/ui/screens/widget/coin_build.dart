import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:crypto_mobile/ui/screens/btc_screen.dart';
import 'package:crypto_mobile/utils/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoBuild extends StatelessWidget {
  final CryptoListRes coinList;
  const CryptoBuild({Key? key, required this.coinList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.navigate(CoinDisplayScreen(
        coinById: coinList.id!,
      )),
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 5, offset: Offset(1, 1))
            ], shape: BoxShape.circle, color: Color(0xff201f28)),
            child: Container(
              margin: EdgeInsets.all(10.w),
              height: 40.h,
              width: 40.w,
              child: Image.network(coinList.image!),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinList.name!,
                style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                coinList.symbol!.toUpperCase(),
                style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coinList.marketCap.toString(),
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                coinList.marketCapRank.toString(),
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
