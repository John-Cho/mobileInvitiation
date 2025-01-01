import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobileinvitiation/common/constans.dart';

final providerUserData = StateNotifierProvider<UserDataNotifier, UserDataBase>(
  (ref) => UserDataNotifier(),
);

class UserDataNotifier extends StateNotifier<UserDataBase> {
  UserDataNotifier() : super(UserDataBase()){
    final PersonData groom = PersonData(name: '조재우',
      contactNumber: '010-5788-9302',
      giftAccountDetails: '1111-1111-1111 카카오뱅크',);

    final PersonData groomMom = PersonData(name: '윤경순',
      contactNumber: '010-5788-9302',
      giftAccountDetails: '1111-1111-1111 카카오뱅크',);

    final PersonData groomDad = PersonData(name: '조현덕',
      contactNumber: '010-5788-9302',
      giftAccountDetails: '1111-1111-1111 카카오뱅크',);

    final PersonData bride = PersonData(name: '김예경',
      contactNumber: '010-5788-9302',
      giftAccountDetails: '1111-1111-1111 카카오뱅크',);

    final PersonData brideMom = PersonData(name: '차경숙',
      contactNumber: '010-5788-9302',
      giftAccountDetails: '1111-1111-1111 카카오뱅크',);

    final PersonData brideDad = PersonData(name: '김명렬',
      contactNumber: '010-5788-9302',
      giftAccountDetails: '1111-1111-1111 카카오뱅크',);


    final UserData users = UserData(
      groom: groom,
      groomMom: groomMom,
      groomDad: groomDad,
      bride: bride,
      brideMob: brideMom,
      brideDad: brideDad,
      weddingDate: '2025년 3월 15일',
      weddingTime: '오후2시',
      venueName: '노블발렌티 대치점',
      venueAddress: '서울특별시 강남구 영동대로 325 L층',
      invitationMessage: '''
    서로를 모르고 살아온 날보다
    앞으로 함께 살아갈 날이
    훨씬 많다는 사실이 행복합니다
    서로를 영원히 귀히 여기겠습니다
    그 시작의 자리에 함께 하시어
    축복해 주시면 감사하겠습니다
    ''',
      quote: '''
    서로의 차이를 이해하고
    받아들이는 것이
    결혼의 기쁨이자
    아름다움이다.
    
    영화[어바웃 타임] 태사 중에서
    ''',
      themeColor: DEFAULT_BG_COLOR,
    );

    state = users;
  }
}

class UserDataBase {}

class UserData extends UserDataBase {
  // 신랑정보
  final PersonData groom;
  final PersonData groomMom;
  final PersonData groomDad;

  // 신부정보
  final PersonData bride;
  final PersonData brideMob;
  final PersonData brideDad;

  // 결혼식 정보
  final String weddingDate; // 결혼식 날짜
  final String weddingTime; // 결혼식 시간
  final String venueName; // 장소 이름
  final String venueAddress; // 장소 주소
  final String? venueMapLink; // 지도 링크 (Google Maps 등)

  // 초대글 및 명언
  final String invitationMessage; // 초대 메시지
  final String quote; // 명언

  // 디자인 요소
  final String? backgroundImage; // 배경 이미지 경로/URL
  final Color themeColor; // 테마 색상

  // SNS/공유 링크
  final String? shareLink;

  UserData({
    required this.groom,
    required this.groomMom,
    required this.groomDad,
    required this.bride,
    required this.brideMob,
    required this.brideDad,
    required this.weddingDate,
    required this.weddingTime,
    required this.venueName,
    required this.venueAddress,
    this.venueMapLink,
    required this.invitationMessage,
    required this.quote,
    this.backgroundImage,
    required this.themeColor,
    this.shareLink,
  }); // 청첩장 공유 링크
}

class PersonData {
  final String name;
  final String contactNumber; // 연락처
  final String giftAccountDetails;

  PersonData({
    required this.name,
    required this.contactNumber,
    required this.giftAccountDetails,
  }); // 축의금 계좌 정보 (선택 사항)
}
