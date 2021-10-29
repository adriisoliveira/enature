import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:payflow/models/place_search.dart';

class PlacesService {
  final key = 'AIzaSyBQUjO5GsD71dTwgAvRHvvWSeSz5MP4TRU';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    final String apiEndpoint =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key';
    final Uri url = Uri.parse(apiEndpoint);
    final response = await http.get(url);
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
