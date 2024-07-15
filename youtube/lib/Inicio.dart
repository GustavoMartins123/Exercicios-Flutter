import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/Video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  Future<List<Video>> buscar(String pesquisa) async{
    Api api = Api();
    return await api.pesquisar(pesquisa);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buscar("MILHO"),
        builder: (context, snapshot){
         switch(snapshot.connectionState){
           case ConnectionState.none:
             break;
           case ConnectionState.active:
             break;
           case ConnectionState.waiting:
             return Center(
               child: CircularProgressIndicator()
             );
           case ConnectionState.done:
             if(snapshot.hasData){
               return ListView.separated(
                   itemBuilder: (context, index){
                     List<Video>? videos = snapshot.data;
                     Video video = videos![index];
                     return YoutubePlayerBuilder(
                         player: YoutubePlayer(
                           controller: YoutubePlayerController(
                             initialVideoId: video.id,
                             flags: YoutubePlayerFlags(
                               autoPlay: false
                             )
                           ),
                           showVideoProgressIndicator: true,
                           progressIndicatorColor: Colors.red
                         ),
                         builder: (context, player){
                           return Column(
                             children: [
                               player,
                               ListTile(
                                 title: Text(video.titulo),
                                 subtitle: Text(video.descricao)
                               )
                             ],
                           );
                         });
                   },
                   separatorBuilder: (context, index) => Divider(
                     height: 2,
                     color: Colors.grey,
                   ),
                   itemCount: snapshot.data!.length
               );
             }
             else{
               return Center(
                 child: Text("Nenhum vídeo encontrado"),
               );
             }
         }
         return Center(
           child: Text("Indisponível"),
         );
        });
  }
}
