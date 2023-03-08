import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fi', 'en'];

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
    String? fiText = '',
    String? enText = '',
  }) =>
      [fiText, enText][languageIndex] ?? '';

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
  // tilastot_sivu
  {
    'jxhd0x84': {
      'fi': 'Analytiikka',
      'en': '',
    },
    'pugewx7s': {
      'fi': 'Aika',
      'en': '',
    },
    '3ehztlt6': {
      'fi': 'Painot',
      'en': '',
    },
    '2ebrd02h': {
      'fi': 'Home',
      'en': '',
    },
  },
  // paasivu
  {
    'uwbd7u0v': {
      'fi': 'Treenirutiinit',
      'en': 'Worcout routines',
    },
    'd9b3r5r8': {
      'fi': 'Aikaa kulunut: 29min',
      'en': 'Duration: ',
    },
    'hwbly3hr': {
      'fi': 'Aloita ajanotto',
      'en': 'Finish workout',
    },
    'wbg0l8iz': {
      'fi': 'Lopeta treeni',
      'en': 'Finish workout',
    },
    't1qezc6y': {
      'fi': 'Luo treenirutiini',
      'en': 'Create new routine',
    },
    'l6zlq5ni': {
      'fi': 'Treenirutiinit (ohjelmat)',
      'en': 'Training routines',
    },
  },
  // treenaaminen_sivu
  {
    'gb9kwjv0': {
      'fi': 'Home',
      'en': '',
    },
  },
  // aloitus
  {
    'rmgg2g5f': {
      'fi': 'Luo rutiini',
      'en': 'Create routine',
    },
    'ogtztobw': {
      'fi': 'Päänäkymä',
      'en': 'Main page',
    },
    'sexpp0z3': {
      'fi': 'Heatmap',
      'en': 'heatmap',
    },
    'cflqv0g1': {
      'fi': 'Ylävartalo',
      'en': 'Upperbody',
    },
    'sln6ta4a': {
      'fi': 'Työntävät',
      'en': 'Push',
    },
    'ahatfazp': {
      'fi': 'Valitse treenirutiini',
      'en': 'Select routine',
    },
    '83k34jhr': {
      'fi': 'Treenaa',
      'en': 'Train',
    },
  },
  // luoRutiini_sivu
  {
    '3zslehjv': {
      'fi': 'Rutiinin / ohjelman nimi',
      'en': 'Routine / workout name',
    },
    'hyob330v': {
      'fi': 'esim Ylövartalo, Työhtävät tai Juoksu',
      'en': 'Routine name (e.g. Upper body or Rnning)',
    },
    'vps9eyym': {
      'fi': 'Kommentti / ohjeet (vapaaehtoinen)',
      'en': 'comment / instruction (optional)',
    },
    'oeb00uyr': {
      'fi': 'esim. Tämä on kokonaisvaltainen tasapainoa kyhittävä treeni',
      'en': 'e.g. This is a comprehensive balance-improving workout',
    },
    'sxlzl4hk': {
      'fi': 'Lisää treeniliike',
      'en': 'Add exrcise',
    },
    '2b1k7jba': {
      'fi': 'Valmis',
      'en': 'Ready',
    },
    'xr4kgiol': {
      'fi': 'Treenirutiinin luominen',
      'en': 'Create routine',
    },
    'h61n0u71': {
      'fi': 'Koti',
      'en': 'Home',
    },
  },
  // rutiininHistoria_sivu
  {
    '9gg1x79r': {
      'fi': 'Heatmap',
      'en': 'heatmap',
    },
    '0cczlpf8': {
      'fi': 'Page Title',
      'en': '',
    },
    '12nwsek2': {
      'fi': 'Home',
      'en': '',
    },
  },
  // getStarted_sivu
  {
    'aizxhddb': {
      'fi': 'Tallenna treenisuoritukset',
      'en': 'Save routine',
    },
    'lpepy92t': {
      'fi':
          'Kirjaa muistiin treeniharjoitteet ja seuraa kehitystäsi. Vie treenamisesi seuraavalle tasolle!',
      'en':
          'Kirjaa muistiin treeniharjoitteet ja seuraa kehitystäsi. Vie treenamisesi seuraavalle tasolle!',
    },
    'epmt554y': {
      'fi': 'Aloita',
      'en': 'Start',
    },
    '0mk4h58t': {
      'fi': 'Home',
      'en': 'Home',
    },
  },
  // registerPage
  {
    'gr1qvmg8': {
      'fi': 'Register',
      'en': '',
    },
    'yz8s4rx3': {
      'fi': 'If You Need Any Support',
      'en': '',
    },
    '1tyi7eol': {
      'fi': ' Click Here',
      'en': '',
    },
    's5vd6ez0': {
      'fi': 'Full Name',
      'en': '',
    },
    'vbpktfla': {
      'fi': 'Enter Email',
      'en': '',
    },
    'ppyczpj0': {
      'fi': 'Password',
      'en': '',
    },
    '3zlhwadj': {
      'fi': 'Recovery Password',
      'en': '',
    },
    'pbxocv0b': {
      'fi': 'Create Account',
      'en': '',
    },
    '02ldsli7': {
      'fi': 'Or',
      'en': '',
    },
    'dd39k22d': {
      'fi': 'Do You Have An Account ?',
      'en': '',
    },
    'f4aq41rb': {
      'fi': ' Sign In',
      'en': '',
    },
    'iar5d61r': {
      'fi': 'Home',
      'en': '',
    },
  },
  // chooseMode
  {
    'hnae47eh': {
      'fi': 'Choose Mode',
      'en': '',
    },
    'ciwoj06f': {
      'fi': 'Dark Mode',
      'en': '',
    },
    'tsdjgnki': {
      'fi': 'Light Mode',
      'en': '',
    },
    '19i0uv3v': {
      'fi': 'Jatka',
      'en': '',
    },
    'rwgqzenq': {
      'fi': 'Home',
      'en': '',
    },
  },
  // signInPage
  {
    '9al98olk': {
      'fi': 'Sign In',
      'en': '',
    },
    'qu23qza6': {
      'fi': 'If You Need Any Support',
      'en': '',
    },
    'sgy4rh97': {
      'fi': ' Click Here',
      'en': '',
    },
    'plow0u6v': {
      'fi': 'Enter Username Or Email',
      'en': '',
    },
    'imlqmdmw': {
      'fi': 'Password',
      'en': '',
    },
    'ciryg3fw': {
      'fi': 'Recovery Password',
      'en': '',
    },
    'cdr4uu8p': {
      'fi': 'Sign In',
      'en': '',
    },
    'vk0cbvch': {
      'fi': 'Or',
      'en': '',
    },
    'uej0hasv': {
      'fi': 'Not A Member ?',
      'en': '',
    },
    'jpzgcgld': {
      'fi': ' Register Now',
      'en': '',
    },
    'jc0k02qv': {
      'fi': 'Home',
      'en': '',
    },
  },
  // registerOrSignInPage
  {
    '4dm3cb84': {
      'fi': 'Enjoy Listening To Music',
      'en': '',
    },
    'lfc11480': {
      'fi':
          'Spotify is a proprietary Swedish audio streaming and media services provider ',
      'en': '',
    },
    'ynzbt1fc': {
      'fi': 'Register',
      'en': '',
    },
    'leb41kqz': {
      'fi': 'Sign in',
      'en': '',
    },
    'cx9gm7cg': {
      'fi': 'Home',
      'en': '',
    },
  },
  // tietosuojaJaYksityisyys
  {
    'm51gs2fz': {
      'fi': 'Home',
      'en': '',
    },
  },
  // builder
  {
    'nvbc1cqj': {
      'fi': 'Hello World',
      'en': '',
    },
    'v1rlq3l4': {
      'fi': 'Page Title',
      'en': '',
    },
    't3ej29tw': {
      'fi': 'Home',
      'en': '',
    },
  },
  // ToistotTalteenText
  {
    'ezf7x56w': {
      'fi': 'Toistot Talteen',
      'en': 'Toistot Talteen',
    },
  },
  // rutiiniTaiSessio
  {
    '5hsnij9t': {
      'fi': '18:05',
      'en': '18:05',
    },
    'dm2kbqw6': {
      'fi': '1H 25min',
      'en': '1H 25min',
    },
    '452cnmn6': {
      'fi': '5',
      'en': '5',
    },
    'r1v3hyro': {
      'fi':
          'Ota pohjaksi valitun päivän treeni. Muuten pohjana on perusrutiini.',
      'en':
          'Use the selected day\'s training as a basis. Otherwise, the basis is the basic routine.',
    },
    'hn9k2t8e': {
      'fi': 'Suorita',
      'en': 'Start',
    },
    'zg2n2e21': {
      'fi': 'Treenihistoria',
      'en': 'Worcout history',
    },
    'h16b2vng': {
      'fi': 'Treenaa nyt',
      'en': 'Start now',
    },
  },
  // treeniLiikeForm
  {
    '6fex8zp8': {
      'fi': 'Treeniliikkeen nimi',
      'en': 'Exercise name',
    },
    'c1kh8kio': {
      'fi': 'esim. Maastaveto, Ylätalja vastaotteella, Uinti jne...',
      'en': 'Routine name (e.g. Upper body or Rnning)',
    },
    'x622rgz7': {
      'fi': 'KUNTOSALI (penkki, pystypunnerrus käsipainolla jne...)',
      'en': 'GYM (Bench Press, Dumbell flies etc...)',
    },
    'ithsk40p': {
      'fi': 'MUU (venyttely, uinti, palloilu jne...)',
      'en': 'OTHER (exercise that doesn\'t fit in gym category )',
    },
    'eod0ssb0': {
      'fi': 'Valitse tyyppi (Ei pakollinen)',
      'en': 'Select type (Optional)',
    },
    'adxqhecq': {
      'fi': '',
      'en': '',
    },
    'i3wiah5x': {
      'fi': 'Sarjojen määrä (Ei pakollinen)',
      'en': 'Number of sets (Optional)',
    },
    'familqw5': {
      'fi': '',
      'en': '',
    },
    'pk7tuluo': {
      'fi': 'Toistojen  määrä (Ei pakollinen)',
      'en': 'Number of repetitions (Optional)',
    },
    'r5xevs00': {
      'fi': '',
      'en': '',
    },
    'auarlbrk': {
      'fi': 'Paino (Ei pakollinen)',
      'en': 'Weight (Optional)',
    },
    'suqrryhr': {
      'fi': '',
      'en': '',
    },
    '73cntf0m': {
      'fi': 'Kesto minuutteina (Ei pakollinen)',
      'en': 'Duration in minutes (Optional)',
    },
    'xlu1l4ad': {
      'fi': '',
      'en': '',
    },
    'g0mp3d39': {
      'fi': 'Matka metreinä (Ei pakollinen)',
      'en': 'Distance in meters (Optional)',
    },
    'xjb36tr5': {
      'fi': 'Kommentti (Ei pakollinen)',
      'en': 'Comment (Optional)',
    },
    'bvpq99bs': {
      'fi': 'esim. Tee ainakin kaksi lämmittelysarjaa kevyellä painolla',
      'en': 'e.g. Do atleast two warmup set with light weight',
    },
    '5khcc0a1': {
      'fi': 'Muutokset tallennettu',
      'en': 'Chages saved',
    },
    '449n4liv': {
      'fi': 'Valmis',
      'en': 'Ready',
    },
  },
  // MyDeleteButton
  {
    '8t3o2ple': {
      'fi': 'Poista',
      'en': 'Delete',
    },
  },
  // toistotJaPaino
  {
    'mx954vsy': {
      'fi': '.\nsarja',
      'en': '.\nset',
    },
    'sgoh1uqn': {
      'fi': 'Toistot',
      'en': 'Reps',
    },
    '4lw9eht6': {
      'fi': '0',
      'en': 'Repetitions',
    },
    'vmoelc5t': {
      'fi': 'Paino (kg)',
      'en': 'Weight (kg)',
    },
    'e8e42meb': {
      'fi': '0',
      'en': 'Repetitions',
    },
  },
  // liike_treenaaminen
  {
    '29oo50bm': {
      'fi': 'Liikkeen nimi',
      'en': 'Excercise name',
    },
    'l7w663ju': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Commment (Optional)',
    },
    '1k7piz7l': {
      'fi': '.\nsarja',
      'en': '.\nset',
    },
    'u1j0c71n': {
      'fi': 'Toistot',
      'en': 'Reps',
    },
    'vzw2070w': {
      'fi': '0',
      'en': 'Repetitions',
    },
    '1zpp3lp9': {
      'fi': 'Paino (kg)',
      'en': 'Weight (kg)',
    },
    'utdud272': {
      'fi': '0',
      'en': 'Repetitions',
    },
    'dxvry4te': {
      'fi': 'lisää sarja',
      'en': 'add set',
    },
  },
  // drawer
  {
    'ku53fmbs': {
      'fi': 'Luo tili tai kirjaudu',
      'en': 'Create account or login',
    },
    'qcyu9dqc': {
      'fi': 'Hello World ',
      'en': '',
    },
    '9hgn22d8': {
      'fi': 'Treenirutiinit',
      'en': 'Workout routines',
    },
    '14gzlzjt': {
      'fi': 'Treenihistoria',
      'en': 'Workout history',
    },
    'lbpdvgf4': {
      'fi': 'Treenitilastot',
      'en': 'Workout Statistics',
    },
    'gax7p69h': {
      'fi': 'Language',
      'en': 'Kieli',
    },
    'sh3jbjpm': {
      'fi': 'Tumma teema',
      'en': 'Dark mode',
    },
    'ny2fhrqk': {
      'fi': 'Lähetä palaute',
      'en': 'Send feedback',
    },
    '2ttiy67c': {
      'fi': 'Tietosuoja ja käyttöehdot',
      'en': 'Privacy policy and User agreetment',
    },
  },
  // rutiinit_sivu
  {
    'pr2ftdmo': {
      'fi': 'Ylävartalo',
      'en': 'Upperbody',
    },
    '1d67hhk0': {
      'fi': 'Työntävät',
      'en': 'Push',
    },
    '68nw3eu6': {
      'fi': 'Valitse treenirutiini',
      'en': 'Select routine',
    },
  },
  // treeniHistoria_sivu
  {
    'uur18ydl': {
      'fi': 'Sinulla ei ole vielä tehtyjä treenejä',
      'en': 'You don\'t have finished workouts yet',
    },
  },
  // bottomSheet_rutiiniJaSessio
  {
    'esn5dhxf': {
      'fi': 'Poista pysyvästi',
      'en': 'Delete permanently',
    },
    'e0l254zt': {
      'fi': 'Muokkaa',
      'en': 'Edit',
    },
  },
  // aikaisemmatSuoritukset
  {
    'nuyg0kz2': {
      'fi': 'Heatmap kalenteri',
      'en': 'Heatmap valendar',
    },
    '42oknvjl': {
      'fi': 'Heat map',
      'en': 'Heat map',
    },
  },
  // button_aloitaTreenaaminen
  {
    'wmqwog4s': {
      'fi': 'Aloita treenaaminen',
      'en': 'Start workout',
    },
  },
  // button_luoRutiini
  {
    '3myg55ek': {
      'fi': 'Luo treenipohja',
      'en': 'Create an routine',
    },
  },
  // treenaa_sivu
  {
    '7y5lnu4x': {
      'fi': '',
      'en': '',
    },
    'y2ovng6h': {
      'fi': 'Rutiinin nimi',
      'en': 'Routine name',
    },
    'mdlqfic5': {
      'fi': '',
      'en': '',
    },
    'zpecqtzq': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Comment (optional)',
    },
    'c9ll95ki': {
      'fi': 'Lisää  liike',
      'en': 'New exercise',
    },
  },
  // Miscellaneous
  {
    '1u6cda3u': {
      'fi': '',
      'en': '',
    },
    'au7x8ize': {
      'fi': '',
      'en': '',
    },
    'lhbjyw2o': {
      'fi': '',
      'en': '',
    },
    'zr9l0xc3': {
      'fi': '',
      'en': '',
    },
    'r9kev20w': {
      'fi': '',
      'en': '',
    },
    'oy345b43': {
      'fi': '',
      'en': '',
    },
    'tsdpc6n6': {
      'fi': '',
      'en': '',
    },
    'f38sf9gj': {
      'fi': '',
      'en': '',
    },
    'fwuz3oxi': {
      'fi': '',
      'en': '',
    },
    'srbk06wp': {
      'fi': '',
      'en': '',
    },
    'k278hvhq': {
      'fi': '',
      'en': '',
    },
    't2cey683': {
      'fi': '',
      'en': '',
    },
    '08elwtvl': {
      'fi': '',
      'en': '',
    },
    'sdn5u67b': {
      'fi': '',
      'en': '',
    },
    't13rraq5': {
      'fi': '',
      'en': '',
    },
    '4k6yk3fw': {
      'fi': '',
      'en': '',
    },
    'pkjl6rgd': {
      'fi': '',
      'en': '',
    },
    '5bmu6lyu': {
      'fi': '',
      'en': '',
    },
    '9jw9iu8y': {
      'fi': '',
      'en': '',
    },
    'qsh8nql9': {
      'fi': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
