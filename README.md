# MNC-BF — Madicom Network Centre

**Version :** 0.2.0-alpha  
**Propriété :** ITSM SOLUTIONS  
**Auteur :** Madi COMPAORÉ  
**Package Android :** `bf.itsmsolutions.mnc`

## Objectif Alpha 0.2

Alpha 0.2 conserve le moteur de découverte de l'Alpha 0.1 et ajoute le premier adaptateur constructeur réellement administrable : **MikroTik RouterOS 7** via la REST API officielle.

## Fonctionnalités

### Discovery

- Android 10+ (`minSdk 29`)
- détection du réseau IPv4 actif ;
- scan plafonné au /24 local ;
- probes reachability + TCP (22, 53, 80, 443, 8291, 8728, 8729) ;
- fingerprint initial MikroTik ;
- ajout manuel par IP ;
- Room : équipements, sessions de scan et journal ;
- ouverture de WebUI ;
- permission `ACCESS_LOCAL_NETWORK` sur Android 17+.

### MikroTik Adapter

- authentification RouterOS REST par HTTP Basic Auth ;
- HTTPS recommandé (`www-ssl`) ;
- HTTP disponible uniquement pour LAN de test ;
- option explicite pour certificats auto-signés en laboratoire ;
- identité, modèle, numéro de série, RouterOS, architecture ;
- CPU, charge, RAM, uptime ;
- interfaces et états ;
- adresses IP ;
- baux DHCP ;
- prise en charge de `/interface/wifi` et fallback `/interface/wireless` ;
- stations Wi-Fi ;
- modification SSID et activation/désactivation radio ;
- modification d'une IP statique avec avertissement ;
- redémarrage ;
- export de configuration `.rsc` dans le menu Files du routeur ;
- journalisation des opérations sans écrire les mots de passe.

## Pré-requis MikroTik

RouterOS 7 avec l'un des services suivants :

- `www-ssl` pour `https://<IP>/rest` — recommandé ;
- `www` pour `http://<IP>/rest` — uniquement en environnement maîtrisé.

Le compte RouterOS utilisé doit avoir les droits nécessaires aux opérations demandées.

## Limites Alpha 0.2

- le fichier `.rsc` est créé sur le routeur ; son téléchargement local sera ajouté dans une version ultérieure ;
- l'édition Wi-Fi cible SSID + état radio ; la gestion complète sécurité/canal/puissance viendra après validation sur plusieurs familles RouterOS ;
- l'édition IP peut interrompre la session si l'adresse de management est modifiée ;
- COMFAST, Ubiquiti, Grandstream, WAVLINK et TP-Link conservent le mode Discovery/WebUI pour l'instant.

## Build

Configuration prévue :

- Android Studio Quail 4 ou version stable compatible ;
- AGP 9.4.0 ;
- Gradle 9.6.0 ;
- JDK 17 ;
- compileSdk / targetSdk 37 ;
- Kotlin 2.4.20 ;
- Jetpack Compose ;
- Room 2.8.5 ;
- KSP 2.3.12.

Commande :

```bash
./gradlew assembleDebug
```

APK attendu :

```text
app/build/outputs/apk/debug/app-debug.apk
```

## Sécurité

MNC-BF est destiné à l'administration d'équipements pour lesquels l'utilisateur dispose d'une autorisation. Les mots de passe RouterOS sont maintenus uniquement en mémoire pour la session courante et ne sont ni écrits dans Room ni journalisés.
