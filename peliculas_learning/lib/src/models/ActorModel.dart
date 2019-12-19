import 'package:flutter/material.dart';

class Cast
{
  List<Actor> actors = new List<Actor>();

  Cast();


  //Estos métodos funcionan para llamados estáticos (?)
  Cast.fromJsonList( List<dynamic> jsonResponse )
  {
    if (jsonResponse == null)
    {
      return;
    }
    else
    {
      for (var actor in jsonResponse) {
        actor = new Actor.fromJsonMap(actor);
        actors.add(actor);
      }
    }
  }
}



class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.fromJsonMap(Map<String, dynamic> jsonResponse)
  {
    castId      = jsonResponse["cast_id"];
    character   = jsonResponse["character"];
    creditId    = jsonResponse["credit_id"];
    gender      = jsonResponse["gender"];
    id          = jsonResponse["id"];
    name        = jsonResponse["name"];
    order       = jsonResponse["order"];
    profilePath = jsonResponse["profile_path"];
  }

  NetworkImage getPhoto()
  {
    String url;
    String defaultUrlImage = "https://image.tmdb.org/t/p/w500";

    if ( profilePath == null)
    {
      url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdA750p7y_ICrWtWyaE7Ziyj5wKIqO-eimw6J930z8cQfBo8zr&s";
    }
    else
    {
      url = defaultUrlImage+profilePath;
    }

    return NetworkImage(url);
    
  }
}


