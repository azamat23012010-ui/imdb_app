
class MovieModel {
    String id;
    String url;
    String primaryTitle;
    String originalTitle;
    String type;
    String description;
    String primaryImage;
    List<Thumbnail> thumbnails;
    String? trailer;
    String? contentRating;
    int startYear;
    dynamic endYear;
    DateTime? releaseDate;
    List<String> interests;
    List<String> countriesOfOrigin;
    List<String> externalLinks;
    List<String> spokenLanguages;
    List<String> filmingLocations;
    List<ProductionCompany> productionCompanies;
    int? budget;
    int? grossWorldwide;
    List<String> genres;
    bool isAdult;
    int runtimeMinutes;
    double averageRating;
    int numVotes;
    int? metascore;

    MovieModel({
        required this.id,
        required this.url,
        required this.primaryTitle,
        required this.originalTitle,
        required this.type,
        required this.description,
        required this.primaryImage,
        required this.thumbnails,
        required this.trailer,
        required this.contentRating,
        required this.startYear,
        required this.endYear,
        required this.releaseDate,
        required this.interests,
        required this.countriesOfOrigin,
        required this.externalLinks,
        required this.spokenLanguages,
        required this.filmingLocations,
        required this.productionCompanies,
        required this.budget,
        required this.grossWorldwide,
        required this.genres,
        required this.isAdult,
        required this.runtimeMinutes,
        required this.averageRating,
        required this.numVotes,
        required this.metascore,
    });

    factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        url: json["url"],
        primaryTitle: json["primaryTitle"],
        originalTitle: json["originalTitle"],
        type: json["type"],
        description: json["description"],
        primaryImage: json["primaryImage"],
        thumbnails: List<Thumbnail>.from(json["thumbnails"].map((x) => Thumbnail.fromJson(x))),
        trailer: json["trailer"],
        contentRating: json["contentRating"],
        startYear: json["startYear"],
        endYear: json["endYear"],
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
        interests: List<String>.from(json["interests"].map((x) => x)),
        countriesOfOrigin: List<String>.from(json["countriesOfOrigin"].map((x) => x)),
        externalLinks: List<String>.from(json["externalLinks"].map((x) => x)),
        spokenLanguages: List<String>.from(json["spokenLanguages"].map((x) => x)),
        filmingLocations: List<String>.from(json["filmingLocations"].map((x) => x)),
        productionCompanies: List<ProductionCompany>.from(json["productionCompanies"].map((x) => ProductionCompany.fromJson(x))),
        budget: json["budget"],
        grossWorldwide: json["grossWorldwide"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        isAdult: json["isAdult"],
        runtimeMinutes: json["runtimeMinutes"],
        averageRating: json["averageRating"]?.toDouble(),
        numVotes: json["numVotes"],
        metascore: json["metascore"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "primaryTitle": primaryTitle,
        "originalTitle": originalTitle,
        "type": type,
        "description": description,
        "primaryImage": primaryImage,
        "thumbnails": List<dynamic>.from(thumbnails.map((x) => x.toJson())),
        "trailer": trailer,
        "contentRating": contentRating,
        "startYear": startYear,
        "endYear": endYear,
        "releaseDate": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "interests": List<dynamic>.from(interests.map((x) => x)),
        "countriesOfOrigin": List<dynamic>.from(countriesOfOrigin.map((x) => x)),
        "externalLinks": List<dynamic>.from(externalLinks.map((x) => x)),
        "spokenLanguages": List<dynamic>.from(spokenLanguages.map((x) => x)),
        "filmingLocations": List<dynamic>.from(filmingLocations.map((x) => x)),
        "productionCompanies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "budget": budget,
        "grossWorldwide": grossWorldwide,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "isAdult": isAdult,
        "runtimeMinutes": runtimeMinutes,
        "averageRating": averageRating,
        "numVotes": numVotes,
        "metascore": metascore,
    };
}

class ProductionCompany {
    String id;
    String name;

    ProductionCompany({
        required this.id,
        required this.name,
    });

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class Thumbnail {
    String url;
    int width;
    int height;

    Thumbnail({
        required this.url,
        required this.width,
        required this.height,
    });

    factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        url: json["url"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "width": width,
        "height": height,
    };
}
