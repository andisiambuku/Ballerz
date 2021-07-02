
import 'dart:convert';

BasketballPlayers nbaPlayersFromJson(String str) =>
    BasketballPlayers.fromJson(json.decode(str));

String nbaPlayersToJson(BasketballPlayers data) => json.encode(data.toJson());

class BasketballPlayers {
  BasketballPlayers({
    required this.data,
  });

  List<Datum> data;

  factory BasketballPlayers.fromJson(Map<String, dynamic> json) => BasketballPlayers(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
    Datum({
       required this.id,
       required this.firstName,
       required this.lastName,
       required this.position,
       required this.heightFeet,
       required this.heightInches,
       required this.weightPounds,
       required this.team,
    });

    int id;
    String firstName;
    String lastName;
    String position;
    int heightFeet;
    int heightInches;
    int weightPounds;
    Team team;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        position: json["position"],
        heightFeet: json["height_feet"],
        heightInches: json["height_inches"],
        weightPounds: json["weight_pounds"],
        team: Team.fromJson(json["team"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "position": position,
        "height_feet": heightFeet,
        "height_inches": heightInches,
        "weight_pounds": weightPounds,
        "team": team.toJson(),
    };
}

class Team {
  Team({
   required this.id,
   required this.abbreviation,
   required this.city,
   required this.conference,
   required this.division,
   required this.fullName,
   required this.name,
  });

  int id;
  String abbreviation;
  String city;
  String conference;
  String division;
  String fullName;
  String name;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        abbreviation: json["abbreviation"],
        city: json["city"],
        conference: json["conference"],
        division: json["division"],
        fullName: json["full_name"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "city": city,
        "conference": conference,
        "division": division,
        "full_name": fullName,
        "name": name,
      };
}

