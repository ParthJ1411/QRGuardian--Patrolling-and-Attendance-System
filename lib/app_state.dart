import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  bool _makePhoto = false;
  bool get makePhoto => _makePhoto;
  set makePhoto(bool _value) {
    _makePhoto = _value;
  }

  String _fileBase64 = '';
  String get fileBase64 => _fileBase64;
  set fileBase64(String _value) {
    _fileBase64 = _value;
  }

  bool _PrideState = false;
  bool get PrideState => _PrideState;
  set PrideState(bool _value) {
    _PrideState = _value;
  }

  bool _HostelParkingState = false;
  bool get HostelParkingState => _HostelParkingState;
  set HostelParkingState(bool _value) {
    _HostelParkingState = _value;
  }

  bool _BoysHostelState = false;
  bool get BoysHostelState => _BoysHostelState;
  set BoysHostelState(bool _value) {
    _BoysHostelState = _value;
  }

  bool _TakshashilaState = false;
  bool get TakshashilaState => _TakshashilaState;
  set TakshashilaState(bool _value) {
    _TakshashilaState = _value;
  }

  bool _AcademicState = false;
  bool get AcademicState => _AcademicState;
  set AcademicState(bool _value) {
    _AcademicState = _value;
  }

  bool _PPCRCstate = false;
  bool get PPCRCstate => _PPCRCstate;
  set PPCRCstate(bool _value) {
    _PPCRCstate = _value;
  }

  bool _WoodsState = false;
  bool get WoodsState => _WoodsState;
  set WoodsState(bool _value) {
    _WoodsState = _value;
  }

  bool _AttendanceState = false;
  bool get AttendanceState => _AttendanceState;
  set AttendanceState(bool _value) {
    _AttendanceState = _value;
  }
}
