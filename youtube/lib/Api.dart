import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:youtube/Video.dart';

const CHAVE_API = '';
const ID_CANAL = 'UCZDsqSxJMnEsPg8Jm4FH8dQ';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/search';

class Api{
  Future<List<Video>>pesquisar(String pesquisa) async{
    http.Response resposta = await http.get(
        Uri.parse(
            URL_BASE+
            "?part=snippet"
            "&type=video"
            "&maxResults=15"
            "&order=date"
            "&channelId=$ID_CANAL"
            "&key=$CHAVE_API"
            "&q=$pesquisa"
        ));
    if(resposta.statusCode == 200){
      //print("Resultado= ${resposta.body}");
      Map<String, dynamic> dadosJson = json.decode(resposta.body);
      //print(dadosJson["items"][0]["snippet"]["title"]);
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJson(map);
          }
      ).toList();
      return videos;
    }
    return List.empty();
  }
}