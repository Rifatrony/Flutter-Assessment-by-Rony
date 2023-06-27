// To parse this JSON data, do
//
//     final movieDetailsModel = movieDetailsModelFromJson(jsonString);

import 'dart:convert';

MovieDetailsModel movieDetailsModelFromJson(String str) => MovieDetailsModel.fromJson(json.decode(str));

String movieDetailsModelToJson(MovieDetailsModel data) => json.encode(data.toJson());

class MovieDetailsModel {
    TvShow? tvShow;

    MovieDetailsModel({
        this.tvShow,
    });

    factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
        tvShow: json["tvShow"] == null ? null : TvShow.fromJson(json["tvShow"]),
    );

    Map<String, dynamic> toJson() => {
        "tvShow": tvShow?.toJson(),
    };
}

class TvShow {
    int? id;
    String? name;
    String? permalink;
    String? url;
    String? description;
    String? descriptionSource;
    DateTime? startDate;
    dynamic endDate;
    String? country;
    String? status;
    int? runtime;
    String? network;
    dynamic youtubeLink;
    String? imagePath;
    String? imageThumbnailPath;
    String? rating;
    String? ratingCount;
    dynamic countdown;
    List<String>? genres;
    List<String>? pictures;
    List<Episode>? episodes;

    TvShow({
        this.id,
        this.name,
        this.permalink,
        this.url,
        this.description,
        this.descriptionSource,
        this.startDate,
        this.endDate,
        this.country,
        this.status,
        this.runtime,
        this.network,
        this.youtubeLink,
        this.imagePath,
        this.imageThumbnailPath,
        this.rating,
        this.ratingCount,
        this.countdown,
        this.genres,
        this.pictures,
        this.episodes,
    });

    factory TvShow.fromJson(Map<String, dynamic> json) => TvShow(
        id: json["id"],
        name: json["name"],
        permalink: json["permalink"],
        url: json["url"],
        description: json["description"],
        descriptionSource: json["description_source"],
        startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
        endDate: json["end_date"],
        country: json["country"],
        status: json["status"],
        runtime: json["runtime"],
        network: json["network"],
        youtubeLink: json["youtube_link"],
        imagePath: json["image_path"],
        imageThumbnailPath: json["image_thumbnail_path"],
        rating: json["rating"],
        ratingCount: json["rating_count"],
        countdown: json["countdown"],
        genres: json["genres"] == null ? [] : List<String>.from(json["genres"]!.map((x) => x)),
        pictures: json["pictures"] == null ? [] : List<String>.from(json["pictures"]!.map((x) => x)),
        episodes: json["episodes"] == null ? [] : List<Episode>.from(json["episodes"]!.map((x) => Episode.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "permalink": permalink,
        "url": url,
        "description": description,
        "description_source": descriptionSource,
        "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date": endDate,
        "country": country,
        "status": status,
        "runtime": runtime,
        "network": network,
        "youtube_link": youtubeLink,
        "image_path": imagePath,
        "image_thumbnail_path": imageThumbnailPath,
        "rating": rating,
        "rating_count": ratingCount,
        "countdown": countdown,
        "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "pictures": pictures == null ? [] : List<dynamic>.from(pictures!.map((x) => x)),
        "episodes": episodes == null ? [] : List<dynamic>.from(episodes!.map((x) => x.toJson())),
    };
}

class Episode {
    int? season;
    int? episode;
    String? name;
    DateTime? airDate;

    Episode({
        this.season,
        this.episode,
        this.name,
        this.airDate,
    });

    factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        season: json["season"],
        episode: json["episode"],
        name: json["name"],
        airDate: json["air_date"] == null ? null : DateTime.parse(json["air_date"]),
    );

    Map<String, dynamic> toJson() => {
        "season": season,
        "episode": episode,
        "name": name,
        "air_date": airDate?.toIso8601String(),
    };
}
