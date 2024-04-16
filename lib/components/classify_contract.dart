import 'dart:ui';

// 계약행위 클래스
class PurposeAct {
  String name;
  String division;
  bool issue; // 발행여부
  bool public; // 공모 여부
  bool sell; // 매도 여부
  bool tenderOffer; // 공개매수 여부

  PurposeAct(
      {this.name = '사모',
      this.division = '사모',
      this.issue = true,
      this.public = false,
      this.sell = true,
      this.tenderOffer = false});
}

// 금융투자업자 역할 클래스
class IBRole {
  String contractActName;
  String roleName;
  bool recommend; //청약 권유 여부
  bool mandate; // 위임 여부
  bool agent; // 대리 여부
  bool acquisition; // 취득여부

  IBRole(
      {this.contractActName = '잔액인수',
      this.roleName = '인수',
      this.recommend = true,
      this.mandate = true,
      this.agent = true,
      this.acquisition = true});
}

// 증권 클래스
class Security {
  String name;
  String sort;
  String initial;
  String division;
  bool stocks;
  bool contain;

  Security(
      {this.name = '(일반)사채',
      this.sort = '채무증권',
      this.initial = '사채',
      this.division = '회사채',
      this.stocks = true,
      this.contain = true});
}

// 배정 방법 클래스
class Allocation {
  String name;
  String method;
  String priorWhom;
  bool overSubscription;
  bool forESOP; //Employee Stock Ownership Association
  bool newStocks;

  Allocation(
      {this.name = '청약인 배정',
      this.method = '청약인 배정',
      this.priorWhom = '-',
      this.overSubscription = false,
      this.forESOP = false,
      this.newStocks = false});
}

// 실권주 처리 클래스
class Forfeit {
  String name;
  bool acquisition;
  String disposal;

  Forfeit({this.name = '미발행', this.acquisition = false, this.disposal = '-'});
}
