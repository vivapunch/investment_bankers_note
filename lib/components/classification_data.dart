import 'classify_contract.dart';

// 계약행위 구분

class PurposeActList {
  final List<PurposeAct> _purposeAct = [
    PurposeAct(
        name: '사모',
        division: '사모',
        issue: true,
        public: false,
        sell: true,
        tenderOffer: false),
    PurposeAct(
        name: '사모(전매기준해당)',
        division: '모집',
        issue: true,
        public: true,
        sell: true,
        tenderOffer: false),
    PurposeAct(
        name: '모집',
        division: '모집',
        issue: true,
        public: true,
        sell: true,
        tenderOffer: false),
    PurposeAct(
        name: '모집・매출',
        division: '모집',
        issue: true,
        public: true,
        sell: true,
        tenderOffer: false),
    PurposeAct(
        name: '매출',
        division: '매출',
        issue: false,
        public: true,
        sell: true,
        tenderOffer: false),
    PurposeAct(
        name: '매도',
        division: '매매',
        issue: false,
        public: false,
        sell: true,
        tenderOffer: false),
    PurposeAct(
        name: '매수',
        division: '매매',
        issue: false,
        public: false,
        sell: false,
        tenderOffer: false),
    PurposeAct(
        name: '공개매수',
        division: '공개매수',
        issue: false,
        public: false,
        sell: false,
        tenderOffer: true),
  ];

  List<String> getNameList(
      {String? division, bool? issue, bool? public, bool? sell}) {
    List<String> purposeActNames = [];
    for (PurposeAct act in _purposeAct) {
      if ((division == null || act.division == division) &&
          (issue == null || act.issue == issue) &&
          (public == null || act.public == public) &&
          (sell == null || act.sell == sell)) {
        purposeActNames.add(act.name);
      }
    }
    return purposeActNames;
  }

  int getIndex(String purposeActName) {
    for (int i = 0; i < _purposeAct.length; i++) {
      if (_purposeAct[i].name == purposeActName) {
        return i;
      }
    }
    // 만약 찾는 purposeActName이 없으면 -1을 반환하거나 예외를 throw할 수 있습니다.
    // 여기서는 -1을 반환합니다.
    return -1;
  }

  String getName(int purposeActNumber) {
    return _purposeAct[purposeActNumber].name;
  }

  String getDivision(String purposeActName) {
    int purposeActNumber = getIndex(purposeActName);
    return _purposeAct[purposeActNumber].division;
  }

  bool getIssueOrNot(String purposeActName) {
    int purposeActNumber = getIndex(purposeActName);
    return _purposeAct[purposeActNumber].issue;
  }

  bool getPublicOrNot(String purposeActName) {
    int purposeActNumber = getIndex(purposeActName);
    return _purposeAct[purposeActNumber].public;
  }

  bool getSellOrNot(String purposeActName) {
    int purposeActNumber = getIndex(purposeActName);
    return _purposeAct[purposeActNumber].sell;
  }

  bool getTenderOfferOrNot(String purposeActName) {
    int purposeActNumber = getIndex(purposeActName);
    return _purposeAct[purposeActNumber].tenderOffer;
  }
}

// 금융투자업자역할 구분

class IBRoleList {
  final List<IBRole> _ibRole = [
    IBRole(
        contractActName: '잔액인수',
        roleName: '잔액인수',
        recommend: true,
        mandate: true,
        agent: true,
        acquisition: true),
    IBRole(
        contractActName: '총액인수',
        roleName: '총액인수',
        recommend: true,
        mandate: true,
        agent: true,
        acquisition: true),
    IBRole(
        contractActName: '위탁매매',
        roleName: '주선',
        recommend: true,
        mandate: true,
        agent: true,
        acquisition: false),
    IBRole(
        contractActName: '대리',
        roleName: '주선',
        recommend: true,
        mandate: true,
        agent: false,
        acquisition: false),
    IBRole(
        contractActName: '중개',
        roleName: '주선',
        recommend: true,
        mandate: false,
        agent: false,
        acquisition: false),
    IBRole(
        contractActName: '자문',
        roleName: '자문',
        recommend: false,
        mandate: false,
        agent: false,
        acquisition: false),
    IBRole(
        contractActName: '투자',
        roleName: '투자',
        recommend: false,
        mandate: false,
        agent: false,
        acquisition: true),
  ];

  List<String> getIBRoleSet() {
    Set<String> divisionSet = {};
    for (IBRole ibRole in _ibRole) {
      divisionSet.add(ibRole.roleName);
    }
    return divisionSet.toList();
  }

  // 조건에 따라 ibRoleName들의 List를 반환하는 함수
  List<String> getNameList(
      {String? roleName,
      bool? recommend,
      bool? mandate,
      bool? agent,
      bool? acquisition}) {
    List<String> ibRoleNames = [];
    for (IBRole role in _ibRole) {
      if ((roleName == null || role.roleName == roleName) &&
          (recommend == null || role.recommend == recommend) &&
          (mandate == null || role.mandate == mandate) &&
          (agent == null || role.agent == agent) &&
          (acquisition == null || role.acquisition == acquisition)) {
        ibRoleNames.add(role.contractActName);
      }
    }
    return ibRoleNames;
  }

  int getIndex(String contractActName) {
    for (int i = 0; i < _ibRole.length; i++) {
      if (_ibRole[i].contractActName == contractActName) {
        return i;
      }
    }
    // 만약 찾는 specificibRoleName이 없으면 -1을 반환하거나 예외를 throw할 수 있습니다.
    // 여기서는 -1을 반환합니다.
    return -1;
  }

  String getName(String contractActName) {
    int ibRoleNumber = getIndex(contractActName);
    return _ibRole[ibRoleNumber].contractActName;
  }

  String getRoleName(String contractActName) {
    int ibRoleNumber = getIndex(contractActName);
    return _ibRole[ibRoleNumber].roleName;
  }

  bool getRecommendOrNot(String contractActName) {
    int ibRoleNumber = getIndex(contractActName);
    return _ibRole[ibRoleNumber].recommend;
  }

  bool getMandateOrNot(String contractActName) {
    int ibRoleNumber = getIndex(contractActName);
    return _ibRole[ibRoleNumber].mandate;
  }

  bool getAgentOrNot(String contractActName) {
    int ibRoleNumber = getIndex(contractActName);
    return _ibRole[ibRoleNumber].agent;
  }

  bool getAcquisitionOrNot(String contractActName) {
    int ibRoleNumber = getIndex(contractActName);
    return _ibRole[ibRoleNumber].acquisition;
  }
}

// 증권 구분
class SecurityList {
  final List<Security> _security = [
    Security(
        name: '(일반)사채',
        sort: '채무증권',
        initial: '사채',
        division: '회사채',
        stocks: false,
        contain: true),
    Security(
        name: '전환사채',
        sort: '채무증권',
        initial: '사채',
        division: '주권관련사채',
        stocks: true,
        contain: true),
    Security(
        name: '신주인수권부사채',
        sort: '채무증권',
        initial: '사채',
        division: '주권관련사채',
        stocks: true,
        contain: true),
    Security(
        name: '교환사채',
        sort: '채무증권',
        initial: '사채',
        division: '주권관련사채',
        stocks: true,
        contain: true),
    Security(
        name: '이익참가부사채',
        sort: '채무증권',
        initial: '사채',
        division: '주권관련사채',
        stocks: true,
        contain: true),
    Security(
        name: '기업어음',
        sort: '채무증권',
        initial: '기업어음',
        division: '기업어음',
        stocks: false,
        contain: true),
    Security(
        name: '국채',
        sort: '채무증권',
        initial: '국채',
        division: '국채',
        stocks: false,
        contain: false),
    Security(
        name: '지방채',
        sort: '채무증권',
        initial: '지방채',
        division: '지방채',
        stocks: false,
        contain: false),
    Security(
        name: '특수채',
        sort: '채무증권',
        initial: '특수채',
        division: '특수채',
        stocks: false,
        contain: false),
    Security(
        name: '보통주',
        sort: '지분증권',
        initial: '주식',
        division: '보통주식',
        stocks: true,
        contain: true),
    Security(
        name: '우선주',
        sort: '지분증권',
        initial: '주식',
        division: '종류주식',
        stocks: true,
        contain: true),
    Security(
        name: '전환우선주',
        sort: '지분증권',
        initial: '주식',
        division: '종류주식',
        stocks: true,
        contain: true),
    Security(
        name: '상환우선주',
        sort: '지분증권',
        initial: '주식',
        division: '종류주식',
        stocks: true,
        contain: true),
    Security(
        name: '상환전환우선주',
        sort: '지분증권',
        initial: '주식',
        division: '종류주식',
        stocks: true,
        contain: true),
    Security(
        name: '신주인수권증서',
        sort: '지분증권',
        initial: '신주인수권',
        division: '신주인수권',
        stocks: true,
        contain: false),
    Security(
        name: '신주인수권증권',
        sort: '지분증권',
        initial: '신주인수권',
        division: '신주인수권',
        stocks: true,
        contain: false),
    Security(
        name: '출자증권',
        sort: '지분증권',
        initial: '출자증권',
        division: '출자증권',
        stocks: false,
        contain: false),
    Security(
        name: '수익증권',
        sort: '수익증권',
        initial: '증권',
        division: '수익증권',
        stocks: false,
        contain: false),
    Security(
        name: '투자계약증권',
        sort: '투자계약증권',
        initial: '증권',
        division: '투자계약증권',
        stocks: false,
        contain: false),
    Security(
        name: '파생결합증권',
        sort: '파생결합증권',
        initial: '증권',
        division: '파생결합증권',
        stocks: false,
        contain: false),
    Security(
        name: '증권예탁증권',
        sort: '증권예탁증권',
        initial: '증권',
        division: '증권예탁증권',
        stocks: false,
        contain: false),
  ];

  List<String> getDivisionSet(
      {String? sort, String? initial, bool? stocks, bool? contain}) {
    Set<String> divisionSet = {};
    for (Security security in _security) {
      if ((sort == null || security.sort == sort) &&
          (initial == null || security.initial == initial) &&
          (stocks == null || security.stocks == stocks) &&
          (contain == null || security.contain == contain)) {
        divisionSet.add(security.division);
      }
    }
    return divisionSet.toList();
  }

  // 조건에 따라 ibRoleName들의 List를 반환하는 함수
  List<String> getNameList(
      {String? sort,
      String? initial,
      String? division,
      bool? stocks,
      bool? contain}) {
    List<String> securityNames = [];
    for (Security security in _security) {
      if ((sort == null || security.sort == sort) &&
          (initial == null || security.initial == initial) &&
          (division == null || security.division == division) &&
          (stocks == null || security.stocks == stocks) &&
          (contain == null || security.contain == contain)) {
        securityNames.add(security.name);
      }
    }
    return securityNames;
  }

  int getIndex(String securityName) {
    for (int i = 0; i < _security.length; i++) {
      if (_security[i].name == securityName) {
        return i;
      }
    }
    // 만약 찾는 specificibRoleName이 없으면 -1을 반환하거나 예외를 throw할 수 있습니다.
    // 여기서는 -1을 반환합니다.
    return -1;
  }

  String getSort(String securityName) {
    int securityNumber = getIndex(securityName);
    return _security[securityNumber].sort;
  }

  String getInitial(String securityName) {
    int securityNumber = getIndex(securityName);
    return _security[securityNumber].initial;
  }

  String getDivision(String securityName) {
    int securityNumber = getIndex(securityName);
    return _security[securityNumber].division;
  }

  bool getStockOrNot(String securityName) {
    int securityNumber = getIndex(securityName);
    return _security[securityNumber].stocks;
  }
}

// 배정 방법 구분

class AllocationList {
  final List<Allocation> _allocation = [
    Allocation(
        name: '청약인 배정',
        method: '청약인 배정',
        priorWhom: '-',
        overSubscription: false,
        forESOP: false,
        newStocks: false),
    Allocation(
        name: '제3자 배정',
        method: '제3자 배정',
        priorWhom: '-',
        overSubscription: false,
        forESOP: false,
        newStocks: true),
    Allocation(
        name: '주주배정',
        method: '주주배정',
        priorWhom: '-',
        overSubscription: false,
        forESOP: false,
        newStocks: true),
    Allocation(
        name: '주주배정/초과청약',
        method: '주주배정',
        priorWhom: '-',
        overSubscription: true,
        forESOP: false,
        newStocks: true),
    Allocation(
        name: '일반공모',
        method: '일반공모',
        priorWhom: '-',
        overSubscription: false,
        forESOP: false,
        newStocks: true),
    Allocation(
        name: '주주우선/일반공모',
        method: '일반공모',
        priorWhom: '주주우선',
        overSubscription: false,
        forESOP: false,
        newStocks: true),
    Allocation(
        name: '수요예측/일반공모',
        method: '일반공모',
        priorWhom: '수요예측',
        overSubscription: false,
        forESOP: false,
        newStocks: true),
    Allocation(
        name: '우리사주조합/제3자 배정',
        method: '제3자 배정',
        priorWhom: '우리사주조합',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '우리사주조합/주주배정',
        method: '주주배정',
        priorWhom: '우리사주조합',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '우리사주조합/주주배정/초과청약',
        method: '주주배정',
        priorWhom: '우리사주조합',
        overSubscription: true,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '우리사주조합/일반공모',
        method: '일반공모',
        priorWhom: '우리사주조합',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '우리사주조합/주주우선/일반공모',
        method: '일반공모',
        priorWhom: '우리사주조합/주주우선',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '우리사주조합/수요예측/일반공모',
        method: '일반공모',
        priorWhom: '우리사주조합/수요예측',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '제3자 배정/우리사주조합',
        method: '제3자 배정',
        priorWhom: '-',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '주주배정/우리사주조합',
        method: '주주배정',
        priorWhom: '-',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '주주배정/초과청약/우리사주조합',
        method: '주주배정',
        priorWhom: '-',
        overSubscription: true,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '일반공모/우리사주조합',
        method: '일반공모',
        priorWhom: '-',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '주주우선/일반공모/우리사주조합',
        method: '일반공모',
        priorWhom: '주주우선',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
    Allocation(
        name: '수요예측/일반공모/우리사주조합',
        method: '일반공모',
        priorWhom: '수요예측',
        overSubscription: false,
        forESOP: true,
        newStocks: true),
  ];
// 배정 관련 함수 만들기
  List<String> getMethodSet(
      {String? priorWhom,
      bool? overSubscription,
      bool? forESOP,
      bool? newStocks}) {
    Set<String> methodSet = {};
    for (Allocation allocation in _allocation) {
      if ((priorWhom == null || allocation.priorWhom == priorWhom) &&
          (overSubscription == null ||
              allocation.overSubscription == overSubscription) &&
          (forESOP == null || allocation.forESOP == forESOP) &&
          (newStocks == null || allocation.newStocks == newStocks)) {
        methodSet.add(allocation.method);
      }
    }
    return methodSet.toList();
  }

  // 조건에 따라 ibRoleName들의 List를 반환하는 함수
  List<String> getNameList(
      {String? priorWhom,
      String? method,
      bool? overSubscription,
      bool? forESOP,
      bool? newStocks}) {
    List<String> allocationNames = [];
    for (Allocation allocation in _allocation) {
      if ((priorWhom == null || allocation.priorWhom == priorWhom) &&
          (method == null || allocation.method == method) &&
          (overSubscription == null ||
              allocation.overSubscription == overSubscription) &&
          (forESOP == null || allocation.forESOP == forESOP) &&
          (newStocks == null || allocation.newStocks == newStocks)) {
        allocationNames.add(allocation.name);
      }
    }
    return allocationNames;
  }

  int getIndex(String allocationName) {
    for (int i = 0; i < _allocation.length; i++) {
      if (_allocation[i].name == allocationName) {
        return i;
      }
    }
    // 만약 찾는 specificibRoleName이 없으면 -1을 반환하거나 예외를 throw할 수 있습니다.
    // 여기서는 -1을 반환합니다.
    return -1;
  }

  String getMethod(String allocationName) {
    int allocationNumber = getIndex(allocationName);
    return _allocation[allocationNumber].method;
  }

  String getPriorWhom(String allocationName) {
    int allocationNumber = getIndex(allocationName);
    return _allocation[allocationNumber].priorWhom;
  }

  bool getOverSubscription(String allocationName) {
    int allocationNumber = getIndex(allocationName);
    return _allocation[allocationNumber].overSubscription;
  }

  bool getESOP(String allocationName) {
    int allocationNumber = getIndex(allocationName);
    return _allocation[allocationNumber].forESOP;
  }

  bool getNewStocksOrNot(String allocationName) {
    int allocationNumber = getIndex(allocationName);
    return _allocation[allocationNumber].newStocks;
  }
}

// 실권주 처리 구분
class ForfeitList {
  final List<Forfeit> _forfeit = [
    Forfeit(name: '미발행', acquisition: false, disposal: '-'),
    Forfeit(name: '실권주 인수', acquisition: true, disposal: '인수'),
    Forfeit(name: '실권주 일반공모', acquisition: true, disposal: '일반공모'),
    Forfeit(name: '실권주 제3자 배정', acquisition: true, disposal: '제3자 배정'),
  ];

// 실권주 관련 함수

  List<String> getNameList({bool? acquisition, String? disposal}) {
    List<String> forfeitNames = [];
    for (Forfeit forfeit in _forfeit) {
      if ((acquisition == null || forfeit.acquisition == acquisition) &&
          (disposal == null || forfeit.disposal == disposal)) {
        forfeitNames.add(forfeit.name);
      }
    }
    return forfeitNames;
  }

  int getIndex(String forfeitName) {
    for (int i = 0; i < _forfeit.length; i++) {
      if (_forfeit[i].name == forfeitName) {
        return i;
      }
    }
    // 만약 찾는 purposeActName이 없으면 -1을 반환하거나 예외를 throw할 수 있습니다.
    // 여기서는 -1을 반환합니다.
    return -1;
  }

  String getName(int forfeitNumber) {
    return _forfeit[forfeitNumber].name;
  }

  bool getAcquisitionOrNot(String forfeitName) {
    int forfeitNumber = getIndex(forfeitName);
    return _forfeit[forfeitNumber].acquisition;
  }

  String getDisposal(String forfeitName) {
    int forfeitNumber = getIndex(forfeitName);
    return _forfeit[forfeitNumber].disposal;
  }
}
