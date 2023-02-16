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
  // treeniRutiinit
  {
    'uwbd7u0v': {
      'fi': 'Treenirutiinit',
      'en': 'Worcout routines',
    },
    'tki5o3m2': {
      'fi': 'Luo tili',
      'en': 'Create account',
    },
    'n2lnw1tc': {
      'fi': 'Treenirutiinit',
      'en': 'Workout routines',
    },
    'xdjt7h9s': {
      'fi': 'Treenihistoria',
      'en': 'Workout history',
    },
    'qz51yime': {
      'fi': 'Analytiikka',
      'en': 'Analytics',
    },
    'h5cqva6j': {
      'fi': 'Asetukset',
      'en': 'Settings',
    },
    'y2oim1eg': {
      'fi': 'Lähetä palaute',
      'en': 'Send feedback',
    },
    'mqf5zmpq': {
      'fi': 'Tietosuoja ja käyttöehdot',
      'en': 'Privacy policy and User agreetment',
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
  // luoRutiiniSivu
  {
    '3zslehjv': {
      'fi': 'Rutiinin / ohjelman nimi',
      'en': 'Routine / workout name',
    },
    'hyob330v': {
      'fi': 'esim Ylövartalo, Työhtävät tai Juoksu',
      'en': '\nRoutine name (e.g. Upper body or Rnning)',
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
  // luoLiikeSivu
  {
    'kf3zbmmg': {
      'fi': 'Treeniliikkeen luominen',
      'en': 'Create an new exercise',
    },
    '7qho7dik': {
      'fi': 'Koti',
      'en': 'Home',
    },
  },
  // getStartedPage
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
    'l8prkehd': {
      'fi': 'Seuraava',
      'en': 'Next',
    },
    '0mk4h58t': {
      'fi': 'Home',
      'en': 'Home',
    },
  },
  // navBarPage1
  {
    'zbs6e136': {
      'fi': 'Button',
      'en': '',
    },
    'rmgg2g5f': {
      'fi': 'Luo ohjelma',
      'en': 'Create routine',
    },
    'ogtztobw': {
      'fi': 'Valitse treeni rutiini ja aloita treenaaminen',
      'en': 'Select routine and start training',
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
    'qdzyod45': {
      'fi': 'Aloita treenaaminen',
      'en': 'Start workout',
    },
    '83k34jhr': {
      'fi': 'Treenaa',
      'en': 'Train',
    },
  },
  // navBarPage3
  {
    '5cvj3ee1': {
      'fi': 'Home',
      'en': 'home',
    },
  },
  // chooseModePage
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
  // mainPageeee
  {
    '5tm3fmm4': {
      'fi': 'Home',
      'en': '',
    },
  },
  // songDetailsPage
  {
    'xkh8lxgv': {
      'fi': 'Now Playing',
      'en': '',
    },
    'szrxfdg4': {
      'fi': '2:25',
      'en': '',
    },
    'qgl5p0vw': {
      'fi': '4:02',
      'en': '',
    },
    'rc3y0eva': {
      'fi': 'Lyrics',
      'en': '',
    },
    'yk48zt41': {
      'fi': 'Home',
      'en': '',
    },
  },
  // songLyricsPage
  {
    'kw98bf1j': {
      'fi':
          'Well, I found a woman, stronger than \n\nanyone I know\n\nShe shares my dreams, I hope that \n\nsomeday I\'ll share her home\n\nI found a lover, to carry more than just \n\nmy secrets\n\nTo carry love, to carry children of our \n\nown\n',
      'en': '',
    },
    '7q332qcx': {
      'fi': 'We are still kids, but we\'re so in love. \n',
      'en': '',
    },
    'jgm5tkga': {
      'fi':
          'Fighting against all odds I know we\'ll be\n\nalright this time Darling, just hold my \n\nhand Be my girl, I\'ll be your man\n\nI see my future in your eyes',
      'en': '',
    },
    'bwj4e3kh': {
      'fi': '2:25',
      'en': '',
    },
    'u7rs8qhs': {
      'fi': '4:02',
      'en': '',
    },
    '3l1f7p06': {
      'fi': 'Home',
      'en': '',
    },
  },
  // userProfilePage
  {
    'v9pb51mn': {
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
  // testailu
  {
    '0kxnxyi3': {
      'fi': 'Home',
      'en': '',
    },
  },
  // ProfilePage
  {
    'pnobztlw': {
      'fi': 'Profile',
      'en': '',
    },
    'd5zmc5k9': {
      'fi': 'alvishramani4@gmail.com',
      'en': '',
    },
    'v03s3k6z': {
      'fi': 'Alvish0407',
      'en': '',
    },
    '784x1lrg': {
      'fi': '09',
      'en': '',
    },
    'i4z8pphd': {
      'fi': 'Followers',
      'en': '',
    },
    '12se3d8g': {
      'fi': '19',
      'en': '',
    },
    '108ic2nq': {
      'fi': 'Following',
      'en': '',
    },
    '4kfffoxq': {
      'fi': 'PUBLIC PLAYLISTS',
      'en': '',
    },
    '6fgu9hov': {
      'fi': 'Wrap 2022',
      'en': '',
    },
    'lckback2': {
      'fi': '101 Songs',
      'en': '',
    },
    'a099ymbc': {
      'fi': '6:00:00',
      'en': '',
    },
    'agiu9ijz': {
      'fi': 'Wrap 2021',
      'en': '',
    },
    '8nww9w03': {
      'fi': '100 Songs',
      'en': '',
    },
    'gmwbdui7': {
      'fi': '6:00:00',
      'en': '',
    },
    'r6q92ivg': {
      'fi': 'Goes Relax',
      'en': '',
    },
    'kp2ysvx1': {
      'fi': '94 Songs',
      'en': '',
    },
    'd3dczm6g': {
      'fi': '5:30:00',
      'en': '',
    },
    'nd8jznnt': {
      'fi': 'JB\'s World',
      'en': '',
    },
    '7qhyvmog': {
      'fi': '17 Songs',
      'en': '',
    },
    'od0jn1lk': {
      'fi': '58:02',
      'en': '',
    },
    'xyplm3cl': {
      'fi': '1 Direction',
      'en': '',
    },
    'taju221k': {
      'fi': '21 Songs',
      'en': '',
    },
    't6wlsi7w': {
      'fi': '01:14',
      'en': '',
    },
    'p3c7nun3': {
      'fi': 'Maroon 5',
      'en': '',
    },
    'xb2lhmse': {
      'fi': '8 Songs',
      'en': '',
    },
    'fszpymfl': {
      'fi': '29:20',
      'en': '',
    },
    'u8tn55ba': {
      'fi': 'ColdPlay\'s Age',
      'en': '',
    },
    'hglzgw9n': {
      'fi': '8 Songs',
      'en': '',
    },
    '0or8ycm1': {
      'fi': '35:47',
      'en': '',
    },
  },
  // FavouritePage
  {
    'zgkylfxt': {
      'fi': 'Ed Sheeran',
      'en': '',
    },
    'fj4mc0q5': {
      'fi': '5 Album , 256 Track',
      'en': '',
    },
    '70uzvugp': {
      'fi':
          'Edward Christopher Sheeran MBE is an English singer-songwriter. Born in Halifax, West Yorkshire and raised in Framlingham, Suffolk, he began writing songs around the age of eleven.',
      'en': '',
    },
    '6uhvfrr8': {
      'fi': 'Albums',
      'en': '',
    },
    'in0j6vlt': {
      'fi': '= (Tour Edition)',
      'en': '',
    },
    'rbvytv3i': {
      'fi': 'No.6 Collaboration ...',
      'en': '',
    },
    'r4fhi2mi': {
      'fi': '÷ (Deluxe)',
      'en': '',
    },
    't8tbhx9a': {
      'fi': 'x (Wembley Edition)',
      'en': '',
    },
    'za8w437i': {
      'fi': '+',
      'en': '',
    },
    '973m28ev': {
      'fi': 'Songs',
      'en': '',
    },
    'p2vozggh': {
      'fi': 'See More',
      'en': '',
    },
    'lagn53da': {
      'fi': 'Celestial',
      'en': '',
    },
    'dthj8id0': {
      'fi': 'Pokemon x Ed Sheeran',
      'en': '',
    },
    's0j2mpg6': {
      'fi': '03:29',
      'en': '',
    },
    'jhhathih': {
      'fi': 'Bam Bam',
      'en': '',
    },
    '62zjeea2': {
      'fi': 'Camiila Cabello x Ed Sh...',
      'en': '',
    },
    '8s3r0cyq': {
      'fi': '03:26',
      'en': '',
    },
    'vo1z9jfg': {
      'fi': 'Merry Christmas',
      'en': '',
    },
    'vh5hts3g': {
      'fi': 'Elton John x Ed Sheeran',
      'en': '',
    },
    'qblr47xy': {
      'fi': '03:28',
      'en': '',
    },
    'j8h6603m': {
      'fi': 'TJATQ',
      'en': '',
    },
    'i92inv3i': {
      'fi': 'Tylor Swift x Ed Sheeran',
      'en': '',
    },
    '3fr3cetm': {
      'fi': '03:05',
      'en': '',
    },
    'a4mfeytx': {
      'fi': 'Call on me',
      'en': '',
    },
    'a9tck26d': {
      'fi': 'Vianney x Ed Sheeran',
      'en': '',
    },
    'ymmr475n': {
      'fi': '03:20',
      'en': '',
    },
  },
  // HomePage
  {
    'opbwkg3w': {
      'fi': 'New Song',
      'en': '',
    },
    '0831f2fu': {
      'fi': 'F64',
      'en': '',
    },
    '3yetjsgr': {
      'fi': 'Ed Sheeran',
      'en': '',
    },
    'ce01zixk': {
      'fi': 'Songs',
      'en': '',
    },
    'yfqmxmcb': {
      'fi': 'Albums',
      'en': '',
    },
    '0455wd4w': {
      'fi': 'Artists',
      'en': '',
    },
    'rx411xod': {
      'fi': 'Podcasts',
      'en': '',
    },
    'jp86rxll': {
      'fi': 'Playlists',
      'en': '',
    },
    'qjcpyx7s': {
      'fi': 'If I Can Dream',
      'en': '',
    },
    '5g2rl7q0': {
      'fi': 'Elvis Presely',
      'en': '',
    },
    'lhaduo9z': {
      'fi': 'Love Yourself',
      'en': '',
    },
    'dlemjq9b': {
      'fi': 'Justin Bieber',
      'en': '',
    },
    '38x759gx': {
      'fi': 'Fix You',
      'en': '',
    },
    'rkl9muhf': {
      'fi': 'Coldplay',
      'en': '',
    },
    '1tchxm02': {
      'fi': 'As It Was',
      'en': '',
    },
    'c1jilrrm': {
      'fi': 'Harry Styles',
      'en': '',
    },
    'h7a22uv2': {
      'fi': 'Albums',
      'en': '',
    },
    'nvlw00t6': {
      'fi': 'See More',
      'en': '',
    },
    'h0r5y9xx': {
      'fi': 'Elvis 30 #1 Hits',
      'en': '',
    },
    'p8f12dxq': {
      'fi': 'Elvis Presely',
      'en': '',
    },
    'c92dnb8o': {
      'fi': '1:18:00',
      'en': '',
    },
    'jx4vkzlr': {
      'fi': 'Fine Line',
      'en': '',
    },
    'todg5b5t': {
      'fi': 'Harry Styles',
      'en': '',
    },
    'uqxydkyy': {
      'fi': '46:43',
      'en': '',
    },
    'qymrmifh': {
      'fi': 'FOUR (Deluxe)',
      'en': '',
    },
    'hv9a922v': {
      'fi': 'One Direction',
      'en': '',
    },
    'so4ezntq': {
      'fi': '57:15',
      'en': '',
    },
    'hijmeagw': {
      'fi': 'V (Asis Tour)',
      'en': '',
    },
    'zh8ahm8i': {
      'fi': 'Maroon 5',
      'en': '',
    },
    '6hjsccf1': {
      'fi': '1:18:00',
      'en': '',
    },
  },
  // ToistotTalteen
  {
    'ezf7x56w': {
      'fi': 'Toistot Talteen',
      'en': 'Toistot Talteen',
    },
  },
  // treeniRutiini
  {
    '0m4il322': {
      'fi': 'Heatmap kalenteri',
      'en': 'Heatmap valendar',
    },
    'r1v3hyro': {
      'fi':
          'Ota pohjaksi valitun päivän treeni. Muuten pohjana on perusrutiini.',
      'en':
          'Use the selected day\'s training as a basis. Otherwise, the basis is the basic routine.',
    },
    'hn9k2t8e': {
      'fi': 'Treenaa',
      'en': 'Start',
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
      'en': '\nRoutine name (e.g. Upper body or Rnning)',
    },
    'x622rgz7': {
      'fi': 'KUNTOSALI (penkki, pystypunnerrus käsipainolla jne...)',
      'en': 'gym exercise (Bench Press, Dumbell flies etc...)',
    },
    '9sqedszu': {
      'fi': 'KEHONPAINO (lankku, punnerrukset jne...)',
      'en': 'bodyweight (blank, push ups etc...)',
    },
    '5gdi5onb': {
      'fi': 'AEROBINEN (Uinti, juoksu, jalkapallo jne...)',
      'en': 'cardio (Swimming, running, football etc...)',
    },
    'ithsk40p': {
      'fi': 'MUU (laskettelu, sukellus, seinäkiipeily jne.)',
      'en': 'OTHER (diving, boulder, skateboarding etc.)',
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
  // MyIconButtonCopy
  {
    'dy1gb863': {
      'fi': 'Poista',
      'en': 'Delete',
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
