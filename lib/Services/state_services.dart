// ignore: unused_import
import 'dart:convert';

import 'package:covid_tracker/Models/world_state_model.dart';
import 'package:covid_tracker/Services/utilities/app_url.dart';
import 'package:http/http.dart' as http;
class StateServices {
  Future<world_states_Model> fetchWorldStateRecords() async{
    
    final response = await http.get(Uri.parse(AppUrl.WorldStatesApi));
    if (response.statusCode==200) {
      var data  = jsonDecode(response.body);
      return world_states_Model.fromJson(data);

    }
    else{
      throw Exception("Error");
    }
  }
  
   Future<List<dynamic>> countriesListApi() async{
  var data;
    
    final response = await http.get(Uri.parse(AppUrl.CountriesList));
    if (response.statusCode==200) {
       data  = jsonDecode(response.body);
      return data;

    }
    else{
      throw Exception("Error");
    }
  }


}

