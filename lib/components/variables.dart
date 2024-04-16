import 'constant.dart';

String selectedWork = '/';
String selectedObject = securityList.first;
String selectedAct = purposeActList.first;
String selectedRole = ibRoleList.first;
String selectedAlloc = allocList.first;
String selectedDetailAlloc = '-';
String selectedPurpose = advisePurposeList.first;
String selectedForfeit = '미발행';

DateTime selectedBODDate = DateTime.now();
DateTime selectedTradingDate = DateTime.now();

double marginSize = 7;
double boxWidth = 250.0;

bool newStocks = false;
bool advisoryOrNot = false;
bool onPublic = true;

int reviseReportNum = 0;
int settleMonth = 12;
