import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'fr', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? frText = '',
    String? deText = '',
  }) =>
      [enText, esText, frText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // maps
  {
    'ewi5pxl1': {
      'en': 'DoWell Maps',
      'de': 'DoWell Maps',
      'es': 'DoWell Maps',
      'fr': 'DoWell Maps',
    },
    'ktsb4915': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4as6ways': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Casa',
      'fr': 'Domicile',
    },
  },
  // HomeScreenVersion1
  {
    'o0fh54ty': {
      'en': 'DoWell Maps',
      'de': 'DoWell Maps',
      'es': 'DoWell Maps',
      'fr': 'DoWell Maps',
    },
    '53diz7lu': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pal0e3p8': {
      'en': 'Current  Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'xqute3hf': {
      'en': 'Select  Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    'k9zleaja': {
      'en': 'Distance Between(m)',
      'de': 'Abstand zwischen',
      'es': 'Distancia entre',
      'fr': 'Distance entre',
    },
    '7b5qp2fr': {
      'en': 'From Distance',
      'de': 'Aus der Ferne',
      'es': 'Desde la distancia',
      'fr': 'À distance',
    },
    '7l37sekx': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1s42a42a': {
      'en': 'To Distance',
      'de': 'Sich distanzieren',
      'es': 'a la distancia',
      'fr': 'À distance',
    },
    '4kjdjttk': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vpp9tzbc': {
      'en': 'Search  eg School, Park',
      'de': 'Stadt suchen',
      'es': 'Buscar ciudad',
      'fr': 'Rechercher une ville',
    },
    '5x34ca9g': {
      'en': 'school',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6ijffmvv': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // HomeScreenBackup7March
  {
    'i8aji8pm': {
      'en': 'DoWell Maps',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cdl6ca9u': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jwpcymv5': {
      'en': 'Current Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5a69bb9b': {
      'en': 'Specified Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    'iid34hk1': {
      'en': 'Search with',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qsjsrilv': {
      'en': 'Hint: Default distance is from 0',
      'de': '',
      'es': '',
      'fr': '',
    },
    '52nodvr5': {
      'en': 'From Distance (m)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ou17okhl': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nstf0j0c': {
      'en': 'To Distance (m)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'yc4jdwby': {
      'en': '2000',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rmgye0ny': {
      'en': 'Search e.g park, school',
      'de': '',
      'es': '',
      'fr': '',
    },
    'orfaici4': {
      'en': 'school',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dfh46qe9': {
      'en': 'Current Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'w5tuny7d': {
      'en': 'Specified Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    'aklnzdxn': {
      'en': 'Distance Between',
      'de': 'Abstand zwischen',
      'es': 'Distancia entre',
      'fr': 'Distance entre',
    },
    'w4m745g8': {
      'en': 'From Distance',
      'de': 'Aus der Ferne',
      'es': 'Desde la distancia',
      'fr': 'À distance',
    },
    'skq1ncnr': {
      'en': 'To Distance',
      'de': 'Sich distanzieren',
      'es': 'a la distancia',
      'fr': 'À distance',
    },
    '6uts3i63': {
      'en': 'Search  eg School, Park',
      'de': 'Stadt suchen',
      'es': 'Buscar ciudad',
      'fr': 'Rechercher une ville',
    },
    '4jn15bzx': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // HomeScreenVersion2
  {
    'io9irfs3': {
      'en': 'DoWell Maps',
      'de': 'DoWell Maps',
      'es': 'DoWell Maps',
      'fr': 'DoWell Maps',
    },
    'rvtbj3b1': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qo71u3i4': {
      'en': 'Current  Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'h2m12tpi': {
      'en': 'Select  Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    '6o4t534y': {
      'en': 'Distance Between',
      'de': 'Abstand zwischen',
      'es': 'Distancia entre',
      'fr': 'Distance entre',
    },
    'hp70dxua': {
      'en': 'From Distance',
      'de': 'Aus der Ferne',
      'es': 'Desde la distancia',
      'fr': 'À distance',
    },
    '8hfw5a1w': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'r0p0qepe': {
      'en': 'To Distance',
      'de': 'Sich distanzieren',
      'es': 'a la distancia',
      'fr': 'À distance',
    },
    'xsl1vxf1': {
      'en': '2000',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q1wze4a2': {
      'en': 'Search  eg School, Park',
      'de': 'Stadt suchen',
      'es': 'Buscar ciudad',
      'fr': 'Rechercher une ville',
    },
    'w0dzstuw': {
      'en': 'school',
      'de': '',
      'es': '',
      'fr': '',
    },
    'g9icpwdl': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // placedetails
  {
    '0aueumnk': {
      'en': 'Add a place',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qp1ib2nn': {
      'en': 'Place Name (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1l0eqwiy': {
      'en': 'Food & Drinks',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8a86m5th': {
      'en': 'Shopping',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tgri84je': {
      'en': 'Services',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3r26th6i': {
      'en': 'Hotels & Lodging',
      'de': '',
      'es': '',
      'fr': '',
    },
    're1ggb2o': {
      'en': 'Outdoors & Recreation',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3stuqep4': {
      'en': 'Religion',
      'de': '',
      'es': '',
      'fr': '',
    },
    'drhvsyc6': {
      'en': 'Office  & Industrial',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wt39gdk7': {
      'en': 'Residental',
      'de': '',
      'es': '',
      'fr': '',
    },
    'lhn33prm': {
      'en': 'Education',
      'de': '',
      'es': '',
      'fr': '',
    },
    't35z80vj': {
      'en': 'category (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'amp934hx': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    '20n0kxp2': {
      'en': 'Address (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    '36ozdfor': {
      'en': 'Located within',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qf34ina9': {
      'en': 'Hours',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1z5n363l': {
      'en': 'Hours',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jajxe7t0': {
      'en': 'Contact',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1xyrtomk': {
      'en': 'Phone Number',
      'de': '',
      'es': '',
      'fr': '',
    },
    '38j4tofv': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
    },
    'l3bwqo3g': {
      'en': 'Country',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tixxzchr': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // OnboardingPage
  {
    'i07fnl1g': {
      'en': 'My Map',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zoqoh4mo': {
      'en':
          'Create your business personalized map for your customer easy access.',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xabeh3lr': {
      'en': 'Smooth Navigation',
      'de': '',
      'es': '',
      'fr': '',
    },
    'bb6xvdv2': {
      'en':
          'The Navigation feature providies you with directions from one location to another.',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cg8d9dt8': {
      'en': 'Nearby Places',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p57iowyt': {
      'en':
          'You can search nearby points of interest within a partcular range of distance.',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fxkx21le': {
      'en': 'Login',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7cqevelk': {
      'en': 'Skip',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nsrttoot': {
      'en': 'Welcome',
      'de': '',
      'es': '',
      'fr': '',
    },
    'y96zgkub': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // LoginComponent
  {
    '7hps9v61': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // GlobalTopMenuBar
  {
    'pop7fj2v': {
      'en': '6',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qa12q3rw': {
      'en': 'Learning Mode',
      'de': '',
      'es': 'Modo de aprendizaje',
      'fr': '',
    },
  },
  // specifiedlocation
  {
    'bwki9q32': {
      'en': 'Select Location',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // searchboxCopy
  {
    '33zwskpq': {
      'en': 'Current Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'wc8xs5or': {
      'en': 'Specified Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    '2fdlmlrc': {
      'en': 'Distance Between',
      'de': 'Abstand zwischen',
      'es': 'Distancia entre',
      'fr': 'Distance entre',
    },
    '3zy8ganu': {
      'en': 'From Distance',
      'de': 'Aus der Ferne',
      'es': 'Desde la distancia',
      'fr': 'À distance',
    },
    'argc8hr6': {
      'en': 'To Distance',
      'de': 'Sich distanzieren',
      'es': 'a la distancia',
      'fr': 'À distance',
    },
    '4yfj0fbm': {
      'en': 'Search  eg School, Park',
      'de': 'Stadt suchen',
      'es': 'Buscar ciudad',
      'fr': 'Rechercher une ville',
    },
  },
  // categories
  {
    '1y6q8j4h': {
      'en': 'Category',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x89qaar7': {
      'en': 'Search',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8gawanoy': {
      'en': 'Popular Categories',
      'de': '',
      'es': '',
      'fr': '',
    },
    'attx56yo': {
      'en': 'Food & Drinks',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ffrraooq': {
      'en': 'Shopping',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5oktcbw7': {
      'en': 'Services',
      'de': '',
      'es': '',
      'fr': '',
    },
    '35sx2xgs': {
      'en': 'Hotels & lodging',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pwrugvzl': {
      'en': 'Outdoors & recreation',
      'de': '',
      'es': '',
      'fr': '',
    },
    '597h05is': {
      'en': 'Religion',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9xrgqhhc': {
      'en': 'Office & industrial',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7nszz26a': {
      'en': 'Residential',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rw5tfw0z': {
      'en': 'Education',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4yqif3du': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Placedetails1
  {
    'qzza8wra': {
      'en': 'Add a place',
      'de': '',
      'es': '',
      'fr': '',
    },
    'c9dpczdm': {
      'en': 'Place Name (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'i12osgwl': {
      'en': 'Category (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'n8nnhrav': {
      'en': 'Food & Drinks',
      'de': '',
      'es': '',
      'fr': '',
    },
    'aysq1xu3': {
      'en': 'Shopping',
      'de': '',
      'es': '',
      'fr': '',
    },
    'edrx4m92': {
      'en': 'Services',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xmwr21pw': {
      'en': 'Hotels & Lodging',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8czrswr8': {
      'en': 'Outdoors & Recreation',
      'de': '',
      'es': '',
      'fr': '',
    },
    'u2htf5pa': {
      'en': 'Religion',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hk9wemve': {
      'en': 'Office  & Industrial',
      'de': '',
      'es': '',
      'fr': '',
    },
    '33pd74vv': {
      'en': 'Residental',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9waxh2qy': {
      'en': 'Education',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3qaayyfz': {
      'en': 'select categories',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pkscu0g2': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hpq2qctr': {
      'en': 'Address (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wpb7y9si': {
      'en': 'Located within',
      'de': '',
      'es': '',
      'fr': '',
    },
    'herv2o12': {
      'en': 'Hours',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fzy62408': {
      'en': 'Hours',
      'de': '',
      'es': '',
      'fr': '',
    },
    'izjpoc7i': {
      'en': 'Contact',
      'de': '',
      'es': '',
      'fr': '',
    },
    'leshr8jz': {
      'en': 'Phone Number',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0vf6s70c': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'bwnsa3x4': {
      'en':
          'Your location helps us to show you the nearby places  aroubd you, and also provide valuable tips',
      'de': '',
      'es': '',
      'fr': '',
    },
    'm0x9oqn8': {
      'en':
          'Your location helps us to show you the nearby places  aroubd you, and also provide valuable tips.',
      'de':
          'Ihr Standort hilft uns, Ihnen Orte in Ihrer Nähe zu zeigen und wertvolle Tipps zu geben.',
      'es':
          'Su ubicación nos ayuda a mostrarle los lugares cercanos a su alrededor y también le proporciona valiosos consejos.',
      'fr':
          'Votre emplacement nous aide à vous montrer les endroits à proximité autour de vous, et également à vous fournir de précieux conseils.',
    },
    'f4a2gez1': {
      'en': 'The Notifications help us communicate with you better',
      'de': '',
      'es': '',
      'fr': '',
    },
    'uh4554hg': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rdefnf32': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mjbrz7w5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zys3u5j4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xg24gyd5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7vcutkq1': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'udisf572': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9v8rafme': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'd5scj8jo': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dcvi7vy5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'v9ik4yyf': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9ajn5nt6': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2srl8ub5': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'y36jl617': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'acoyl0p4': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '27gkcrly': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jp45p508': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'bjsfbj37': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xa91rkfb': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dy74bp4q': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rgm7w47k': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
