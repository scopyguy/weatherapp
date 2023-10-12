import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InterstitialAdPage extends StatefulWidget {
  const InterstitialAdPage({Key? key}) : super(key: key);

  @override
  _InterstitialAdPageState createState() => _InterstitialAdPageState();
}

class _InterstitialAdPageState extends State<InterstitialAdPage> {
  InterstitialAd? _interstitialAd;

  @override
  void initState() {
    super.initState();
    loadInterstitial();
  }

  void loadInterstitial() {
    var platform = Theme.of(context).platform;
    String interstitialAdId = platform == TargetPlatform.iOS
        ? "'ca-app-pub-3940256099942544/1033173712'"
        : "'ca-app-pub-3940256099942544/4411468910'";

    InterstitialAd.load(
      adUnitId: interstitialAdId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          debugPrint('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  void showInterstitial() {
    if (_interstitialAd != null) {
      _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (ad) {},
        onAdDismissedFullScreenContent: (ad) {
          ad.dispose();
          loadInterstitial();
        },
        onAdFailedToShowFullScreenContent: (ad, error) {
          ad.dispose();
          loadInterstitial();
        },
      );

      _interstitialAd!.show();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Your UI widgets go here
    return Scaffold(
      appBar: AppBar(
        title: Text('Interstitial Ad Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: showInterstitial,
          child: Text('Show Interstitial Ad'),
        ),
      ),
    );
  }
}
