import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'dart:math';
import 'package:provider/provider.dart';

class USstate {
  String stateName;
  String capitalCity;
  List<String> givenCities;
  String image;

  USstate(
      {@required this.stateName,
      @required this.capitalCity,
      @required this.givenCities,
      this.image});
}

class StatesList with ChangeNotifier {
  List<USstate> _states = [
    USstate(
        stateName: "Alabama",
        capitalCity: "Montgomery",
        givenCities: ["Montgomery", "Birmingham", 'Dothan', 'Huntsville'],
        image: ('images/states/alabama_al.png')),
    USstate(
        stateName: "Alaska",
        capitalCity: "Juneau",
        givenCities: ["Juneau", "Anchorage", "Fiarbanks", 'Wasilla'],
        image: ('images/states/alaska_ak.png')),
    USstate(
        stateName: "Arkansas",
        capitalCity: "Little Rock",
        givenCities: [
          "Little Rock",
          "Springdale",
          "Fort Smith",
          'Fayetteville'
        ],
        image: ('images/states/arkansas_ar.png')),
    USstate(
        stateName: "Arizona",
        capitalCity: "Phoenix",
        givenCities: ["Phoenix", "Chandler", "Scottsdale", 'Tempe'],
        image: ('images/states/arizona_az.png')),
    USstate(
        stateName: "California",
        capitalCity: "Sacramento",
        givenCities: ["Sacramento", "Los Angeles", "San Francisco", 'Oakland'],
        image: ('images/states/california_ca.png')),
    USstate(
        stateName: "Colorado",
        capitalCity: "Denver",
        givenCities: ["Denver", "Colorado Springs", "Lakewood", 'Fort Collins'],
        image: ('images/states/colorado_co.png')),
    USstate(
        stateName: "Connecticut",
        capitalCity: "Hartford",
        givenCities: ["Hartford", "Bridgeport", "Stamford", 'New Haven'],
        image: ('images/states/connenticut_ct.png')),
    USstate(
        stateName: "Delaware",
        capitalCity: "Dover",
        givenCities: ["Dover", "Wilmington", "Milford", 'Delaware City'],
        image: ('images/states/delaware_de.png')),
    USstate(
        stateName: "Florida",
        capitalCity: "Tallahassee",
        givenCities: ["Tallahassee", "Jacksonville", "Miami", 'Orlando'],
        image: ('images/states/florida_fl.png')),
    USstate(
        stateName: "Georgia",
        capitalCity: "Atlanta",
        givenCities: ["Atlanta", "Columbus", "Roswell", 'Augusta'],
        image: ('images/states/georgia_ga.png')),
    USstate(
        stateName: "Hawaii",
        capitalCity: "Honolulu",
        givenCities: ["Honolulu", "Perl City", "Kapolei", 'East Honolulu'],
        image: ('images/states/hawaii_hi.png')),
    USstate(
        stateName: "Idaho",
        capitalCity: "Boise",
        givenCities: ["Boise", "Meridian", "Nampa", 'Idaho Falls'],
        image: ('images/states/idaho_id.png')),
    USstate(
        stateName: "Illinois",
        capitalCity: "Springfield",
        givenCities: ["Springfield", "Chicago", "Rockford", 'Aurora'],
        image: ('images/states/illinois_il.png')),
    USstate(
        stateName: "Indiana",
        capitalCity: "Indianapolis",
        givenCities: ["Indianapolis", "Fort Wayne", "Evansville", 'Carmel'],
        image: ('images/states/indiana_in.png')),
    USstate(
        stateName: "Iowa",
        capitalCity: "Des Moines",
        givenCities: ["Des Moines", "Iowa City", "Davenport", 'Cedar Rapids'],
        image: ('images/states/iowa_ia.png')),
    USstate(
        stateName: "Kansas",
        capitalCity: "Topeka",
        givenCities: ["Topeka", "Wichita", "Kansas City", 'Lawrence'],
        image: ('images/states/kansas_ks.png')),
    USstate(
        stateName: "Kentucky",
        capitalCity: "Frankfort",
        givenCities: ["Frankfort", "Louisville", "Lexington", 'Richmond'],
        image: ('images/states/kentukey_ky.png')),
    USstate(
        stateName: "Louisiana",
        capitalCity: "Baton Rouge",
        givenCities: ["Baton Rouge", "New Orleans", "Shreveport", 'Lafayette'],
        image: ('images/states/louisiana_la.png')),
    USstate(
        stateName: "Maryland",
        capitalCity: "Annapolis",
        givenCities: ["Annapolis", "Baltimore", "Rockville", 'Bowie'],
        image: ('images/states/maine_me.png')),
    USstate(
        stateName: "Maine",
        capitalCity: "Augusta",
        givenCities: ["Augusta", "Portland", "Louiston", 'South Portland'],
        image: ('images/states/maryland_md.png')),
    USstate(
        stateName: "Massachusetts",
        capitalCity: "Boston",
        givenCities: ["Boston", "Cambridge", "Springfield", 'Worcester'],
        image: ('images/states/massachusetts_ma.png')),
    USstate(
        stateName: "Michigan",
        capitalCity: "Lansing",
        givenCities: ["Lansing", "Detroit", "Flint", 'Grand Rapids'],
        image: ('images/states/michigan_mi.png')),
    USstate(
        stateName: "Minnesota",
        capitalCity: "Saint Paul",
        givenCities: ["Saint Paul", "Minneapolis", "Rochester", 'Bloomington'],
        image: ('images/states/minnesota_mn.png')),
    USstate(
        stateName: "Mississippi",
        capitalCity: "Jackson",
        givenCities: ["Jackson", "Gulfport", "Greenville", 'Southaven'],
        image: ('images/states/mississippi_ms.png')),
    USstate(
        stateName: "Missouri",
        capitalCity: "Jefferson City",
        givenCities: [
          "Jefferson City",
          "Kansas City",
          "St.Louis",
          'Saint Joseph'
        ],
        image: ('images/states/missouri_mo.png')),
    USstate(
        stateName: "Montana",
        capitalCity: "Helena",
        givenCities: ["Helena", "Billings", "Missoula", 'Great Falls'],
        image: ('images/states/montana_mt.png')),
    USstate(
        stateName: "Nebraska",
        capitalCity: "Lincoln",
        givenCities: ["Lincoln", "Omaha", "Grand Island", 'Bellevue'],
        image: ('images/states/nebraska_ne.png')),
    USstate(
        stateName: "Nevada",
        capitalCity: "Carson City",
        givenCities: ["Carson City", "Las Vegas", "Henderson", 'Reno'],
        image: ('images/states/nevada_nv.png')),
    USstate(
        stateName: "New Hampshire",
        capitalCity: "Concord",
        givenCities: ["Concord", "Manchester", "Dover", 'Nashua'],
        image: ('images/states/new_hampshire.png')),
    USstate(
        stateName: "New Jersey",
        capitalCity: "Trenton",
        givenCities: ["Trenton", "Newark", "Jersey City", 'Paterson'],
        image: ('images/states/new_jersey.png')),
    USstate(
        stateName: "New Mexico",
        capitalCity: "Santa Fe",
        givenCities: ["Santa Fe", "Albuquerque", "Las Cruces", 'Roswell'],
        image: ('images/states/new_mexico.png')),
    USstate(
        stateName: "New York",
        capitalCity: "Albany",
        givenCities: ["Albany", "New York", "Syracuse", 'Buffalo'],
        image: ('images/states/new_york.png')),
    USstate(
        stateName: "North Carolina",
        capitalCity: "Raleigh",
        givenCities: ["Raleigh", "Charlotte", "Wilmington", 'Greensboro'],
        image: ('images/states/north_carolina.png')),
    USstate(
        stateName: "North Dakota",
        capitalCity: "Bismarck",
        givenCities: ["Bismarck", "Fargo", "Minot", 'Grand Forks'],
        image: ('images/states/north_dakota.png')),
    USstate(
        stateName: "Ohio",
        capitalCity: "Columbus",
        givenCities: ["Columbus", "Dayton", "Cleveland", 'Cincinnati'],
        image: ('images/states/ohaio_oh.png')),
    USstate(
        stateName: "Oklahoma",
        capitalCity: "Oklahoma City",
        givenCities: ["Oklahoma City", "Tulsa", "Norman", 'Edmond'],
        image: ('images/states/oklahoma_ok.png')),
    USstate(
        stateName: "Oregon",
        capitalCity: "Salem",
        givenCities: ["Salem", "Portland", "Eugene", 'Corvallis'],
        image: ('images/states/oregon_or.png')),
    USstate(
        stateName: "Pennsylvania",
        capitalCity: "Harrisburg",
        givenCities: ["Harrisburg", "Philadelphia", "Pittsburgh", 'Allentown'],
        image: ('images/states/pennsylvania_pa.png')),
    USstate(
        stateName: "Rhode Island",
        capitalCity: "Providence",
        givenCities: ["Providence", "Cranston", "Warwick", 'Newport'],
        image: ('images/states/rhode_island.png')),
    USstate(
        stateName: "South Carolina",
        capitalCity: "Columbia",
        givenCities: ["Columbia", "Charleston", "Rock Hill", 'Greenville'],
        image: ('images/states/south_carolina.png')),
    USstate(
        stateName: "South Dakota",
        capitalCity: "Pierre",
        givenCities: ["Pierre", "Sioux Falls", "Rapid City", 'Brookings'],
        image: ('images/states/south_dakota.png')),
    USstate(
        stateName: "Tennessee",
        capitalCity: "Nashville",
        givenCities: ["Nashville", "Memphis", "Knoxville", 'Clarksville'],
        image: ('images/states/tennessee_tn.png')),
    USstate(
        stateName: "Texas",
        capitalCity: "Austin",
        givenCities: ["Austin", "Houston", "Dallas", 'San Antonio'],
        image: ('images/states/texas_tx.png')),
    USstate(
        stateName: "Utah",
        capitalCity: "Salt Lake City",
        givenCities: [
          "Salt Lake City",
          "West Jordan",
          "West Walley City",
          'Provo'
        ],
        image: ('images/states/utah_ut.png')),
    USstate(
        stateName: "Vermont",
        capitalCity: "Montpelier",
        givenCities: [
          "Montpelier",
          "Burlington",
          "Ruttland",
          'South Burlington'
        ],
        image: ('images/states/vermont_vt.png')),
    USstate(
        stateName: "Virginia",
        capitalCity: "Richmond",
        givenCities: ["Richmond", "Virginia Beach", "Norfolk", 'Alexandria'],
        image: ('images/states/virginia_va.png')),
    USstate(
        stateName: "Washington",
        capitalCity: "Olympia",
        givenCities: ["Olympia", 'Seattle', "Vancouver", 'Tacoma'],
        image: ('images/states/washington_wa.png')),
    USstate(
        stateName: "West Virginia",
        capitalCity: "Charleston",
        givenCities: ["Charleston", "Huntington", "Fairmont", 'Morgantown'],
        image: ('images/states/west_virginia.png')),
    USstate(
        stateName: "Wisconsin",
        capitalCity: "Madison",
        givenCities: ["Madison", "Milwaukee", "GreenBay", 'Kenosha'],
        image: ('images/states/wisconsin_wi.png')),
    USstate(
        stateName: "Wyoming",
        capitalCity: "Cheyenne",
        givenCities: ["Cheyenne", "Rock Springs", "Sheridan", 'Gillette'],
        image: ('images/states/wyoming_wy.png')),
  ];

  void shuffle(int randNum) {
    _states[randNum].givenCities.shuffle();
  }

  List<USstate> get states {
    _states.shuffle();
    return [..._states];
  }

  List<USstate> get unShuffledStates {
    return [..._states];
  }
}
