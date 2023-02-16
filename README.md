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





----------------------------english below-------------------------------------------------------------------




## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.

### Getting started continued:

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
