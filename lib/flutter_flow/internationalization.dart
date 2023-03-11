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
    '3w46zho5': {
      'fi': 'Please select...',
      'en': '',
    },
    'nwjx4q5d': {
      'fi': 'Toistot',
      'en': '',
    },
    'xky4l2vu': {
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
      'fi': 'Treenpohjat (rutiinit)',
      'en': 'Worcout routines',
    },
    'd9b3r5r8': {
      'fi': 'Aikaa kulunut:',
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
  // aloitus_eiKaytossa
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
    'dm2kbqw6': {
      'fi': '1H 25min',
      'en': '1H 25min',
    },
    'zg2n2e21': {
      'fi': 'Rutiinihistoria',
      'en': 'Worcout history',
    },
    'h16b2vng': {
      'fi': 'Treenaa nyt',
      'en': 'Start now',
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
  // liike_treeninAikana
  {
    '29oo50bm': {
      'fi': 'Liikkeen nimi',
      'en': 'Excercise name',
    },
    'l7w663ju': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Commment (Optional)',
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
    'hcx7u96d': {
      'fi': '.\nsarja',
      'en': '.\nset',
    },
    'dxvry4te': {
      'fi': 'lisää sarja',
      'en': 'add set',
    },
    'rrk6y01u': {
      'fi': 'Tehty',
      'en': 'Done',
    },
  },
  // sivupalkki
  {
    'ku53fmbs': {
      'fi': 'Luo tili tai kirjaudu',
      'en': 'Create account or login',
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
    'cuq5wlq3': {
      'fi': '  (käynnissä)',
      'en': '',
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
  // sivu_rutiinit
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
  // sivu_treeniHistoria
  {
    'uur18ydl': {
      'fi': 'Tämä sivu on tyhjä koska sinulla ei ole vielä tehtyjä treenejä',
      'en': 'This page is empty because you don\'t have finished workouts yet',
    },
  },
  // bottomSheet_rutiiniJaSessio
  {
    'esn5dhxf': {
      'fi': 'Poista pysyvästi',
      'en': 'Delete permanently',
    },
    '2a9bmoed': {
      'fi': '(paina pitkään)',
      'en': '',
    },
    'e0l254zt': {
      'fi': 'Muokkaa',
      'en': 'Edit',
    },
    'elbafojn': {
      'fi': 'Luo tästä rutiinipohja',
      'en': 'Create an routine from this',
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
      'fi': 'Lisää treenipohja',
      'en': 'Add an routine',
    },
  },
  // sivu_treenaaTaiLuoRutiini
  {
    '7y5lnu4x': {
      'fi': '',
      'en': '',
    },
    'y2ovng6h': {
      'fi': 'Treenin nimi',
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
  // rutiini
  {
    'yi3kozht': {
      'fi': 'Treenipohjan nimi',
      'en': 'Routine name',
    },
    'hve3d9eg': {
      'fi': 'Treenipohjan kommentti 💬',
      'en': 'Routine comment 💬',
    },
    'fku8v94c': {
      'fi': 'Liikkeen nimi',
      'en': 'Exercise name',
    },
    'p6ehf4o5': {
      'fi': 'Liikkeen kommentti',
      'en': 'Exercise comment',
    },
    'm9mgmk0g': {
      'fi': 'Lisää liike',
      'en': 'Add exercise',
    },
    'f5f0mc89': {
      'fi': 'Lopeta muokkaus',
      'en': 'Finish editing',
    },
    'xvtlnaay': {
      'fi': 'Treenihistoria',
      'en': 'Worcout history',
    },
    '5o4nggqe': {
      'fi': 'Treenaa nyt',
      'en': 'Start now',
    },
  },
  // Miscellaneous
  {
    'tjoan72u': {
      'fi': 'Sovellus tarvitsee luvan lähettää ilmoituksia',
      'en': 'Permission needed for sending notifications',
    },
    '5x6hdd8r': {
      'fi':
          'Lupa käyttää kalenteria tarvitaan, jotta treenien lisääminen kalenteriin onnistuisi.',
      'en': 'Permission for calendar is need to add workouts to calendar',
    },
    '1u6cda3u': {
      'fi': '😭Virhe: [error]',
      'en': '😭Error: [error]',
    },
    'au7x8ize': {
      'fi': '✅ Salasanan vaihtolinkki lähetetty sähköpostiisi!',
      'en': '✅ Password reset email sent!',
    },
    'lhbjyw2o': {
      'fi': '❗Sähköposti on pakollinen!',
      'en': '❗Email required!',
    },
    'zr9l0xc3': {
      'fi': '❗Puhelinnumero tarvitaan ja sen pitää alkaa + merkillä.',
      'en': '❗Phone number required and has to start with +',
    },
    'r9kev20w': {
      'fi': '🙅 Salasanat eivät täsmää',
      'en': '🙅 Passwords don\'t match',
    },
    'oy345b43': {
      'fi': '💬 Syötä tekstiviestivahvistuskoodi',
      'en': '💬 Enter SMS verification code',
    },
    'tsdpc6n6': {
      'fi':
          'Liian kauan viimeisimmästä sisäänkirjautumisesta. Kirjaudu uudelleen sisään ennen kuin poistat tilisi.',
      'en':
          'Too long since most recent sign in. Sign in again before deleting your account.',
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
