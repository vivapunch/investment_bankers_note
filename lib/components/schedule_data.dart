import 'dart:ffi';

class ProcessProperty {
  // String name;
  List<String> standardDateList;
  int differentDays;
  String periodType;
  WhenUse? usage;

  ProcessProperty({
    // required this.name,
    required this.standardDateList,
    this.differentDays = 0,
    this.periodType = '일',
    this.usage,
  });
}

class WhenUse {
  String? purposeActName;
  String? purposeActdivision;
  bool? issue; // 발행여부
  bool? public; // 공모 여부
  bool? sell; // 매도 여부
  bool? tenderOffer; // 공개매수 여부
  String? contractActName;
  String? roleName;
  bool? recommend; //청약 권유 여부
  bool? mandate; // 위임 여부
  bool? agent; // 대리 여부
  bool? acquisition; // 취득여부
  String? securityName;
  String? securitySort;
  String? securityInitial;
  String? securityDivision;
  bool? stocks;
  String? allocationName;
  String? allocationMethod;
  String? priorWhom;
  bool? overSubscription;
  bool? forESOP; //Employee Stock Ownership Association
  bool? newStocks;
  String? forfeitName;
  bool? forfeitAcquisition;
  String? disposal;

  WhenUse({
    this.purposeActName,
    this.purposeActdivision,
    this.issue,
    this.public,
    this.sell,
    this.tenderOffer,
    this.contractActName,
    this.roleName,
    this.recommend,
    this.mandate,
    this.agent,
    this.acquisition,
    this.securityName,
    this.securitySort,
    this.securityInitial,
    this.securityDivision,
    this.stocks,
    this.allocationName,
    this.allocationMethod,
    this.priorWhom,
    this.overSubscription,
    this.forESOP,
    this.newStocks,
    this.forfeitName,
    this.forfeitAcquisition,
    this.disposal,
  });
}

class ProcessList {
  final Map<String, ProcessProperty> processMap = {
    "발행인관리계좌개설/업무참가 신청": ProcessProperty(
        standardDateList: ["이사회 결의일"],
        differentDays: -2,
        periodType: '주',
        usage: WhenUse(issue: true, securityInitial: "사채")),
    "원리금지급대행은행 선정": ProcessProperty(
        standardDateList: ["이사회 결의일"],
        differentDays: -7,
        periodType: '일',
        usage: WhenUse(issue: true, securitySort: "채무증권")),
    "표준코드시스템 ID/PW 확인": ProcessProperty(
        standardDateList: ["이사회 결의일"],
        differentDays: -1,
        periodType: '영업일',
        usage: WhenUse(issue: true, securityInitial: "사채")),
    "신용평가 신청": ProcessProperty(
        standardDateList: ["이사회 결의일"],
        differentDays: -1,
        periodType: '개월',
        usage: WhenUse(issue: true, securityInitial: "사채", public: true)),
    "정관정비 또는 주총특별결의(제3자배정)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "기업실사": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "교환가액 확정": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "행사가액 확정": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "전환가액 확정": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 예정 발행가액": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 발행가액 확정(제3자배정, 전매제한 조치)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "사채 발행 이사회결의": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주 발행 이사회결의": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "인수계약서 체결": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주요사항보고서 공시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "채권표준코드 신청": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "원리금지급대행계약 체결": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주 제3자배정 공고": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주배정기준일 지정·공고": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "증권신고서(채무증권) 제출": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "증권신고서(지분증권) 제출": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "효력발생": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "수요예측": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "정정신고서(모집·매출가액 및 발행이자율 변경)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "정정신고서(사채거래수익율 변경)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "투자설명서": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 1차 발행가액 산정(주주배정 후 실권주 일반공모)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주주배정 증자 권리락": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주배정기준일": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주배정 대상 주주명부 수령": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주배정 안내 및 신주청약서 발송": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 상장 신청": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 발행": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 신규상장": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 상장폐지": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 양도제한": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주주우선증자 권리락": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "우선청약 주주확정일": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "우선청약 주주명부 수령": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "우선청약 안내 및 신주청약서 발송": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 배정 주주확정일": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 배정 대상 주주명부 수령": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 배정 안내 및 사채청약서 발송": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 우선청약 주주확정일": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 우선청약 주주명부 수령": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 우선청약 안내 및 사채청약서 발송": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 발행가액 확정(주주배정 후 실권주 일반공모)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 발행가액 확정(제3자배정)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 발행가액 확정(일반공모)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "정정신고서(발행가액 확정)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "우리사주조합 청약": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "제3자 배정 사채 청약": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "제3자 배정 주권관련사채 청약": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "제3자 배정 신주 청약": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 보유 주주 청약 개시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권증서 보유 주주 청약 종료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "배정주주 사채청약 개시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "배정주주 사채청약 종료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주주 우선 청약 개시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주주 우선 청약 종료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "일반공모 청약 개시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주주우선청약 후 일반공모 청약 개시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "수요예측 후 일반공모 청약 개시": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "일반공모 청약 종료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유상증자 청약결과 공시(자율공시)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 청약결과 공시(자율공시)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "실권주 처리 이사회 개최": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 실권분 처리 이사회 개최": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "실권주 우리사주조합 배정∙청약": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주권관련사채 실권분 우리사주조합 배정∙청약": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "사채 인수대금 납입": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주식 인수대금 납입": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "사채 등록발행": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "증권발행결과(자율공시)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "증권발행실적보고서 제출": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "주식의 발행": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주 발행 변경등기신청": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "전환사채 발행 변경등기신청": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권부사채 발행 변경등기신청": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주 발행 변경등기완료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "전환사채 발행 변경등기완료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주인수권부사채 발행 변경등기완료": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "발행등록사실확인서 발급": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "신주권 추가상장 신청": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "유통일(상장일)": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    ),
    "세무서 지급명세서 제출": ProcessProperty(
      standardDateList: ["이사회 결의일"],
    )
  };

  List<String> getNameList() {
    List<String> processNames = processMap.keys.toList();
    return processNames;
  }
}
