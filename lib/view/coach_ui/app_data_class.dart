class City {
  final String name;
  final String country;

  City({required this.name, required this.country});
}

class AppData {
  static final List<City> _cities = [
    City(name: 'New York', country: 'USA'),
    City(name: 'Los Angeles', country: 'USA'),
    City(name: 'Chicago', country: 'USA'),
    City(name: 'Houston', country: 'USA'),
    City(name: 'Phoenix', country: 'USA'),
    City(name: 'Philadelphia', country: 'USA'),
    City(name: 'San Antonio', country: 'USA'),
    City(name: 'San Diego', country: 'USA'),
    City(name: 'Dallas', country: 'USA'),
    City(name: 'San Jose', country: 'USA'),
  ];

  static List<City> find(String query) {
    if (query.isEmpty) {
      return [];
    }

    return _cities
        .where((city) =>
    city.name.toLowerCase().contains(query.toLowerCase()) ||
        city.country.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}