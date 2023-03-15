import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _navBarIndex = await secureStorage.getInt('ff_navBarIndex') ?? _navBarIndex;
    _valittuTreenattavaHistorianSessioRef = (await secureStorage
                .getString('ff_valittuTreenattavaHistorianSessioRef'))
            ?.ref ??
        _valittuTreenattavaHistorianSessioRef;
    if (await secureStorage.read(key: 'ff_valittuTreenattavaTreeniRutiini') !=
        null) {
      try {
        _valittuTreenattavaTreeniRutiini = jsonDecode(await secureStorage
                .getString('ff_valittuTreenattavaTreeniRutiini') ??
            '');
      } catch (e) {
        print("Can't decode persisted json. Error: $e.");
      }
    }

    _testBoolean =
        await secureStorage.getBool('ff_testBoolean') ?? _testBoolean;
    _testBooleanList = (await secureStorage.getStringList('ff_testBooleanList'))
            ?.map((x) => x == 'true')
            .toList() ??
        _testBooleanList;
    _testColor =
        _colorFromIntValue(await secureStorage.getInt('ff_testColor')) ??
            _testColor;
    _testColorList = (await secureStorage.getStringList('ff_testColorList'))
            ?.map((x) => Color(int.tryParse(x) ?? 0))
            .toList() ??
        _testColorList;
    _testImagePath =
        await secureStorage.getString('ff_testImagePath') ?? _testImagePath;
    _testImagePathList =
        (await secureStorage.getStringList('ff_testImagePathList')) ??
            _testImagePathList;
    _testVideoPath =
        await secureStorage.getString('ff_testVideoPath') ?? _testVideoPath;
    _testVideoPathList =
        (await secureStorage.getStringList('ff_testVideoPathList')) ??
            _testVideoPathList;
    _testAudioPath =
        await secureStorage.getString('ff_testAudioPath') ?? _testAudioPath;
    _testAudioPathList =
        (await secureStorage.getStringList('ff_testAudioPathList')) ??
            _testAudioPathList;
    _testDocRefList = (await secureStorage.getStringList('ff_testDocRefList'))
            ?.map((path) => path.ref)
            .toList() ??
        _testDocRefList;
    _testTimestamp = await secureStorage.read(key: 'ff_testTimestamp') != null
        ? DateTime.fromMillisecondsSinceEpoch(
            (await secureStorage.getInt('ff_testTimestamp'))!)
        : null;
    _testTimestampList =
        (await secureStorage.getStringList('ff_testTimestampList'))
                ?.map((x) => DateTime.fromMillisecondsSinceEpoch(int.parse(x)))
                .toList() ??
            _testTimestampList;
    _testJsonList =
        (await secureStorage.getStringList('ff_testJsonList'))?.map((x) {
              try {
                return jsonDecode(x);
              } catch (e) {
                print("Can't decode persisted json. Error: $e.");
                return {};
              }
            }).toList() ??
            _testJsonList;
  /*   _testLatLngList = (await secureStorage.getStringList('ff_testLatLngList'))
            ?.map(_latLngFromString)
            .toList() ??
        _testLatLngList; */
    _testLatLng =
        _latLngFromString(await secureStorage.getString('ff_testLatLng')) ??
            _testLatLng;
    _isCreatingRutiini = await secureStorage.getBool('ff_isCreatingRutiini') ??
        _isCreatingRutiini;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  int _navBarIndex = 0;
  int get navBarIndex => _navBarIndex;
  set navBarIndex(int _value) {
    _navBarIndex = _value;
    secureStorage.setInt('ff_navBarIndex', _value);
  }

  void deleteNavBarIndex() {
    secureStorage.delete(key: 'ff_navBarIndex');
  }

  DocumentReference? _valittuTreenattavaHistorianSessioRef;
  DocumentReference? get valittuTreenattavaHistorianSessioRef =>
      _valittuTreenattavaHistorianSessioRef;
  set valittuTreenattavaHistorianSessioRef(DocumentReference? _value) {
    _valittuTreenattavaHistorianSessioRef = _value;
    _value != null
        ? secureStorage.setString(
            'ff_valittuTreenattavaHistorianSessioRef', _value.path)
        : secureStorage.remove('ff_valittuTreenattavaHistorianSessioRef');
  }

  void deleteValittuTreenattavaHistorianSessioRef() {
    secureStorage.delete(key: 'ff_valittuTreenattavaHistorianSessioRef');
  }

  dynamic _valittuTreenattavaTreeniRutiini;
  dynamic get valittuTreenattavaTreeniRutiini =>
      _valittuTreenattavaTreeniRutiini;
  set valittuTreenattavaTreeniRutiini(dynamic _value) {
    _valittuTreenattavaTreeniRutiini = _value;
    secureStorage.setString(
        'ff_valittuTreenattavaTreeniRutiini', jsonEncode(_value));
  }

  void deleteValittuTreenattavaTreeniRutiini() {
    secureStorage.delete(key: 'ff_valittuTreenattavaTreeniRutiini');
  }

  bool _testBoolean = false;
  bool get testBoolean => _testBoolean;
  set testBoolean(bool _value) {
    _testBoolean = _value;
    secureStorage.setBool('ff_testBoolean', _value);
  }

  void deleteTestBoolean() {
    secureStorage.delete(key: 'ff_testBoolean');
  }

  List<bool> _testBooleanList = [];
  List<bool> get testBooleanList => _testBooleanList;
  set testBooleanList(List<bool> _value) {
    _testBooleanList = _value;
    secureStorage.setStringList(
        'ff_testBooleanList', _value.map((x) => x.toString()).toList());
  }

  void deleteTestBooleanList() {
    secureStorage.delete(key: 'ff_testBooleanList');
  }

  void addToTestBooleanList(bool _value) {
    _testBooleanList.add(_value);
    secureStorage.setStringList('ff_testBooleanList',
        _testBooleanList.map((x) => x.toString()).toList());
  }

  void removeFromTestBooleanList(bool _value) {
    _testBooleanList.remove(_value);
    secureStorage.setStringList('ff_testBooleanList',
        _testBooleanList.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromTestBooleanList(int _index) {
    _testBooleanList.removeAt(_index);
    secureStorage.setStringList('ff_testBooleanList',
        _testBooleanList.map((x) => x.toString()).toList());
  }

  Color _testColor = Colors.transparent;
  Color get testColor => _testColor;
  set testColor(Color _value) {
    _testColor = _value;
    secureStorage.setString('ff_testColor', _value.value.toString());
  }

  void deleteTestColor() {
    secureStorage.delete(key: 'ff_testColor');
  }

  List<Color> _testColorList = [];
  List<Color> get testColorList => _testColorList;
  set testColorList(List<Color> _value) {
    _testColorList = _value;
    secureStorage.setStringList(
        'ff_testColorList', _value.map((x) => x.value.toString()).toList());
  }

  void deleteTestColorList() {
    secureStorage.delete(key: 'ff_testColorList');
  }

  void addToTestColorList(Color _value) {
    _testColorList.add(_value);
    secureStorage.setStringList('ff_testColorList',
        _testColorList.map((x) => x.value.toString()).toList());
  }

  void removeFromTestColorList(Color _value) {
    _testColorList.remove(_value);
    secureStorage.setStringList('ff_testColorList',
        _testColorList.map((x) => x.value.toString()).toList());
  }

  void removeAtIndexFromTestColorList(int _index) {
    _testColorList.removeAt(_index);
    secureStorage.setStringList('ff_testColorList',
        _testColorList.map((x) => x.value.toString()).toList());
  }

  String _testImagePath = '';
  String get testImagePath => _testImagePath;
  set testImagePath(String _value) {
    _testImagePath = _value;
    secureStorage.setString('ff_testImagePath', _value);
  }

  void deleteTestImagePath() {
    secureStorage.delete(key: 'ff_testImagePath');
  }

  List<String> _testImagePathList = [];
  List<String> get testImagePathList => _testImagePathList;
  set testImagePathList(List<String> _value) {
    _testImagePathList = _value;
    secureStorage.setStringList('ff_testImagePathList', _value);
  }

  void deleteTestImagePathList() {
    secureStorage.delete(key: 'ff_testImagePathList');
  }

  void addToTestImagePathList(String _value) {
    _testImagePathList.add(_value);
    secureStorage.setStringList('ff_testImagePathList', _testImagePathList);
  }

  void removeFromTestImagePathList(String _value) {
    _testImagePathList.remove(_value);
    secureStorage.setStringList('ff_testImagePathList', _testImagePathList);
  }

  void removeAtIndexFromTestImagePathList(int _index) {
    _testImagePathList.removeAt(_index);
    secureStorage.setStringList('ff_testImagePathList', _testImagePathList);
  }

  String _testVideoPath = '';
  String get testVideoPath => _testVideoPath;
  set testVideoPath(String _value) {
    _testVideoPath = _value;
    secureStorage.setString('ff_testVideoPath', _value);
  }

  void deleteTestVideoPath() {
    secureStorage.delete(key: 'ff_testVideoPath');
  }

  List<String> _testVideoPathList = [];
  List<String> get testVideoPathList => _testVideoPathList;
  set testVideoPathList(List<String> _value) {
    _testVideoPathList = _value;
    secureStorage.setStringList('ff_testVideoPathList', _value);
  }

  void deleteTestVideoPathList() {
    secureStorage.delete(key: 'ff_testVideoPathList');
  }

  void addToTestVideoPathList(String _value) {
    _testVideoPathList.add(_value);
    secureStorage.setStringList('ff_testVideoPathList', _testVideoPathList);
  }

  void removeFromTestVideoPathList(String _value) {
    _testVideoPathList.remove(_value);
    secureStorage.setStringList('ff_testVideoPathList', _testVideoPathList);
  }

  void removeAtIndexFromTestVideoPathList(int _index) {
    _testVideoPathList.removeAt(_index);
    secureStorage.setStringList('ff_testVideoPathList', _testVideoPathList);
  }

  String _testAudioPath = '';
  String get testAudioPath => _testAudioPath;
  set testAudioPath(String _value) {
    _testAudioPath = _value;
    secureStorage.setString('ff_testAudioPath', _value);
  }

  void deleteTestAudioPath() {
    secureStorage.delete(key: 'ff_testAudioPath');
  }

  List<String> _testAudioPathList = [];
  List<String> get testAudioPathList => _testAudioPathList;
  set testAudioPathList(List<String> _value) {
    _testAudioPathList = _value;
    secureStorage.setStringList('ff_testAudioPathList', _value);
  }

  void deleteTestAudioPathList() {
    secureStorage.delete(key: 'ff_testAudioPathList');
  }

  void addToTestAudioPathList(String _value) {
    _testAudioPathList.add(_value);
    secureStorage.setStringList('ff_testAudioPathList', _testAudioPathList);
  }

  void removeFromTestAudioPathList(String _value) {
    _testAudioPathList.remove(_value);
    secureStorage.setStringList('ff_testAudioPathList', _testAudioPathList);
  }

  void removeAtIndexFromTestAudioPathList(int _index) {
    _testAudioPathList.removeAt(_index);
    secureStorage.setStringList('ff_testAudioPathList', _testAudioPathList);
  }

  List<DocumentReference> _testDocRefList = [];
  List<DocumentReference> get testDocRefList => _testDocRefList;
  set testDocRefList(List<DocumentReference> _value) {
    _testDocRefList = _value;
    secureStorage.setStringList(
        'ff_testDocRefList', _value.map((x) => x.path).toList());
  }

  void deleteTestDocRefList() {
    secureStorage.delete(key: 'ff_testDocRefList');
  }

  void addToTestDocRefList(DocumentReference _value) {
    _testDocRefList.add(_value);
    secureStorage.setStringList(
        'ff_testDocRefList', _testDocRefList.map((x) => x.path).toList());
  }

  void removeFromTestDocRefList(DocumentReference _value) {
    _testDocRefList.remove(_value);
    secureStorage.setStringList(
        'ff_testDocRefList', _testDocRefList.map((x) => x.path).toList());
  }

  void removeAtIndexFromTestDocRefList(int _index) {
    _testDocRefList.removeAt(_index);
    secureStorage.setStringList(
        'ff_testDocRefList', _testDocRefList.map((x) => x.path).toList());
  }

  DateTime? _testTimestamp;
  DateTime? get testTimestamp => _testTimestamp;
  set testTimestamp(DateTime? _value) {
    _testTimestamp = _value;
    _value != null
        ? secureStorage.setInt(
            'ff_testTimestamp', _value.millisecondsSinceEpoch)
        : secureStorage.remove('ff_testTimestamp');
  }

  void deleteTestTimestamp() {
    secureStorage.delete(key: 'ff_testTimestamp');
  }

  List<DateTime> _testTimestampList = [];
  List<DateTime> get testTimestampList => _testTimestampList;
  set testTimestampList(List<DateTime> _value) {
    _testTimestampList = _value;
    secureStorage.setStringList('ff_testTimestampList',
        _value.map((x) => x.millisecondsSinceEpoch.toString()).toList());
  }

  void deleteTestTimestampList() {
    secureStorage.delete(key: 'ff_testTimestampList');
  }

  void addToTestTimestampList(DateTime _value) {
    _testTimestampList.add(_value);
    secureStorage.setStringList(
        'ff_testTimestampList',
        _testTimestampList
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeFromTestTimestampList(DateTime _value) {
    _testTimestampList.remove(_value);
    secureStorage.setStringList(
        'ff_testTimestampList',
        _testTimestampList
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  void removeAtIndexFromTestTimestampList(int _index) {
    _testTimestampList.removeAt(_index);
    secureStorage.setStringList(
        'ff_testTimestampList',
        _testTimestampList
            .map((x) => x.millisecondsSinceEpoch.toString())
            .toList());
  }

  List<dynamic> _testJsonList = [];
  List<dynamic> get testJsonList => _testJsonList;
  set testJsonList(List<dynamic> _value) {
    _testJsonList = _value;
    secureStorage.setStringList(
        'ff_testJsonList', _value.map((x) => jsonEncode(x)).toList());
  }

  void deleteTestJsonList() {
    secureStorage.delete(key: 'ff_testJsonList');
  }

  void addToTestJsonList(dynamic _value) {
    _testJsonList.add(_value);
    secureStorage.setStringList(
        'ff_testJsonList', _testJsonList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTestJsonList(dynamic _value) {
    _testJsonList.remove(_value);
    secureStorage.setStringList(
        'ff_testJsonList', _testJsonList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTestJsonList(int _index) {
    _testJsonList.removeAt(_index);
    secureStorage.setStringList(
        'ff_testJsonList', _testJsonList.map((x) => jsonEncode(x)).toList());
  }

  List<LatLng> _testLatLngList = [];
  List<LatLng> get testLatLngList => _testLatLngList;
  set testLatLngList(List<LatLng> _value) {
    _testLatLngList = _value;
    secureStorage.setStringList(
        'ff_testLatLngList', _value.map((x) => x.serialize()).toList());
  }

  void deleteTestLatLngList() {
    secureStorage.delete(key: 'ff_testLatLngList');
  }

  void addToTestLatLngList(LatLng _value) {
    _testLatLngList.add(_value);
    secureStorage.setStringList('ff_testLatLngList',
        _testLatLngList.map((x) => x.serialize()).toList());
  }

  void removeFromTestLatLngList(LatLng _value) {
    _testLatLngList.remove(_value);
    secureStorage.setStringList('ff_testLatLngList',
        _testLatLngList.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTestLatLngList(int _index) {
    _testLatLngList.removeAt(_index);
    secureStorage.setStringList('ff_testLatLngList',
        _testLatLngList.map((x) => x.serialize()).toList());
  }

  LatLng? _testLatLng;
  LatLng? get testLatLng => _testLatLng;
  set testLatLng(LatLng? _value) {
    _testLatLng = _value;
    _value != null
        ? secureStorage.setString('ff_testLatLng', _value.serialize())
        : secureStorage.remove('ff_testLatLng');
  }

  void deleteTestLatLng() {
    secureStorage.delete(key: 'ff_testLatLng');
  }

  bool _isEditing = false;
  bool get isEditing => _isEditing;
  set isEditing(bool _value) {
    _isEditing = _value;
  }

  bool _showTreenaaTaiLuoRutiiniSivu = false;
  bool get showTreenaaTaiLuoRutiiniSivu => _showTreenaaTaiLuoRutiiniSivu;
  set showTreenaaTaiLuoRutiiniSivu(bool _value) {
    _showTreenaaTaiLuoRutiiniSivu = _value;
  }

  bool _isCreatingRutiini = false;
  bool get isCreatingRutiini => _isCreatingRutiini;
  set isCreatingRutiini(bool _value) {
    _isCreatingRutiini = _value;
    secureStorage.setBool('ff_isCreatingRutiini', _value);
  }

  void deleteIsCreatingRutiini() {
    secureStorage.delete(key: 'ff_isCreatingRutiini');
  }

  String _searchbarText = '';
  String get searchbarText => _searchbarText;
  set searchbarText(String _value) {
    _searchbarText = _value;
  }

  List<dynamic> _kopiedLiikeListFirestoreData = [];
  List<dynamic> get kopiedLiikeListFirestoreData =>
      _kopiedLiikeListFirestoreData;
  set kopiedLiikeListFirestoreData(List<dynamic> _value) {
    _kopiedLiikeListFirestoreData = _value;
  }

  void addToKopiedLiikeListFirestoreData(dynamic _value) {
    _kopiedLiikeListFirestoreData.add(_value);
  }

  void removeFromKopiedLiikeListFirestoreData(dynamic _value) {
    _kopiedLiikeListFirestoreData.remove(_value);
  }

  void removeAtIndexFromKopiedLiikeListFirestoreData(int _index) {
    _kopiedLiikeListFirestoreData.removeAt(_index);
  }

  List<DateTime> _sessioChunkListLastItemDateTime = [];
  List<DateTime> get sessioChunkListLastItemDateTime =>
      _sessioChunkListLastItemDateTime;
  set sessioChunkListLastItemDateTime(List<DateTime> _value) {
    _sessioChunkListLastItemDateTime = _value;
  }

  void addToSessioChunkListLastItemDateTime(DateTime _value) {
    _sessioChunkListLastItemDateTime.add(_value);
  }

  void removeFromSessioChunkListLastItemDateTime(DateTime _value) {
    _sessioChunkListLastItemDateTime.remove(_value);
  }

  void removeAtIndexFromSessioChunkListLastItemDateTime(int _index) {
    _sessioChunkListLastItemDateTime.removeAt(_index);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
