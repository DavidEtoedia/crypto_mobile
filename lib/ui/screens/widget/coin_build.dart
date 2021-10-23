import 'package:crypto_mobile/core/model/get_crypto_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CryptoBuild extends StatelessWidget {
  final CryptoListRes coinList;
  const CryptoBuild({Key? key, required this.coinList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Container(
            margin: EdgeInsets.all(8.w),
            height: 40.h,
            width: 40.w,
            child: Image.network(coinList.image!),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coinList.name!,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              coinList.symbol!.toUpperCase(),
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
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
              height: 10.h,
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
    );
  }
}
