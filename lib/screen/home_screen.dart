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
      title: '재우 ♥ 예경',
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30.0),
              const Text(
                '결혼합니다',
                style: TextStyle(
                  fontSize: 20.0,
                  color: DEFAULT_TEXT_COLOR,
                  letterSpacing: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 25.0),
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Image.asset(
                      'asset/img/home.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
              _sizedbox(),
              Lottie.asset(
                'asset/lottie/grey_lottie.json',
                width: 160,
                fit: BoxFit.cover,
              ),
              _sizedbox(),
              _divider(),
              _sizedbox(height: 30.0),
              Text(
                data.quote,
                style: const TextStyle(
                  color: DEFAULT_TEXT_COLOR,
                  fontSize: 14.0,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              _sizedbox(),
              _divider(),
              _sizedbox(),
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
                  height: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              _sizedbox(),
              _divider(),
              _sizedbox(),
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
                    width: 10.0,
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
              Text(
                '노블발렌티 대치점',
                style: TextStyle(
                  fontSize: 14.0,
                  color: DEFAULT_TEXT_COLOR,
                ),
              ),
              _sizedbox(height: 8),
              Text(
                '삼성점이 아닌 대치점입니다.',
                style: TextStyle(
                  fontSize: 10.0,
                  color: DEFAULT_TEXT_COLOR,
                ),
              ),
              _sizedbox(height: 8),
              CalenderScreen(
                selectedDay: DateFormat('yyyy년 M월 d일').parse(data.weddingDate),
              ),

              _sizedbox(),
              _divider(),
              _sizedbox(),
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
              _contact(
                '신랑에게 축하인사',
                'asset/img/groom.png',
                data.groom.contactNumber,
              ),
              _contact(
                '신부에게 축하인사',
                'asset/img/bride.png',
                data.bride.contactNumber,
              ),
              _divider(),
              _sizedbox(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('신랑측 혼주', style: TextStyle(color: DEFAULT_TEXT_COLOR, fontSize: 14.0),),
                      _contact(
                        '아버지 ${data.groomDad.name}',
                        null,
                        data.groomDad.contactNumber,
                      ),
                      _contact(
                        '어머니 ${data.groomMom.name}',
                        null,
                        data.groomMom.contactNumber,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('신부측 혼주', style: TextStyle(color: DEFAULT_TEXT_COLOR, fontSize: 14.0),),
                      _contact(
                        '아버지 ${data.brideDad.name}',
                        null,
                        data.brideDad.contactNumber,
                      ),
                      _contact(
                        '어머니 ${data.brideMob.name}',
                        null,
                        data.brideMob.contactNumber,
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Divider(
        height: 1.5,
      ),
    );
  }

  static Widget _sizedbox({double? height = 16.0}) {
    return SizedBox(
      height: height,
    );
  }

  Widget _contact(String name, String? imgPath, String number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if(imgPath != null)
        Image.asset(
          imgPath,
          width: 20,
          height: 20,
        ),
        Text(
          '$name',
          style: TextStyle(
            fontSize: 16.0,
            color: DEFAULT_TEXT_COLOR,
          ),
        ),
        IconButton(
          onPressed: () async {
            final Uri uri = Uri(scheme: 'tel', path: number);
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
        )
      ],
    );
  }
}
