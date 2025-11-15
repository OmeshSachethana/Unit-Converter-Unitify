import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdMobService {
  static String get bannerAdUnitId => 'ca-app-pub-7716352626622549/8653208183';
  static String get interstitialAdUnitId => 'ca-app-pub-7716352626622549/2973947033';

  static int _conversionCount = 0;
  static InterstitialAd? _interstitialAd;

  static Future<void> initialize() async {
    await MobileAds.instance.initialize();
  }

  static BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    );
  }

  static void trackConversion() {
    _conversionCount++;
    
    if (_conversionCount >= 3) {
      _showInterstitialAd();
      _conversionCount = 0; // Reset counter
    }
  }

  static void _showInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (InterstitialAd ad) {
          _interstitialAd = ad;
          _interstitialAd?.show();
        },
        onAdFailedToLoad: (LoadAdError error) {
          _interstitialAd = null;
          print('InterstitialAd failed to load: $error');
        },
      ),
    );
  }

  static void disposeInterstitialAd() {
    _interstitialAd?.dispose();
    _interstitialAd = null;
  }
}