import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _sports = prefs.getStringList('ff_sports') ?? _sports;
    });
    _safeInit(() {
      _concerts = prefs.getStringList('ff_concerts') ?? _concerts;
    });
    _safeInit(() {
      _shows = prefs.getStringList('ff_shows') ?? _shows;
    });
    _safeInit(() {
      _business = prefs.getStringList('ff_business') ?? _business;
    });
    _safeInit(() {
      _party = prefs.getStringList('ff_party') ?? _party;
    });
    _safeInit(() {
      _other = prefs.getStringList('ff_other') ?? _other;
    });
    _safeInit(() {
      _hasLoggedInBefore =
          prefs.getBool('ff_hasLoggedInBefore') ?? _hasLoggedInBefore;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _gender = ['Male', 'Female'];
  List<String> get gender => _gender;
  set gender(List<String> _value) {
    _gender = _value;
  }

  void addToGender(String _value) {
    _gender.add(_value);
  }

  void removeFromGender(String _value) {
    _gender.remove(_value);
  }

  void removeAtIndexFromGender(int _index) {
    _gender.removeAt(_index);
  }

  void updateGenderAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _gender[_index] = updateFn(_gender[_index]);
  }

  void insertAtIndexInGender(int _index, String _value) {
    _gender.insert(_index, _value);
  }

  List<String> _sports = [
    'Football',
    'Basketball',
    'Boxing',
    'Motorsport',
    'Marathon'
  ];
  List<String> get sports => _sports;
  set sports(List<String> _value) {
    _sports = _value;
    prefs.setStringList('ff_sports', _value);
  }

  void addToSports(String _value) {
    _sports.add(_value);
    prefs.setStringList('ff_sports', _sports);
  }

  void removeFromSports(String _value) {
    _sports.remove(_value);
    prefs.setStringList('ff_sports', _sports);
  }

  void removeAtIndexFromSports(int _index) {
    _sports.removeAt(_index);
    prefs.setStringList('ff_sports', _sports);
  }

  void updateSportsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _sports[_index] = updateFn(_sports[_index]);
    prefs.setStringList('ff_sports', _sports);
  }

  void insertAtIndexInSports(int _index, String _value) {
    _sports.insert(_index, _value);
    prefs.setStringList('ff_sports', _sports);
  }

  List<String> _concerts = [
    'Various',
    'Hip-Hop/Rap',
    'Amapiano',
    'Gospel',
    'Afro',
    'Dancehall',
    'Live Jazz',
    'Rock'
  ];
  List<String> get concerts => _concerts;
  set concerts(List<String> _value) {
    _concerts = _value;
    prefs.setStringList('ff_concerts', _value);
  }

  void addToConcerts(String _value) {
    _concerts.add(_value);
    prefs.setStringList('ff_concerts', _concerts);
  }

  void removeFromConcerts(String _value) {
    _concerts.remove(_value);
    prefs.setStringList('ff_concerts', _concerts);
  }

  void removeAtIndexFromConcerts(int _index) {
    _concerts.removeAt(_index);
    prefs.setStringList('ff_concerts', _concerts);
  }

  void updateConcertsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _concerts[_index] = updateFn(_concerts[_index]);
    prefs.setStringList('ff_concerts', _concerts);
  }

  void insertAtIndexInConcerts(int _index, String _value) {
    _concerts.insert(_index, _value);
    prefs.setStringList('ff_concerts', _concerts);
  }

  List<String> _shows = [
    'Comedy',
    'Family Shows',
    'Dance Performances',
    'Magic Shows',
    'Color Festival',
    'Award Shows'
  ];
  List<String> get shows => _shows;
  set shows(List<String> _value) {
    _shows = _value;
    prefs.setStringList('ff_shows', _value);
  }

  void addToShows(String _value) {
    _shows.add(_value);
    prefs.setStringList('ff_shows', _shows);
  }

  void removeFromShows(String _value) {
    _shows.remove(_value);
    prefs.setStringList('ff_shows', _shows);
  }

  void removeAtIndexFromShows(int _index) {
    _shows.removeAt(_index);
    prefs.setStringList('ff_shows', _shows);
  }

  void updateShowsAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _shows[_index] = updateFn(_shows[_index]);
    prefs.setStringList('ff_shows', _shows);
  }

  void insertAtIndexInShows(int _index, String _value) {
    _shows.insert(_index, _value);
    prefs.setStringList('ff_shows', _shows);
  }

  List<String> _business = [
    'Conferences',
    'Seminars and Workshops',
    'Technology and Innovation',
    'Business Expos',
    'Networking Events',
    'Product Launches'
  ];
  List<String> get business => _business;
  set business(List<String> _value) {
    _business = _value;
    prefs.setStringList('ff_business', _value);
  }

  void addToBusiness(String _value) {
    _business.add(_value);
    prefs.setStringList('ff_business', _business);
  }

  void removeFromBusiness(String _value) {
    _business.remove(_value);
    prefs.setStringList('ff_business', _business);
  }

  void removeAtIndexFromBusiness(int _index) {
    _business.removeAt(_index);
    prefs.setStringList('ff_business', _business);
  }

  void updateBusinessAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _business[_index] = updateFn(_business[_index]);
    prefs.setStringList('ff_business', _business);
  }

  void insertAtIndexInBusiness(int _index, String _value) {
    _business.insert(_index, _value);
    prefs.setStringList('ff_business', _business);
  }

  List<String> _party = [
    'Nightclub Parties',
    'House Parties',
    'Pool Parties',
    'After Parties'
  ];
  List<String> get party => _party;
  set party(List<String> _value) {
    _party = _value;
    prefs.setStringList('ff_party', _value);
  }

  void addToParty(String _value) {
    _party.add(_value);
    prefs.setStringList('ff_party', _party);
  }

  void removeFromParty(String _value) {
    _party.remove(_value);
    prefs.setStringList('ff_party', _party);
  }

  void removeAtIndexFromParty(int _index) {
    _party.removeAt(_index);
    prefs.setStringList('ff_party', _party);
  }

  void updatePartyAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _party[_index] = updateFn(_party[_index]);
    prefs.setStringList('ff_party', _party);
  }

  void insertAtIndexInParty(int _index, String _value) {
    _party.insert(_index, _value);
    prefs.setStringList('ff_party', _party);
  }

  List<String> _other = [
    'Dance Classes',
    'Travel',
    'Attraction/Tour',
    'Gaming'
  ];
  List<String> get other => _other;
  set other(List<String> _value) {
    _other = _value;
    prefs.setStringList('ff_other', _value);
  }

  void addToOther(String _value) {
    _other.add(_value);
    prefs.setStringList('ff_other', _other);
  }

  void removeFromOther(String _value) {
    _other.remove(_value);
    prefs.setStringList('ff_other', _other);
  }

  void removeAtIndexFromOther(int _index) {
    _other.removeAt(_index);
    prefs.setStringList('ff_other', _other);
  }

  void updateOtherAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _other[_index] = updateFn(_other[_index]);
    prefs.setStringList('ff_other', _other);
  }

  void insertAtIndexInOther(int _index, String _value) {
    _other.insert(_index, _value);
    prefs.setStringList('ff_other', _other);
  }

  bool _hasLoggedInBefore = false;
  bool get hasLoggedInBefore => _hasLoggedInBefore;
  set hasLoggedInBefore(bool _value) {
    _hasLoggedInBefore = _value;
    prefs.setBool('ff_hasLoggedInBefore', _value);
  }

  final _eventTicketsManager = StreamRequestManager<List<TicketsRecord>>();
  Stream<List<TicketsRecord>> eventTickets({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<TicketsRecord>> Function() requestFn,
  }) =>
      _eventTicketsManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearEventTicketsCache() => _eventTicketsManager.clear();
  void clearEventTicketsCacheKey(String? uniqueKey) =>
      _eventTicketsManager.clearRequest(uniqueKey);

  final _myVenueManager = StreamRequestManager<VenuesRecord>();
  Stream<VenuesRecord> myVenue({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<VenuesRecord> Function() requestFn,
  }) =>
      _myVenueManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyVenueCache() => _myVenueManager.clear();
  void clearMyVenueCacheKey(String? uniqueKey) =>
      _myVenueManager.clearRequest(uniqueKey);
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

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
