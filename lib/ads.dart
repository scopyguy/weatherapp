import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class InstertitialAdPage extends StatefulWidget {
  const InstertitialAdPage({super.key});

  @override
  State<InstertitialAdPage> createState() => _InstertitialAdPageState();
}

class _InstertitialAdPageState extends State<InstertitialAdPage> {
  InterstitialAd? _interstitialAd;
  @override
  Widget build(BuildContext context) {
    String BannerAd = platform == TargetPlatform.iOS ? "" : "";

    final adUnitId = instertitialAd;
    _interstitialAd?.show();
    _interstitialAd;
  
    class BannerExampleState extends State<BannerExample> {
  BannerAd? _bannerAd:
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
          debugPrint('BannerAd failed to load: $error');
    
          ad.dispose();
        },
      ),
    )..load();
  }
};
@override
    class InterstitialExampleState extends State<InterstitialExample> {
  InterstitialAd? _interstitialAd;


  final adUnitId = Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/1033173712'
    : 'ca-app-pub-3940256099942544/4411468910';

  void loadAd() {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
             ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (ad) {},
                onAdImpression: (ad) {},
                onAdFailedToShowFullScreenContent: (ad, err),
                  ad.dispose();
                  loadInstertitial(); 
                },
                onAdDismissedFullScreenContent: (ad) {
                  ad.dispose();
                  loadInstertitial();
                },
                onAdClicked: (ad) {});

            debugPrint('$ad loaded.');
            _interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('InterstitialAd failed to load: $error');
          },
        ));
  }
};
    return const Placeholder();
  }

  void initState() {
    super.initState();
    loadInstertitial();
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
}
