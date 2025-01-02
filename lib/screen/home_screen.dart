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
import 'package:mobileinvitiation/layout/default_layout.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(providerUserData) as UserData;

    return DefaultLayout(
      backgroundColor: data.themeColor,
      title: '재우 · 예경',
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
                      'asset/img/home.png',
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
              const Text(
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
                'asset/img/gallery.png',
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
              _sizedbox(),
              Image.asset('asset/img/calender.png', fit: BoxFit.cover,),
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
              _sizedbox(),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: const Image(
                  image: AssetImage('asset/img/maps.png'),
                  fit: BoxFit.cover,
                ),
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
              _sizedbox(),
              Image.asset('asset/img/groom.png', width: 100,),
              _contactListtile(
                context,
                [
                  data.groom,
                  data.groomDad,
                  data.groomMom,
                ],
              ),
              Image.asset('asset/img/bride.png', width: 100,),
              _contactListtile(
                context,
                [
                  data.bride,
                  data.brideDad,
                  data.brideMom,
                ],
              ),
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

  Widget _contact(BuildContext context, PersonData user, Widget subwidget) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        subwidget,
        Text(
          '${user.name}',
          style: TextStyle(
            fontSize: 14.0,
            color: DEFAULT_TEXT_COLOR,
          ),
        ),
        IconButton(
          onPressed: () async {
            final Uri uri = Uri(scheme: 'tel', path: user.contactNumber);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri);
            } else {
              throw 'Could not launch $uri';
            }
          },
          icon: Icon(
            Icons.call,
            color: Colors.white,
            size: 20.0,
          ),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
        IconButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: user.giftAccountDetails));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('계좌번호가 복사되었습니다.'),
                duration: Duration(
                  seconds: 2,
                ),
              ),
            );
          },
          icon: Icon(Icons.wallet_giftcard_outlined,
              color: Colors.white, size: 20.0),
          padding: EdgeInsets.zero,
          constraints: BoxConstraints(),
        ),
      ],
    );
  }

  // 신랑측
  // 신부측

  Widget _contactListtile(BuildContext context, List<PersonData> user) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: user.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1.5)
              ),
              child: CircleAvatar(
                backgroundColor: DEFAULT_BG_COLOR,
                child: Text(
                  user[index].type,
                  style: TextStyle(
                    fontSize: 10.0,
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
              "${user[index].giftAccountDetails}   [${user[index].backType}]",
              style: TextStyle(
                fontSize: 10.0,
                color: DEFAULT_TEXT_COLOR,
              ),
            ),
            trailing: Wrap(
              children: [
                IconButton(
                  onPressed: () async {
                    final Uri uri =
                        Uri(scheme: 'tel', path: user[index].contactNumber);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      throw 'Could not launch $uri';
                    }
                  },
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.zero,
                  constraints: BoxConstraints(),
                ),
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
                  icon: Icon(Icons.wallet_giftcard_outlined,
                      color: Colors.white),
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
