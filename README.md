# toistottalteen
Toistot talteen -sovelluksen repo
TODO: täydennä README.md





Tänne flutterflow haaraan kommitoidaan flutterflowsta ladatut koodit.

## Aloitus
FlutterFlow-projektit on rakennettu ajettavaksi Flutterin vakaa versiolla.
Tämä projekti on lähtökohta Flutter-sovellukselle.
Joitain resursseja, jotka auttavat aloittamaan, jos tämä on ensimmäinen Flutter-projektisi:

- [Lab: Kirjoita ensimmäinen Flutter-sovelluksesi](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Hyödyllisiä Flutter-näytteitä](https://flutter.dev/docs/cookbook)
Jos tarvitset apua Flutterin käyttöönotossa, tarkastele [verkkodokumentaatiotamme](https://flutter.dev/docs), joka tarjoaa opetusohjelmia, esimerkkejä, ohjeita mobiilikehitykseen ja koko API:n viittauksen.


## TÄRKEÄÄ:
Firestore-integraatiota käyttävissä projekteissa sinun täytyy ensin ajaa seuraavat komennot, jotta projekti kääntyy onnistuneesti:
```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```
Tämä komento luo luodut tiedostot, jotka muuntavat jokaisen Firestore-tietueen skeema-objektiksi.
