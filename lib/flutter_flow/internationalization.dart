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
    'q476nu6x': {
      'fi': 'Treenattu aika: ',
      'en': 'Time trained:',
    },
    '5hw4ug1p': {
      'fi': 'Treenejä yhteensä: ',
      'en': 'Total workouts:',
    },
    '2ebrd02h': {
      'fi': 'Home',
      'en': '',
    },
  },
  // paasivu
  {
    'uw6dunth': {
      'fi': 'Aloita treeni',
      'en': 'Start workout',
    },
    '9mvzr5ip': {
      'fi': 'Option 1',
      'en': '',
    },
    'ouj3p8pa': {
      'fi': 'Lopeta',
      'en': 'Finish',
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
      'en': 'Save daily workouts',
    },
    'lpepy92t': {
      'fi':
          'Kirjaa muistiin treeniharjoitteet ja seuraa kehitystäsi. Vie treenamisesi seuraavalle tasolle!',
      'en': 'Track your daily workout and watch your progress!',
    },
    'epmt554y': {
      'fi': 'Kirjaudu tai luo tili',
      'en': 'Create account or login',
    },
    'rwzc4awh': {
      'fi': 'Jatka ilman kirjautumista',
      'en': 'Continue without login',
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
    'v217xhtu': {
      'fi': 'Ylävartalotreeni',
      'en': 'Upper body workout',
    },
    'cfxbyihj': {
      'fi': 'Aloitettu: ',
      'en': 'Started: ',
    },
    'kyjyqea3': {
      'fi': '30 min sitten dsltkphklp',
      'en': '',
    },
    'iteexpth': {
      'fi': 'Share',
      'en': '',
    },
    'e23nbbkk': {
      'fi': 'Lorem ipsum dolor...',
      'en': '',
    },
    'tmmnmqze': {
      'fi': 'Lorem ipsum dolor...',
      'en': '',
    },
    'u76vj92f': {
      'fi': 'Aloita uusi treeni',
      'en': 'Start a new workout',
    },
    'v1rlq3l4': {
      'fi': 'Rakennellaan ja kokeillaan erilaisia widgetteja',
      'en': '',
    },
    't3ej29tw': {
      'fi': 'Home',
      'en': '',
    },
  },
  // actionsToCopy
  {
    'dgt4ezk1': {
      'fi': 'showSnackbar\n🙁 tämä toiminto ei toimi vielä...',
      'en': '',
    },
    '2f5jkjle': {
      'fi': 'updateRutiini nimi',
      'en': '',
    },
    '0r18smyh': {
      'fi': 'Page Title',
      'en': '',
    },
    'hsdzc6hf': {
      'fi': 'Home',
      'en': '',
    },
  },
  // onboarding_page
  {
    '7vvg4989': {
      'fi': 'Search for Books',
      'en': '',
    },
    'eovd8m9x': {
      'fi': 'Find amazing classic books in our library.',
      'en': '',
    },
    '69vyedi0': {
      'fi': 'Purchase Books',
      'en': '',
    },
    'fmy4s22v': {
      'fi': 'Buy and view all your favorite books you find in this library.',
      'en': '',
    },
    '8t0nqbkt': {
      'fi': 'Review Purchases',
      'en': '',
    },
    'az4f1r32': {
      'fi':
          'Keep track of all your purchases that you have made, want to trade books in? Go ahead and list them for exchange.',
      'en': '',
    },
    'bglgstik': {
      'fi': 'Continue',
      'en': '',
    },
  },
  // kirjaudu_sivu
  {
    'faomx7ia': {
      'fi': 'Kirjaudu',
      'en': 'Sign in',
    },
    'ixt1bx4l': {
      'fi': 'Kirjaudu seuraavilla vaihdoehdoilla',
      'en': 'Choose a login method',
    },
    'bkk994m5': {
      'fi': 'Google',
      'en': 'Google',
    },
    'pgktub3b': {
      'fi': 'Apple',
      'en': 'Apple',
    },
    'faxkg7hm': {
      'fi': 'Sähkö\nposti',
      'en': 'Email',
    },
    'csbrhgrc': {
      'fi': 'Puhelin\nnumero',
      'en': 'Phone\nnumber',
    },
    'o2cokl1b': {
      'fi': 'Sähköpostiosoite',
      'en': 'Email Address',
    },
    'di0t3kks': {
      'fi': 'Salasana',
      'en': 'Password',
    },
    'fj8qah3m': {
      'fi': 'Kirjaudu',
      'en': 'Login',
    },
    'o0h72rrv': {
      'fi': 'Unohditiko salasanasi?',
      'en': 'Forgot Password?',
    },
    'a6h2047q': {
      'fi': 'Puhelinnumero',
      'en': 'Phone number',
    },
    '2rl9emal': {
      'fi': 'Lähetä vahvistuskoodi',
      'en': 'Send SMS verifiation code',
    },
    'shz6a9m8': {
      'fi': 'Luo tili',
      'en': 'Sign up',
    },
    '85ixbazd': {
      'fi': 'Luo tili seuraavilla vaihtoehdoilla',
      'en': 'Choose a method to create account',
    },
    'mbvcwu2b': {
      'fi': 'Google',
      'en': 'Google',
    },
    'ycdu23af': {
      'fi': 'Apple',
      'en': 'Apple',
    },
    'jrhzkuav': {
      'fi': 'Sähkö\nposti',
      'en': 'Email',
    },
    '76tfpspt': {
      'fi': 'Puhelin\nnumero',
      'en': 'Phone\nnumber',
    },
    'bcx41kw3': {
      'fi': 'Sähköpostiosoite',
      'en': 'Email Address',
    },
    'h6m23xrn': {
      'fi': 'Salasana',
      'en': 'Password',
    },
    'ljqsus3d': {
      'fi': 'Kirjoita salasana uudelleen',
      'en': 'Confirm Password',
    },
    '73gnjam6': {
      'fi': 'Luo tili',
      'en': 'Create Account',
    },
    '5dkq9pkt': {
      'fi': 'Puhelinnumero',
      'en': 'Phone number',
    },
    'mffdiz61': {
      'fi': '+358...',
      'en': 'number starting with + sign',
    },
    'djspg1ze': {
      'fi': 'Lähetä vahvistuskoodi',
      'en': 'Send SMS verifiation code',
    },
  },
  // forgotPassword_page
  {
    'bqg6mosw': {
      'fi': 'Takaisin',
      'en': 'Back',
    },
    'cdee2yci': {
      'fi':
          'Lähetämme sinulle sähköpostin, jossa on linkki salasanan vaihtoon. Anna tiliisi yhdistetty sähköpostiosoite alle.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
    },
    'lsgkuu2w': {
      'fi': 'Sähköpostiosoite',
      'en': 'Your email address...',
    },
    'skvsfyrg': {
      'fi': '',
      'en': '',
    },
    'ltxhjq54': {
      'fi': 'Lähetä linkki',
      'en': 'Send Link',
    },
    'rbz26f9d': {
      'fi': 'Home',
      'en': '',
    },
  },
  // verifyPhoneNuber_page
  {
    'js4yep2h': {
      'fi': 'Takaisin',
      'en': 'Back',
    },
    '3a8m9btv': {
      'fi':
          'Olemme lähettäneet kuusinumeroisen koodin puhelinnumeroosi. Vahvista puhelinnumerosi kirjoittamalle saamsi koodi alle:',
      'en':
          'We have sent a six digit code to your phone number. Please verify your phone number by entering the code below:',
    },
    'vm1pinh3': {
      'fi': 'Tekstiviestivahvistuskoodi',
      'en': 'SMS verification code',
    },
    '93j0gyve': {
      'fi': '',
      'en': '',
    },
    'ptclw37b': {
      'fi': 'Vahvista',
      'en': 'Verify',
    },
    'tzx4eiaw': {
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
  // sessio
  {
    '7mlsyz8f': {
      'fi': '\n',
      'en': '\n',
    },
    '5fe6fdq5': {
      'fi': ' - ',
      'en': ' - ',
    },
    '7yngkmsu': {
      'fi': 'Kesto:\n',
      'en': 'Duration:\n',
    },
    'qfw31zro': {
      'fi': 'Liikkeitä:\n',
      'en': 'Exercises:\n',
    },
    'zg2n2e21': {
      'fi': 'Muokkaa',
      'en': 'Edit',
    },
    'h16b2vng': {
      'fi': 'Treenaa uudestaan',
      'en': 'Workout again now',
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
    'z0aezlp0': {
      'fi': '',
      'en': '',
    },
    'l7w663ju': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Commment (Optional)',
    },
    'u1j0c71n': {
      'fi': 'Toistot',
      'en': 'Reps',
    },
    '1zpp3lp9': {
      'fi': 'Paino (kg)',
      'en': 'Weight (kg)',
    },
    'hcx7u96d': {
      'fi': '.\nsarja',
      'en': '.\nset',
    },
    'dxvry4te': {
      'fi': 'Lisää sarja',
      'en': 'Add a set',
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
    'tmzzbmg6': {
      'fi': 'Treenirutiinit',
      'en': 'Workout routines',
    },
    't717139a': {
      'fi': '  (käynnissä)',
      'en': '',
    },
    'kmmmsdb7': {
      'fi': 'Treenihistoria',
      'en': 'Workout history',
    },
    'e4qtfwaz': {
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
  // sivu_rutiinit_komponentti
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
  // sivu_treeniHistoria_komponentti
  {
    'i315lsnw': {
      'fi': 'Lisää treeni',
      'en': 'Add workout',
    },
    'uur18ydl': {
      'fi': 'Tämä sivu on tyhjä koska sinulla ei ole vielä tehtyjä treenejä',
      'en': 'This page is empty because you don\'t have finished workouts yet',
    },
  },
  // bottomSheet_rutiiniJaSessio
  {
    'elbafojn': {
      'fi': 'Kopioi liikkeet',
      'en': 'Copy excercises',
    },
    'e0l254zt': {
      'fi': 'Muokkaa',
      'en': 'Edit',
    },
    'esn5dhxf': {
      'fi': 'Poista pysyvästi',
      'en': 'Delete permanently',
    },
    '2a9bmoed': {
      'fi': '(Paina pitkään)',
      'en': '(Long press)',
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
  // sivu_treenaa_komponentti
  {
    'ofm9lu9p': {
      'fi': '',
      'en': '',
    },
    'a54f48mf': {
      'fi': 'Treenin nimi',
      'en': 'Workout name',
    },
    '8prjh7ks': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Comment (optional)',
    },
    '44rq35vd': {
      'fi': 'Lisää  liike',
      'en': 'New exercise',
    },
    'hr61kg7a': {
      'fi': 'Sinulla ei ole keskeneräistä treeniä',
      'en': 'You don\'t have unfinished workouts',
    },
    'uz6rq23u': {
      'fi': 'Aloita tyhjä treeni',
      'en': 'Start an empty workout',
    },
  },
  // rutiini
  {
    'a7t1o69i': {
      'fi': '💬',
      'en': '💬',
    },
    'yi3kozht': {
      'fi': 'Treenipohjan nimi',
      'en': 'Routine name',
    },
    'kiyozfj3': {
      'fi': 'Treenipohjan kommentti 💬',
      'en': 'Routine comment 💬',
    },
    'yod6uchb': {
      'fi': 'Ma',
      'en': 'Mon',
    },
    'vv4fc4r4': {
      'fi': 'Ti',
      'en': 'Tue',
    },
    'yuw8d4lw': {
      'fi': 'Ke',
      'en': 'Wed',
    },
    'ruf636mt': {
      'fi': 'To',
      'en': 'Thu',
    },
    'an7uyedx': {
      'fi': 'Pe',
      'en': 'Fri',
    },
    'vlibsxm0': {
      'fi': 'La',
      'en': 'Sat',
    },
    'c5mfuuxh': {
      'fi': 'Su',
      'en': 'Sun',
    },
    'qqp0ddb4': {
      'fi': 'Treenipäivät ',
      'en': 'Workout days ',
    },
    'zuph6hae': {
      'fi': 'Muokkaa',
      'en': 'Edit',
    },
    'xvtlnaay': {
      'fi': 'Muokkaa',
      'en': 'Muokkaa',
    },
    '5o4nggqe': {
      'fi': 'Treenaa nyt',
      'en': 'Start now',
    },
    'm9mgmk0g': {
      'fi': 'Lisää harjoitusliike',
      'en': 'Add an exercise',
    },
    's66i837o': {
      'fi': 'Lopeta muokkaus',
      'en': 'Finish editing',
    },
  },
  // rutiininLiikeNimiTextfield
  {
    '6g69qd7e': {
      'fi': 'Treenilikkeen nimi',
      'en': 'Exercise name',
    },
  },
  // rutiininLiikeKommenttiTextfield
  {
    'jc8zfh0n': {
      'fi': 'Kommentti 💬',
      'en': 'Comment 💬',
    },
  },
  // sarjaToistotTextfield
  {
    'yylnuo9q': {
      'fi': '0',
      'en': '0',
    },
  },
  // sarjaPainoTextfield
  {
    'vd95k1b9': {
      'fi': '0',
      'en': '0',
    },
  },
  // sessioChunk
  {
    '5smr29rj': {
      'fi': 'Näytä lisää',
      'en': 'Show more',
    },
  },
  // workoutDurationText
  {
    '5hy3i3cg': {
      'fi': 'Kesto: ',
      'en': 'Duration: ',
    },
  },
  // rutiininLiikkeet
  {
    'sqgnk84v': {
      'fi': ' sarjaa',
      'en': ' sets',
    },
    '5aat8tgq': {
      'fi': ' toistoa',
      'en': ' reps',
    },
    'kyunprgy': {
      'fi': ' tuntia ',
      'en': ' hours ',
    },
    'pa1hiz52': {
      'fi': ' minuuttia',
      'en': ' minutes',
    },
    '8r7ks2w3': {
      'fi': ' sekuntia',
      'en': ' secs',
    },
    'ud5vyksn': {
      'fi': 'm',
      'en': 'm',
    },
  },
  // KeskenerainenTreeni_komponentti
  {
    'tghu42c9': {
      'fi': 'Sinulla on keskeneräinen treeni',
      'en': 'You have an unfinished workout',
    },
    'j7w2zxkt': {
      'fi': 'Aloitettu ',
      'en': 'Started ',
    },
    's3c8dkfv': {
      'fi': 'Lopeta treeni',
      'en': 'Finish workout',
    },
    '9x6faz9l': {
      'fi': 'Jatka treeniä',
      'en': 'Continue workout',
    },
  },
  // rutiininSarjatToistotKestoMatka
  {
    'uldbvwai': {
      'fi': 'Saliliike',
      'en': 'Gym exercise',
    },
    'ij0w6eqz': {
      'fi': 'Muu liike',
      'en': 'Other',
    },
    'gvvprt6x': {
      'fi': 'Sarjoja',
      'en': 'Sets',
    },
    'yjs84ujo': {
      'fi': '0',
      'en': '0',
    },
    'dhzfkcwc': {
      'fi': 'Toistoja',
      'en': 'Reps',
    },
    'jxc1vh6s': {
      'fi': '0',
      'en': '0',
    },
    'odm165t6': {
      'fi': 'Paino',
      'en': 'Weigth',
    },
    'shv30dhh': {
      'fi': '0',
      'en': '0',
    },
    'nz790l15': {
      'fi': 'Tunnit',
      'en': 'Hours',
    },
    'lxvwsp6b': {
      'fi': '0',
      'en': '0',
    },
    'vjqtyunu': {
      'fi': 'Minuutit',
      'en': 'Minutes',
    },
    '5il8gfi6': {
      'fi': '0',
      'en': '0',
    },
    'oeeapx3v': {
      'fi': 'Sekunnit',
      'en': 'Secs',
    },
    'rny4ijb3': {
      'fi': '0',
      'en': '0',
    },
    '9nrrllh6': {
      'fi': 'Tavoitematka (metreinä)',
      'en': 'Goal distance (meters)',
    },
    '9yecgbpi': {
      'fi': '0 m',
      'en': '0 m',
    },
    'i7qdvfiw': {
      'fi': 'Tyhjennä',
      'en': 'Reset',
    },
    'l3dlilme': {
      'fi': 'Tallenna',
      'en': 'Save',
    },
  },
  // otherTypeLiikeFields
  {
    'qzi0xoig': {
      'fi': 'Tunnit',
      'en': 'Hours',
    },
    '0ry7n4gd': {
      'fi': '0',
      'en': '0',
    },
    'qc0cirns': {
      'fi': 'Minuutit',
      'en': 'Minutes',
    },
    'olh9qolp': {
      'fi': '0',
      'en': '0',
    },
    'zcwbr62z': {
      'fi': 'Sekunnit',
      'en': 'Secs',
    },
    'm6zgwhps': {
      'fi': '0',
      'en': '0',
    },
    'emfp4ohz': {
      'fi': 'matka (metreinä)',
      'en': 'distance (meters)',
    },
    'tnb4m9hm': {
      'fi': '0.0',
      'en': '0.0',
    },
  },
  // bottomSheet_liike
  {
    '9s0xqn9g': {
      'fi': 'Kopioi liike',
      'en': 'Copy excercise',
    },
    '1ejk01eg': {
      'fi': 'Liitä yläpuolelle',
      'en': 'Paste above',
    },
    'n87lfy7j': {
      'fi': 'Liitä alapuolelle',
      'en': 'Paste below',
    },
    'c8ldb00c': {
      'fi': 'Poista liike',
      'en': 'Remove excercise',
    },
    'ha2mfouu': {
      'fi': '(Paina pitkään)',
      'en': '(Long press)',
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
    'djvqv52f': {
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
