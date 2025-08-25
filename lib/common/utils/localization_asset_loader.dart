
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';

import '../commons.dart';

class HttpAssetLoader extends AssetLoader {
  const HttpAssetLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async {

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      return null;
    }
    final appService = getIt.get<AppService>();
    try{
      AppLog.debug('easy localization loader: load http');
      const vi = "https://api.nifehub.com/public/assets/lang_nex/vi_VN.json";
      const enUrl = "https://api.nifehub.com/public/assets/lang_nex/en_US.json";
      final response = await appService.dio.get(locale.languageCode == "vi" ? vi : enUrl);
      final data = response.data;
      return data;

    }catch (e){
      throw e.toString();
    }
  }
}