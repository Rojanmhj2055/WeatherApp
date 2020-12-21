class Geocode {
  String documentation;
  List<Features> features;
  List<Licenses> licenses;
  Rate rate;
  Status status;
  StayInformed stayInformed;
  String thanks;
  Timestamp timestamp;
  int totalResults;
  String type;

  Geocode(
      {this.documentation,
      this.features,
      this.licenses,
      this.rate,
      this.status,
      this.stayInformed,
      this.thanks,
      this.timestamp,
      this.totalResults,
      this.type});

  Geocode.fromJson(Map<String, dynamic> json) {
    documentation = json['documentation'];
    if (json['features'] != null) {
      features = new List<Features>();
      json['features'].forEach((v) {
        features.add(new Features.fromJson(v));
      });
    }
    if (json['licenses'] != null) {
      licenses = new List<Licenses>();
      json['licenses'].forEach((v) {
        licenses.add(new Licenses.fromJson(v));
      });
    }
    rate = json['rate'] != null ? new Rate.fromJson(json['rate']) : null;
    status =
        json['status'] != null ? new Status.fromJson(json['status']) : null;
    stayInformed = json['stay_informed'] != null
        ? new StayInformed.fromJson(json['stay_informed'])
        : null;
    thanks = json['thanks'];
    timestamp = json['timestamp'] != null
        ? new Timestamp.fromJson(json['timestamp'])
        : null;
    totalResults = json['total_results'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['documentation'] = this.documentation;
    if (this.features != null) {
      data['features'] = this.features.map((v) => v.toJson()).toList();
    }
    if (this.licenses != null) {
      data['licenses'] = this.licenses.map((v) => v.toJson()).toList();
    }
    if (this.rate != null) {
      data['rate'] = this.rate.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    if (this.stayInformed != null) {
      data['stay_informed'] = this.stayInformed.toJson();
    }
    data['thanks'] = this.thanks;
    if (this.timestamp != null) {
      data['timestamp'] = this.timestamp.toJson();
    }
    data['total_results'] = this.totalResults;
    data['type'] = this.type;
    return data;
  }
}

class Features {
  Geometry geometry;
  Properties properties;
  String type;

  Features({this.geometry, this.properties, this.type});

  Features.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geometry != null) {
      data['geometry'] = this.geometry.toJson();
    }
    if (this.properties != null) {
      data['properties'] = this.properties.toJson();
    }
    data['type'] = this.type;
    return data;
  }
}

class 
Geometry {
  List<double> coordinates;
  String type;

  Geometry({this.coordinates, this.type});

  Geometry.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class Properties {
  Bounds bounds;
  Components components;
  int confidence;
  String formatted;

  Properties({this.bounds, this.components, this.confidence, this.formatted});

  Properties.fromJson(Map<String, dynamic> json) {
    bounds =
        json['bounds'] != null ? new Bounds.fromJson(json['bounds']) : null;
    components = json['components'] != null
        ? new Components.fromJson(json['components'])
        : null;
    confidence = json['confidence'];
    formatted = json['formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.bounds != null) {
      data['bounds'] = this.bounds.toJson();
    }
    if (this.components != null) {
      data['components'] = this.components.toJson();
    }
    data['confidence'] = this.confidence;
    data['formatted'] = this.formatted;
    return data;
  }
}

class Bounds {
  Northeast northeast;
  Northeast southwest;

  Bounds({this.northeast, this.southwest});

  Bounds.fromJson(Map<String, dynamic> json) {
    northeast = json['northeast'] != null
        ? new Northeast.fromJson(json['northeast'])
        : null;
    southwest = json['southwest'] != null
        ? new Northeast.fromJson(json['southwest'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.northeast != null) {
      data['northeast'] = this.northeast.toJson();
    }
    if (this.southwest != null) {
      data['southwest'] = this.southwest.toJson();
    }
    return data;
  }
}

class Northeast {
  double lat;
  double lng;

  Northeast({this.lat, this.lng});

  Northeast.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

class Components {
  String iSO31661Alpha2;
  String iSO31661Alpha3;
  String sCategory;
  String sType;
  String attraction;
  String city;
  String continent;
  String country;
  String countryCode;
  String county;
  String neighbourhood;
  String postcode;
  String region;
  String road;
  String suburb;

  Components(
      {this.iSO31661Alpha2,
      this.iSO31661Alpha3,
      this.sCategory,
      this.sType,
      this.attraction,
      this.city,
      this.continent,
      this.country,
      this.countryCode,
      this.county,
      this.neighbourhood,
      this.postcode,
      this.region,
      this.road,
      this.suburb});

  Components.fromJson(Map<String, dynamic> json) {
    iSO31661Alpha2 = json['ISO_3166-1_alpha-2'];
    iSO31661Alpha3 = json['ISO_3166-1_alpha-3'];
    sCategory = json['_category'];
    sType = json['_type'];
    attraction = json['attraction'];
    city = json['city'];
    continent = json['continent'];
    country = json['country'];
    countryCode = json['country_code'];
    county = json['county'];
    neighbourhood = json['neighbourhood'];
    postcode = json['postcode'];
    region = json['region'];
    road = json['road'];
    suburb = json['suburb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ISO_3166-1_alpha-2'] = this.iSO31661Alpha2;
    data['ISO_3166-1_alpha-3'] = this.iSO31661Alpha3;
    data['_category'] = this.sCategory;
    data['_type'] = this.sType;
    data['attraction'] = this.attraction;
    data['city'] = this.city;
    data['continent'] = this.continent;
    data['country'] = this.country;
    data['country_code'] = this.countryCode;
    data['county'] = this.county;
    data['neighbourhood'] = this.neighbourhood;
    data['postcode'] = this.postcode;
    data['region'] = this.region;
    data['road'] = this.road;
    data['suburb'] = this.suburb;
    return data;
  }
}

class Licenses {
  String name;
  String url;

  Licenses({this.name, this.url});

  Licenses.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Rate {
  int limit;
  int remaining;
  int reset;

  Rate({this.limit, this.remaining, this.reset});

  Rate.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    remaining = json['remaining'];
    reset = json['reset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['remaining'] = this.remaining;
    data['reset'] = this.reset;
    return data;
  }
}

class Status {
  int code;
  String message;

  Status({this.code, this.message});

  Status.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class StayInformed {
  String blog;
  String twitter;

  StayInformed({this.blog, this.twitter});

  StayInformed.fromJson(Map<String, dynamic> json) {
    blog = json['blog'];
    twitter = json['twitter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blog'] = this.blog;
    data['twitter'] = this.twitter;
    return data;
  }
}

class Timestamp {
  String createdHttp;
  int createdUnix;

  Timestamp({this.createdHttp, this.createdUnix});

  Timestamp.fromJson(Map<String, dynamic> json) {
    createdHttp = json['created_http'];
    createdUnix = json['created_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_http'] = this.createdHttp;
    data['created_unix'] = this.createdUnix;
    return data;
  }
}







class WeatherForecastModel {
  City city;
  String cod;
  double message;
  int cnt;
  List<Lista> list;

  WeatherForecastModel(
      {this.city, this.cod, this.message, this.cnt, this.list});

  WeatherForecastModel.fromJson(Map<String, dynamic> json) {
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    if (json['list'] != null) {
      list = new List<Lista>();
      json['list'].forEach((v) {
        list.add(new Lista.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['cod'] = this.cod;
    data['message'] = this.message;
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int id;
  String name;
  Coord coord;
  String country;
  int population;
  int timezone;

  City(
      {this.id,
        this.name,
        this.coord,
        this.country,
        this.population,
        this.timezone});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = json['coord'] != null ? new Coord.fromJson(json['coord']) : null;
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.coord != null) {
      data['coord'] = this.coord.toJson();
    }
    data['country'] = this.country;
    data['population'] = this.population;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Coord {
  double lon;
  double lat;

  Coord({this.lon, this.lat});

  Coord.fromJson(Map<String, dynamic> json) {
    lon = json['lon'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lon'] = this.lon;
    data['lat'] = this.lat;
    return data;
  }
}

class Lista {
  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  List<Weather> weather;
  double speed;
  int deg;
  int clouds;
  double snow;
  double rain;

  Lista(
      {this.dt,
        this.sunrise,
        this.sunset,
        this.temp,
        this.feelsLike,
        this.pressure,
        this.humidity,
        this.weather,
        this.speed,
        this.deg,
        this.clouds,
        this.snow,
        this.rain});

  Lista.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    feelsLike = json['feels_like'] != null
        ? new FeelsLike.fromJson(json['feels_like'])
        : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = new List<Weather>();
      json['weather'].forEach((v) {
        weather.add(new Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    clouds = json['clouds'];
    snow = json['snow'];
    rain = json['rain'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    if (this.temp != null) {
      data['temp'] = this.temp.toJson();
    }
    if (this.feelsLike != null) {
      data['feels_like'] = this.feelsLike.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    if (this.weather != null) {
      data['weather'] = this.weather.map((v) => v.toJson()).toList();
    }
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['clouds'] = this.clouds;
    data['snow'] = this.snow;
    data['rain'] = this.rain;
    return data;
  }
}

class Temp {
  double day;
  double min;
  double max;
  double night;
  double eve;
  double morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});
  //need to do otdouble() 
  //otherwise marked as int which is problem
  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    min = json['min'].toDouble();
    max = json['max'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class FeelsLike {
  double day;
  double night;
  double eve;
  double morn;

  FeelsLike({this.day, this.night, this.eve, this.morn});

  FeelsLike.fromJson(Map<String, dynamic> json) {
    day = json['day'].toDouble();
    night = json['night'].toDouble();
    eve = json['eve'].toDouble();
    morn = json['morn'].toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({this.id, this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
