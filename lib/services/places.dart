import 'package:beta_hustle/Assistants/requestAssistant.dart';
import 'package:beta_hustle/configMaps.dart';

class Places {
  findPlace(String placeName) async {
    if (placeName.length > 1) {
      String autocomplete =
          "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890&component=country:GH";
      var res = await RequestAssistant.getRequest(autocomplete);
      if (res == "failed") {
        return;
      }
      print("Your Predictions::");
      print(res);
      // if(res["status"]=="OK"){

      // }
    }
  }
}
