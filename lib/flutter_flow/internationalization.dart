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
    '4qtf9lbz': {
      'en': 'Login as guest',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7hps9v61': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // placedetails
  {
    'sn9393cn': {
      'en': 'Add a place',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dwjmub6f': {
      'en': 'Address (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2k5stkoe': {
      'en': 'Hours e.g 10am - 5pm',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zk6hf2qv': {
      'en': 'Phone Number',
      'de': '',
      'es': '',
      'fr': '',
    },
    'isgkjokp': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
    },
    'djh10uax': {
      'en': 'Country',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fsk6pt0q': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5i3suqhv': {
      'en': 'Place Name (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'na94g8mj': {
      'en': 'Located within',
      'de': '',
      'es': '',
      'fr': '',
    },
    'm8kq14vr': {
      'en': 'Website (Optional)',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6rlsog4l': {
      'en': 'Select Collection',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4w7w4xge': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3zhr2f5s': {
      'en': 'Food & Drinks',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8letu1bb': {
      'en': 'Shopping',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xci4hq21': {
      'en': 'Services',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dkrg1boa': {
      'en': 'Hotels & Lodging',
      'de': '',
      'es': '',
      'fr': '',
    },
    'me2oyhk6': {
      'en': 'Outdoors & Recreation',
      'de': '',
      'es': '',
      'fr': '',
    },
    '8xo5vqar': {
      'en': 'Religion',
      'de': '',
      'es': '',
      'fr': '',
    },
    '73gowqqv': {
      'en': 'Office  & Industrial',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6dkx9s37': {
      'en': 'Residental',
      'de': '',
      'es': '',
      'fr': '',
    },
    'yqudu3xl': {
      'en': 'Education',
      'de': '',
      'es': '',
      'fr': '',
    },
    '52hwnuws': {
      'en': 'category (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rcnzbemm': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5gfiedo9': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Signup
  {
    'zw94r2fi': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // SelectOrg
  {
    'wqoufdot': {
      'en': 'Option 1',
      'de': '',
      'es': '',
      'fr': '',
    },
    '70qesb8w': {
      'en': 'Please select Profile',
      'de': '',
      'es': '',
      'fr': '',
    },
    '575uccuh': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'gwbhdjnu': {
      'en': 'Button',
      'de': '',
      'es': '',
      'fr': '',
    },
    'o9tsu1yg': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // NewHomePage
  {
    'odsts4lf': {
      'en': 'View Profile',
      'de': 'Profil anzeigen',
      'es': 'Ver perfil',
      'fr': 'Voir le profil',
    },
    'tos25ie5': {
      'en': 'Add Group',
      'de': 'Verbindung hinzufügen',
      'es': 'Agregar conexión',
      'fr': 'Ajouter une connexion',
    },
    'ugzuwa0k': {
      'en': 'My Team',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ux1xlg8y': {
      'en': 'Scan QRCode',
      'de': '',
      'es': '',
      'fr': '',
    },
    's7bromby': {
      'en': 'Settings',
      'de': 'Einstellungen',
      'es': 'Ajustes',
      'fr': 'Paramètres',
    },
    'xhy66cy5': {
      'en': 'Support',
      'de': 'Unterstützung',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    '97mp010r': {
      'en': 'About',
      'de': 'Um',
      'es': 'Acerca de',
      'fr': 'À propos',
    },
    'opr5mowk': {
      'en': 'Generate QR Code',
      'de': '',
      'es': '',
      'fr': '',
    },
    'r3p5dnq7': {
      'en': 'You are not Logged in',
      'de': 'Du bist nicht eingeloggt',
      'es': 'Usted no se ha identificado',
      'fr': 'Vous n\'êtes pas connecté',
    },
    'obtnbk5o': {
      'en': 'Click here to Log in',
      'de': 'Klicken Sie hier, um sich einzuloggen',
      'es': 'Haga clic aquí para ingresar',
      'fr': 'Cliquez ici pour vous identifier',
    },
    'aizjlehk': {
      'en': 'Logout',
      'de': 'Ausloggen',
      'es': 'Cerrar sesión',
      'fr': 'Se déconnecter',
    },
    'fz3xrc4g': {
      'en': 'Search Location',
      'de': 'Ort auswählen',
      'es': 'Seleccionar ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    '44krtudf': {
      'en': 'Current Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    's9n78sg8': {
      'en': 'Current Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'hgx4ok5m': {
      'en': 'Select Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    'jgnwzq85': {
      'en': 'Distance\nBetween',
      'de': 'Distanz\nZwischen',
      'es': 'Distancia\nEntre',
      'fr': 'Distance\nEntre',
    },
    '7i1t896a': {
      'en': 'From',
      'de': '0',
      'es': '0',
      'fr': '0',
    },
    '0ckxd2o7': {
      'en': 'e.g 0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'aphmltz6': {
      'en': 'To',
      'de': '2000',
      'es': '2000',
      'fr': '2000',
    },
    'v6s1i2tm': {
      'en': 'e.g 2000',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cvep8u39': {
      'en': 'M',
      'de': 'M',
      'es': 'M',
      'fr': 'M',
    },
    'rp439f9l': {
      'en': 'categories',
      'de': 'Suche hier',
      'es': 'Busca aquí',
      'fr': 'Cherche ici',
    },
    'sgyz8ovg': {
      'en': 'e.g school',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xww5jydn': {
      'en': 'Login',
      'de': 'Anmeldung',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'tkk4nv2b': {
      'en': 'Group',
      'de': 'Gruppe',
      'es': 'Grupo',
      'fr': 'Groupe',
    },
    'mhegrjuy': {
      'en': 'Enable Tracking',
      'de': '',
      'es': '',
      'fr': '',
    },
    'in74qj5s': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // Userdetails
  {
    '0is70yii': {
      'en': 'Name : ',
      'de': 'Name',
      'es': 'Nombre:',
      'fr': 'Nom',
    },
    '5to835l5': {
      'en': 'Email : ',
      'de': 'E-mail:',
      'es': 'Correo electrónico:',
      'fr': 'E-mail:',
    },
    '220y0rtu': {
      'en': 'Payment Status : ',
      'de': 'Zahlungsstatus :',
      'es': 'Estado de pago :',
      'fr': 'Statut de paiement :',
    },
    '47zn190d': {
      'en': 'Home',
      'de': 'Heim',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // newplacedetails
  {
    '842romr0': {
      'en': 'Add a place',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mqmmxmre': {
      'en': 'Schools',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xd1c8bg1': {
      'en': 'Select Group',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hs8fuafm': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vvkq2g4j': {
      'en': 'Place Name (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qowwl918': {
      'en': 'Address (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jorgyc6f': {
      'en': 'Food & Drinks',
      'de': '',
      'es': '',
      'fr': '',
    },
    'u91n5u0d': {
      'en': 'Shopping',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ue4p956q': {
      'en': 'Services',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nldipyq5': {
      'en': 'Hotels & Lodging',
      'de': '',
      'es': '',
      'fr': '',
    },
    'uf0lolgk': {
      'en': 'Outdoors & Recreation',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hqenvl7o': {
      'en': 'Religion',
      'de': '',
      'es': '',
      'fr': '',
    },
    'b3vi54e7': {
      'en': 'Office  & Industrial',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xslvxas0': {
      'en': 'Residental',
      'de': '',
      'es': '',
      'fr': '',
    },
    'epipcmki': {
      'en': 'Education',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1ol1cnqd': {
      'en': 'category (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'w70sgojl': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'f62j8lxl': {
      'en': 'Located within',
      'de': '',
      'es': '',
      'fr': '',
    },
    'u1z164x4': {
      'en': 'Hours e.g 10am - 5pm',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fpz54ec3': {
      'en': 'Phone Number',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jcb1s3v9': {
      'en': 'Country',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6dlk01wl': {
      'en': 'Website (Optional)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'a6ly8b9q': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // TrackingPage
  {
    'i5c3uzhy': {
      'en': 'View Profile',
      'de': '',
      'es': '',
      'fr': '',
    },
    'hutdkots': {
      'en': 'Add Group',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9qgenc7y': {
      'en': 'Settings',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cyybixiw': {
      'en': 'Support',
      'de': '',
      'es': '',
      'fr': '',
    },
    'gzkea7cu': {
      'en': 'About',
      'de': '',
      'es': '',
      'fr': '',
    },
    't9l8yawx': {
      'en': 'You are not Logged in',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ija85391': {
      'en': 'Click here to Log in',
      'de': '',
      'es': '',
      'fr': '',
    },
    'a0cciddc': {
      'en': 'Logout',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wi4wfiyx': {
      'en': 'Enter Square Length',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jzzqd041': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q1hocl90': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'olkrtytj': {
      'en': 'Enable Tracking',
      'de': '',
      'es': '',
      'fr': '',
    },
    '70yerk45': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // search
  {
    'zl0eur9a': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // QrScanner
  {
    'zalsry9j': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
    's6x3gfbw': {
      'en': 'Scanning QR Code',
      'de': '',
      'es': '',
      'fr': '',
    },
    'u9h9ekge': {
      'en': 'Please hold the camera at the QR Code',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mrkct4e8': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // TrackingDetailsForm
  {
    'z1yhlp39': {
      'en': 'Full Name',
      'de': '',
      'es': '',
      'fr': '',
    },
    'g9bqj2wy': {
      'en': 'Email',
      'de': '',
      'es': '',
      'fr': '',
    },
    'o2rtfxjc': {
      'en': 'Company/School Name',
      'de': '',
      'es': '',
      'fr': '',
    },
    'w5gqe11r': {
      'en': 'Country',
      'de': '',
      'es': '',
      'fr': '',
    },
    'beavcmg1': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
    },
    'yhpdz1ji': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Create_Qr_Code
  {
    '3rolpja5': {
      'en': 'Generate',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tzp8vi12': {
      'en': 'Generate Qrcode',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ip697n26': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // TrackPermission
  {
    '2gh9o4g9': {
      'en':
          'I permit DoWell UX Living Lab to track and record my GPS location from device or phone inside the exhibition venue to display tracking data in reports to public without showing my identity',
      'de': '',
      'es': '',
      'fr': '',
    },
    'i3i9itay': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
    'p5szsrpz': {
      'en': 'Accept',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qqbdc489': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Teams
  {
    'ut7yfo59': {
      'en': 'Teams',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jzt6v7pk': {
      'en': 'Add Team ',
      'de': '',
      'es': '',
      'fr': '',
    },
    '9hn1lrk7': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // TeamMembers
  {
    'k13sb5ww': {
      'en': 'No team member added to this team yet',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x5l53ukx': {
      'en': 'Add Member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'lugc5qdu': {
      'en': 'Public Members',
      'de': '',
      'es': '',
      'fr': '',
    },
    'krd5m24u': {
      'en': 'No public member added to this team yet',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xgf28m3b': {
      'en': 'Add Member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'v42vev5f': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // MembersScreen
  {
    '7bykkzkk': {
      'en': 'Team members ',
      'de': '',
      'es': '',
      'fr': '',
    },
    '63yjc3jq': {
      'en': 'View All',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dvat0t3j': {
      'en': 'no added members yet',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wrb8kcnh': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // MembersDetailScreen
  {
    'xs5qg95g': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // MembersSelectionScreen
  {
    'p596s6yi': {
      'en': 'Select all',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3x6z5njd': {
      'en': 'Add Selected',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5zqxvy2a': {
      'en': 'Home',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // AddMemberScreen
  {
    'v1upotj1': {
      'en': 'Login Team Members ',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fgldpxor': {
      'en': 'View All',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ae0safec': {
      'en': 'no available team member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tbo40n6q': {
      'en': 'Login Guest Members ',
      'de': '',
      'es': '',
      'fr': '',
    },
    '3zd4bddn': {
      'en': 'View All',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wxo7h4s0': {
      'en': 'no available guest member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'wvrloj1z': {
      'en': 'Add Member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'b2q58ryj': {
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
  // addCategoryItem
  {
    'kht4sogw': {
      'en': 'Add Categoty',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // AddGroupDialog
  {
    'wy7twllq': {
      'en': 'Group Name',
      'de': '',
      'es': '',
      'fr': '',
    },
    'w389jou7': {
      'en': 'Hint:  Employees, or Junior class',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ant38qi8': {
      'en': 'Type in the new group you will like to add',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nunufabo': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
    'n4h0tw7w': {
      'en': 'Add',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // SearchBottomSheet
  {
    'afj62t78': {
      'en': 'Search Location',
      'de': 'Ort auswählen',
      'es': 'Seleccionar ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    'gm817yco': {
      'en': 'Current  Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    '828ysqx0': {
      'en': 'Select  Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    'bqyscjaa': {
      'en': 'Distance\nBetween',
      'de': '',
      'es': '',
      'fr': '',
    },
    'cx71j7bs': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tj4rgf9x': {
      'en': '2000',
      'de': '',
      'es': '',
      'fr': '',
    },
    'n3tveenp': {
      'en': 'M',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dfefdlvf': {
      'en': 'Search here',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // ButtomSheet
  {
    '5emdajmx': {
      'en': 'Search Location',
      'de': 'Ort auswählen',
      'es': 'Seleccionar ubicación',
      'fr': 'Sélectionnez l\'emplacement',
    },
    '0rdfxr3p': {
      'en': 'Current  Location',
      'de': 'Aktueller Standort',
      'es': 'Ubicación actual',
      'fr': 'Localisation actuelle',
    },
    'qqyi3agc': {
      'en': 'Select  Location',
      'de': 'Angegebener Ort',
      'es': 'Ubicación especificada',
      'fr': 'Emplacement spécifié',
    },
    'idrts9vp': {
      'en': 'Distance\nBetween',
      'de': '',
      'es': '',
      'fr': '',
    },
    'zjjjdp8s': {
      'en': '0',
      'de': '',
      'es': '',
      'fr': '',
    },
    'q21m3e1v': {
      'en': '2000',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0atk3eti': {
      'en': 'M',
      'de': '',
      'es': '',
      'fr': '',
    },
    'd9sb4fxc': {
      'en': 'Search here',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // GroupListDialogComponent
  {
    'jnfk1ntq': {
      'en': 'Groups',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nleto60u': {
      'en': 'Schools',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7wgxe1i5': {
      'en': 'select collection',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tbfzlsp7': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Placedetails2
  {
    'yal01m4s': {
      'en': 'Add a place',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vv2x4pun': {
      'en': 'Schools',
      'de': '',
      'es': '',
      'fr': '',
    },
    '56mkftya': {
      'en': 'Select Group',
      'de': '',
      'es': '',
      'fr': '',
    },
    'nd0ecjko': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jbtu6d1v': {
      'en': 'Place Name (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'b93nrvte': {
      'en': 'Category (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'pospb49u': {
      'en': 'Food & Drinks',
      'de': '',
      'es': '',
      'fr': '',
    },
    't1v3xc36': {
      'en': 'Shopping',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ovqais7g': {
      'en': 'Services',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fe9lob1j': {
      'en': 'Hotels & Lodging',
      'de': '',
      'es': '',
      'fr': '',
    },
    'e1ga9ov3': {
      'en': 'Outdoors & Recreation',
      'de': '',
      'es': '',
      'fr': '',
    },
    'y4vj7wvn': {
      'en': 'Religion',
      'de': '',
      'es': '',
      'fr': '',
    },
    '5x5klm4y': {
      'en': 'Office  & Industrial',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jqzrewo0': {
      'en': 'Residental',
      'de': '',
      'es': '',
      'fr': '',
    },
    '4kj5xzwo': {
      'en': 'Education',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2yz21wgr': {
      'en': 'select categories',
      'de': '',
      'es': '',
      'fr': '',
    },
    '832coscg': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'c6je79v1': {
      'en': 'Address (required)',
      'de': '',
      'es': '',
      'fr': '',
    },
    'qea3hlyo': {
      'en': 'Located within',
      'de': '',
      'es': '',
      'fr': '',
    },
    'xks0ywav': {
      'en': 'Hours',
      'de': '',
      'es': '',
      'fr': '',
    },
    'akwmb5e0': {
      'en': 'Phone Number',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dv33b8g5': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // LoadingBox
  {
    'ezdi5uum': {
      'en': 'Loading...',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // TrackPermissionDialog
  {
    'qxa66xnf': {
      'en':
          'I permit DoWell UX Living Lab to track and record my GPS location from device or phone inside the exhibition venue to display tracking data in reports to public without showing my identity',
      'de': '',
      'es': '',
      'fr': '',
    },
    '6iudrq6u': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
    'z5xypcdk': {
      'en': 'Accept',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // newteam
  {
    'bhz9fcg5': {
      'en': 'New Team',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rzdflud2': {
      'en': 'Enter Team Name',
      'de': '',
      'es': '',
      'fr': '',
    },
    '58wvanjp': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // adduser
  {
    'x4qv79fj': {
      'en': 'Add User to Team',
      'de': '',
      'es': '',
      'fr': '',
    },
    'kgk9sezz': {
      'en': 'Yes',
      'de': '',
      'es': '',
      'fr': '',
    },
    'svieqcu1': {
      'en': 'No',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // NewMembersDialog
  {
    'snn05pk3': {
      'en': 'New Member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ctdmscok': {
      'en': 'Enter Member Name',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ge33veo2': {
      'en': 'Active',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7pov0zhu': {
      'en': 'Inactive',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0q403f4s': {
      'en': 'Member status',
      'de': '',
      'es': '',
      'fr': '',
    },
    'v13pv5lt': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    's49x51nv': {
      'en': 'Submit',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // TeamSelectorFormDialog
  {
    'qddovdqm': {
      'en': 'Tracking  Form registration',
      'de': '',
      'es': '',
      'fr': '',
    },
    'fmhbcdii': {
      'en': 'Option 1',
      'de': '',
      'es': '',
      'fr': '',
    },
    '7ictapmq': {
      'en': 'Select Orgainsation',
      'de': '',
      'es': '',
      'fr': '',
    },
    'c5ltjnmc': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'dyx9mlif': {
      'en': 'Teams',
      'de': '',
      'es': '',
      'fr': '',
    },
    '1mq44czr': {
      'en': 'Option 1',
      'de': '',
      'es': '',
      'fr': '',
    },
    'j770ya70': {
      'en': 'Select Team',
      'de': '',
      'es': '',
      'fr': '',
    },
    'k868j7wn': {
      'en': 'Search for an item...',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vlilbut8': {
      'en': 'No team attached to this team',
      'de': '',
      'es': '',
      'fr': '',
    },
    '0hoa9wow': {
      'en': 'Continue',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // MemberMainOptions
  {
    'nvyratzz': {
      'en': 'Add member',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rliacw6m': {
      'en': 'Move members',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // MemberSubOptions
  {
    '3afckevs': {
      'en': 'Delete',
      'de': '',
      'es': '',
      'fr': '',
    },
    '2gnst597': {
      'en': 'Add To Internal',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // AddMemberDialog
  {
    'ukfpisah': {
      'en': 'From Team members',
      'de': '',
      'es': '',
      'fr': '',
    },
    'vt4ajvw6': {
      'en': 'Team Members',
      'de': '',
      'es': '',
      'fr': '',
    },
    'oqn57nuj': {
      'en': 'From Guest  members',
      'de': '',
      'es': '',
      'fr': '',
    },
    'jp6ghp6y': {
      'en': 'Guest Members',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // DeleteMemberDialog
  {
    'ao10rmfe': {
      'en': 'Are you sure?\nPlease note operation can not be reverse',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rtehx8bq': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
    'd733q8qk': {
      'en': 'Accept',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // AddMemberConfirmDialog
  {
    'h0v5zbdo': {
      'en': 'Cancel',
      'de': '',
      'es': '',
      'fr': '',
    },
    'rvpm0mcq': {
      'en': 'Accept',
      'de': '',
      'es': '',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    'bwnsa3x4': {
      'en':
          'To get nearby places around you, app needs your permission to access your location.',
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
    'akc9fjsh': {
      'en': 'The Notifications help us communicate with you better',
      'de': '',
      'es': '',
      'fr': '',
    },
    's3wmiy5v': {
      'en':
          'To get nearby places around you, app needs your permission to access your location.',
      'de': '',
      'es': '',
      'fr': '',
    },
    'o3dv3kf0': {
      'en':
          'To get nearby places around you, app needs your permission to access your location.',
      'de': '',
      'es': '',
      'fr': '',
    },
    'mjvb5ikd': {
      'en': 'Camera permission is required for barcode scanning',
      'de': '',
      'es': '',
      'fr': '',
    },
    'tc0uelcd': {
      'en': 'Camera permission is required for barcode scanning',
      'de': '',
      'es': '',
      'fr': '',
    },
    'o86fqy4z': {
      'en': 'Photo Library permission is  required for image placeholder',
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
    'xwpl3z34': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    '09t9t4va': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'ekfp8qzs': {
      'en': '',
      'de': '',
      'es': '',
      'fr': '',
    },
    'x89xvv8z': {
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
