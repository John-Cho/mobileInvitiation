import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:mobileinvitiation/common/constans.dart';
import 'package:mobileinvitiation/common/model/userdata.dart';
import 'package:mobileinvitiation/common/utils.dart';
import 'package:mobileinvitiation/component/calender.dart';
import 'package:mobileinvitiation/component/gallery.dart';
import 'package:mobileinvitiation/component/maps.dart';
import 'package:mobileinvitiation/layout/default_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(providerUserData) as UserData;

    return DefaultLayout(
      backgroundColor: data.themeColor,
      title: '재우 ♥ 예경',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _sizedbox(),
              const Text(
                '결혼합니다',
                style: TextStyle(
                  fontSize: 26.0,
                  color: DEFAULT_TEXT_COLOR,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _sizedbox(),
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'asset/img/home_color.png',
                      fit: BoxFit.cover,
                    )),
              ),
              _sizedbox(),
              Lottie.asset(
                'asset/lottie/grey_lottie.json',
                width: 160,
                fit: BoxFit.cover,
              ),
              _divider(),
              ///////////////////////////////////////////////////////////////
              Text(
                data.quote,
                style: const TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 14.0,
                  height: 3.0,
                ),
                textAlign: TextAlign.center,
              ),
              _divider(),
              ///////////////////////////////////////////////////////////////
              Text(
                '초대합니다',
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              _sizedbox(),
              Text(
                data.invitationMessage,
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 14.0,
                  height: 3.0,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'asset/img/sketch_black.png',
                width: 150,
                fit: BoxFit.cover,
              ),
              _divider(),
              ///////////////////////////////////////////////////////////////
              const Text(
                '예식안내',
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              _sizedbox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data.weddingDate,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: DEFAULT_TEXT_COLOR,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    data.weddingTime,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: DEFAULT_TEXT_COLOR,
                    ),
                  ),
                ],
              ),

              ///////////////////////////////////////////////////////////////
              Text(
                '노블발렌티 대치점',
                style: TextStyle(
                  fontSize: 14.0,
                  color: DEFAULT_TEXT_COLOR,
                ),
              ),
              _sizedbox(height: 3),
              Text(
                '삼성점이 아닌 대치점입니다.',
                style: TextStyle(
                    fontSize: 10.0,
                    color: DEFAULT_TEXT_COLOR,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationStyle: TextDecorationStyle.dotted),
              ),
              Image.asset(
                'asset/img/calender_black.png',
                fit: BoxFit.cover,
              ),
              _sizedbox(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Color(0xFFFFE4C4),
                ),
                child: Text(
                  '예식일이 ${_calDDay(data.weddingDate)}일 남았습니다.',
                  style: TextStyle(
                    color: DEFAULT_TEXT_COLOR,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              _sizedbox(),
              _divider(),
              ///////////////////////////////////////////////////////////////
              const Text(
                '사진첩',
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              _sizedbox(),
              GalleryScreen(),
              _sizedbox(),
              _divider(),
              _sizedbox(),
              const Text(
                '오시는 길',
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),

              _sizedbox(),
              Text(
                data.venueAddress,
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 14.0,
                ),
              ),
              Text(
                data.venueName,
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              _sizedbox(),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: const Image(
                  image: AssetImage('asset/img/maps.png'),
                  fit: BoxFit.cover,
                ),
              ),
              _sizedbox(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '버스 안내',
                        style: TextStyle(
                          color: DEFAULT_TEXT_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '간선 : 343, 401\n지선 : 4318, 4319\n일반 : 11-3, 917\n직행 : 500-2, 9407, 9507, 9607',
                        style: TextStyle(
                          color: DEFAULT_SUBTEXT_COLOR,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                  VerticalDivider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '지하철 안내',
                        style: TextStyle(
                          color: DEFAULT_TEXT_COLOR,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        '2호선 삼성역 3번 출구\n 30M 전방에서 셔틀버스 운행\n(수시운행, 도보 이용시 7분 소요)',
                        style: TextStyle(
                          color: DEFAULT_SUBTEXT_COLOR,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              _sizedbox(),
              _divider(),
              _sizedbox(),
              const Text(
                '마음보내실 곳',
                style: TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Image.asset(
                'asset/img/ending.png',
                width: 100,
                fit: BoxFit.cover,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _contactElevatedButton(context, '신랑', [
                    data.groom,
                    data.groomDad,
                    data.groomMom,
                  ]),
                  _contactElevatedButton(context, '신부', [
                    data.bride,
                    data.brideDad,
                    data.brideMom,
                  ]),
                ],
              ),
              _sizedbox(),
              _divider(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _divider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          _sizedbox(height: 8.0),
          Divider(
            height: 1.5,
          ),
          _sizedbox(),
        ],
      ),
    );
  }

  static Widget _sizedbox({double? height = 14.0}) {
    return SizedBox(
      height: height,
    );
  }

  String _calDDay(String date) {
    DateTime targetDate = DateFormat('yyyy년 M월 d일').parse(date);
    return targetDate.difference(DateTime.now()).inDays.toString();
  }

  Widget _contactElevatedButton(
      BuildContext context, String title, List<PersonData> data) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(),
        elevation: 5,
        backgroundColor: DEFAULT_BG_COLOR,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: DEFAULT_BG_COLOR,
              title: Text(
                '${title} 측',
              ),
              content: Container(
                width: double.maxFinite,
                child: _contactListtile(
                  context,
                  data,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('ok'),
                ),
              ],
            );
          },
        );
      },
      child: Text(
        '${title}측 마음',
        style: TextStyle(
          fontSize: 16.0,
          color: DEFAULT_TEXT_COLOR,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _contactListtile(BuildContext context, List<PersonData> user) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: user.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: DEFAULT_BG_COLOR,
                  width: 1.5,
                ),
              ),
              child: CircleAvatar(
                backgroundColor: DEFAULT_BG_COLOR,
                child: Text(
                  user[index].type,
                  style: TextStyle(
                    fontSize: 9.0,
                    fontWeight: FontWeight.bold,
                    color: DEFAULT_TEXT_COLOR,
                  ),
                ),
              ),
            ),
            title: Text(
              user[index].name,
              style: TextStyle(
                fontSize: 16.0,
                color: DEFAULT_TEXT_COLOR,
              ),
            ),
            subtitle: Text(
              "${user[index].giftAccountDetails}\n[${user[index].backType}]",
              style: TextStyle(
                fontSize: 10.0,
                color: DEFAULT_TEXT_COLOR,
              ),
            ),
            trailing: Wrap(
              children: [
                // IconButton(
                //   onPressed: () async {
                //     final Uri uri =
                //         Uri(scheme: 'tel', path: user[index].contactNumber);
                //     if (await canLaunchUrl(uri)) {
                //       await launchUrl(uri);
                //     } else {
                //       throw 'Could not launch $uri';
                //     }
                //   },
                //   icon: Icon(
                //     Icons.call,
                //     color: DEFAULT_TEXT_COLOR,
                //   ),
                //   padding: EdgeInsets.zero,
                //   constraints: BoxConstraints(),
                // ),
                IconButton(
                  onPressed: () {
                    Clipboard.setData(
                        ClipboardData(text: user[index].giftAccountDetails));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('계좌번호가 복사되었습니다.'),
                        duration: Duration(
                          seconds: 2,
                        ),
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.wallet_giftcard_outlined,
                    color: DEFAULT_TEXT_COLOR,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
