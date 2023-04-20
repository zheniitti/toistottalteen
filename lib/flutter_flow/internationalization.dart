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
      'fi': 'tai',
      'en': 'or',
    },
    'm7gpe2ik': {
      'fi': 'Jatka ilman kirjautumista',
      'en': 'Continue without login',
    },
    'hqdjtyfp': {
      'fi': 'Tietosuoja ja käyttöehdot',
      'en': 'Privacy policy and Use terms',
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
      'fi': 'Rakennellaan ja kokeillaan erilaisia widgetteja',
      'en': '',
    },
    't3ej29tw': {
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
  // paasivu
  {
    '858ldjbd': {
      'fi': 'Luo treenirutiini',
      'en': 'Create new routine',
    },
    'akpw7eif': {
      'fi': 'Aloita treeni',
      'en': 'Start workout',
    },
    'h3pa0vyr': {
      'fi': 'Option 1',
      'en': '',
    },
    '0pd3kqsz': {
      'fi': 'Lopeta',
      'en': 'Finish',
    },
    'a1ioybeh': {
      'fi': 'Treenirutiinit (ohjelmat)',
      'en': 'Training routines',
    },
  },
  // FeedbackPage
  {
    '69s07yb4': {
      'fi': 'Palautteet',
      'en': 'Feedback',
    },
    'm26op9sp': {
      'fi': 'Kirjoita tähän...',
      'en': 'Type here...',
    },
    'g8jwin03': {
      'fi': 'Lähetä',
      'en': 'Send',
    },
    'nxkp7745': {
      'fi': 'Home',
      'en': '',
    },
  },
  // Webview1
  {
    '0zr7jbti': {
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
    'ydiiiguc': {
      'fi': 'Kesto: ',
      'en': 'Duration: ',
    },
    'vjrwisv6': {
      'fi': ' treeni',
      'en': ' workout',
    },
    '7rjum2jr': {
      'fi': 'Treenaa uudestaan',
      'en': 'Workout again',
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
    'hijwa5p7': {
      'fi': 'Option 1',
      'en': '',
    },
    'z0aezlp0': {
      'fi': '',
      'en': '',
    },
    'l7w663ju': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Commment (Optional)',
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
    'kmmmsdb7': {
      'fi': 'Treenihistoria',
      'en': 'Workout history',
    },
    'e4qtfwaz': {
      'fi': 'Treenitilastot',
      'en': 'Workout Statistics',
    },
    '5enw2bkt': {
      'fi': '(kehitys kesken)',
      'en': '(in development)',
    },
    'uvhkl89u': {
      'fi': 'Lahjoita ja tue',
      'en': 'Donate and support',
    },
    'mu0qny93': {
      'fi': 'Lähetä palaute',
      'en': 'Send feedback',
    },
    'ornov325': {
      'fi': 'Tietoa sovelluksesta',
      'en': 'About the app',
    },
    '2ttiy67c': {
      'fi': 'Tietosuoja ja käyttöehdot',
      'en': 'Privacy policy and Terms of Use',
    },
    'ny2fhrqk': {
      'fi': 'Lähetä palaute',
      'en': 'Send feedback',
    },
    'nn03r681': {
      'fi': 'Kirjaudu ulos',
      'en': 'Log out',
    },
    'fm0iywi0': {
      'fi': 'Kirjaudu ulos',
      'en': 'Log out',
    },
  },
  // sivu_rutiinit_komponentti
  {
    'fl9eccts': {
      'fi': 'Hakutulokset hakusanalla ',
      'en': 'Search result for ',
    },
  },
  // sivu_treeniHistoria_komponentti
  {
    'i315lsnw': {
      'fi': 'Lisää treeni',
      'en': 'Add workout',
    },
  },
  // bottomSheet_rutiiniJaSessio
  {
    'elbafojn': {
      'fi': 'Kopioi liikkeet',
      'en': 'Copy excercises',
    },
    'pygax2u5': {
      'fi': 'Luo treenipohja',
      'en': 'Create routine',
    },
    '0vq9oyjs': {
      'fi': '',
      'en': '',
    },
    'e0l254zt': {
      'fi': 'Muokkaa',
      'en': 'Edit',
    },
    '0i5m3pzx': {
      'fi': 'Lopeta muokkaus',
      'en': 'Finish editing',
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
      'fi': 'Luo treenipohja',
      'en': 'Create an routine',
    },
  },
  // sivu_treenaa_komponentti
  {
    'k8l5bzfl': {
      'fi': 'Lisää  liike',
      'en': 'New exercise',
    },
    'hr61kg7a': {
      'fi': 'Valitse treenattava treenipohja\n\ntai',
      'en': 'Choose a routine to workout\n\nor',
    },
    'uz6rq23u': {
      'fi': 'Aloita tyhjä treeni',
      'en': 'Start an empty workout',
    },
  },
  // rutiini
  {
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
    '5o4nggqe': {
      'fi': 'Treenaa nyt',
      'en': 'Start now',
    },
    'm9mgmk0g': {
      'fi': 'Lisää harjoitusliike',
      'en': 'Add an exercise',
    },
    '1qnpeziw': {
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
  // sessioChunk
  {
    'ynavrwwp': {
      'fi': 'Tämä sivu on tyhjä koska sinulla ei ole vielä tehtyjä treenejä',
      'en': 'This page is empty because you don\'t have finished workouts yet',
    },
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
    'euebpkmp': {
      'fi': 'Sarjat',
      'en': 'Sets',
    },
    'xd9oxn6z': {
      'fi': 'Toistot',
      'en': 'Reps',
    },
    'odm165t6': {
      'fi': 'Paino',
      'en': 'Weigth',
    },
    'l902twkl': {
      'fi': 'tunnit',
      'en': 'hours',
    },
    'nz790l15': {
      'fi': '',
      'en': '',
    },
    'ojelm1c7': {
      'fi': 'minuutit',
      'en': 'minutes',
    },
    'vjqtyunu': {
      'fi': '',
      'en': '',
    },
    'etxlmgz3': {
      'fi': 'sekunnit',
      'en': 'seconds',
    },
    'oeeapx3v': {
      'fi': '',
      'en': '',
    },
    'xp3fncw0': {
      'fi': 'Tavaoitematka (metrit)',
      'en': 'Distance (meters)',
    },
    '9nrrllh6': {
      'fi': '',
      'en': '',
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
    '45p8jvgv': {
      'fi': 'Tunnit',
      'en': 'Hours',
    },
    'hul5vo4m': {
      'fi': 'Minuutit',
      'en': 'minutes',
    },
    'e4mivh1l': {
      'fi': 'sekunnit',
      'en': 'seconds',
    },
    'f6lmo02d': {
      'fi': 'Matka (metreinä)',
      'en': 'Distance (in meters)',
    },
  },
  // bottomSheet_liike
  {
    'omr6g5ov': {
      'fi': 'Saliliike',
      'en': 'Gym exercise',
    },
    'k0xw8zra': {
      'fi': 'Muu liike',
      'en': 'Other',
    },
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
  // nameAndCommentFieldsOfSessio
  {
    'hccf15of': {
      'fi': '',
      'en': '',
    },
    'pah0obna': {
      'fi': 'Treenin nimi',
      'en': 'Workout name',
    },
    'aioz4jxf': {
      'fi': 'Option 1',
      'en': '',
    },
    'b5n4twdx': {
      'fi': 'Kommentti (vapaaehtoinen)',
      'en': 'Comment (optional)',
    },
  },
  // LiikeStats
  {
    'dyrq0frb': {
      'fi': 'Painon  ja toiston korrelaatio',
      'en': 'Correlation of weight and reps',
    },
    '4ku6t0l0': {
      'fi': 'Paino',
      'en': 'Weight',
    },
    'vrypgu4p': {
      'fi': 'Toistot',
      'en': 'Reps',
    },
    'h9i7gu0b': {
      'fi': 'Liikkeen nimi',
      'en': 'Exercise name',
    },
    '9fivvb5b': {
      'fi': 'Option 1',
      'en': '',
    },
  },
  // sessioLiikeSarjas
  {
    'gl0py1hq': {
      'fi': 'sarjaa',
      'en': 'sets',
    },
  },
  // sarjatTreeninAikana
  {
    'pcie3aom': {
      'fi': 'Paino (kg)',
      'en': 'Weight (kg)',
    },
    'i1hh5xau': {
      'fi': 'Toistot',
      'en': 'Reps',
    },
    '6wdceyvb': {
      'fi': '.\nsarja',
      'en': '.\nset',
    },
    'hx98f9iz': {
      'fi': 'Tehty',
      'en': 'Done',
    },
    'wtzx9j32': {
      'fi': 'Lisää sarja',
      'en': 'Add a set',
    },
    'zfrwzd38': {
      'fi': 'Tehty',
      'en': 'Done',
    },
  },
  // RevenueCatSubsriptionPaywall
  {
    'lrqejpcm': {
      'fi': '✨Lahjoita ja poista mainokset',
      'en': '✨Donate and remove ads',
    },
    'czvjejf2': {
      'fi':
          'Sovellukseen kehittämiseen on käytetty yli sata tuntia ilman palkkiota. Tue sovelluskehitystä lahjoittamalla',
      'en':
          'More than a hundred hours have been spent on developing the application. Support app development by donating',
    },
    'x5xjq0bo': {
      'fi': 'Kuukausittainen lahjoitus',
      'en': 'Monthly donation',
    },
    '2vcgcvkw': {
      'fi': 'Nauti mainoksettomasta sovelluksesta kuukaudeksi',
      'en': 'Remove ads for one month',
    },
    '1h5i1pe2': {
      'fi': 'Valitse',
      'en': 'Select',
    },
    'skryuv7y': {
      'fi': 'Ostettu',
      'en': 'Purchased',
    },
    '57n31ntm': {
      'fi': 'Vuosittainen lahjoitus',
      'en': 'Annual donation',
    },
    '5i255jps': {
      'fi': 'Nauti mainoksettomasta sovelluksesta vuodeksi',
      'en': 'Remove ads for one year',
    },
    'iqr7fluo': {
      'fi': 'Valitse',
      'en': 'Select',
    },
    '8ofym9jq': {
      'fi': 'Ostettu',
      'en': 'Purchased',
    },
    'ozdly97p': {
      'fi': 'Kertalahjoitus',
      'en': 'One time donation',
    },
    'aqttc467': {
      'fi': 'Poista mainokset koko loppuelämäsi',
      'en': 'Remove ads for the rest of your life',
    },
    'oue3r96t': {
      'fi': 'Valitse',
      'en': 'Select',
    },
    'ycuf03w5': {
      'fi': 'Ostettu',
      'en': 'Purchased',
    },
    '0sem4kiu': {
      'fi': 'Aktivoi voimassaoleva ostos',
      'en': 'Restore purchase',
    },
  },
  // Miscellaneous
  {
    '55582ub6': {
      'fi': '',
      'en': '',
    },
    'aeg187sw': {
      'fi': '',
      'en': '',
    },
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
