import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InstertitialAdPage extends StatefulWidget {
  const InstertitialAdPage({super.key});

  @override
  State<InstertitialAdPage> createState() => _InstertitialAdPageState();
}

class _InstertitialAdPageState extends State<InstertitialAdPage> {
  InterstitialAd? _interstitialAd;

  late BannerAd _bannerAd;
  bool _isLoaded = false;

  final adUnitId = Platform.isAndroid
      ? 'ca-app-pub-3940256099942544/6300978111'
      : 'ca-app-pub-3940256099942544/2934735716';

  void loadAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');

          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    loadInstertitial();
    loadAd();
  }

  void loadInstertitial() {
    var platform = Theme.of(context).platform;
    String instertitialAdId = platform == TargetPlatform.iOS ? "" : "";

    InterstitialAd.load(
        adUnitId: instertitialAdId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');

            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return _isLoaded
        ? ColoredBox(
            color: Colors.transparent,
            child: SizedBox(
              height: _bannerAd.size.height.toDouble(),
              width: _bannerAd.size.width.toDouble(),
              child: AdWidget(ad: _bannerAd),
            ),
          )
        : const SizedBox.shrink();
  }
}
