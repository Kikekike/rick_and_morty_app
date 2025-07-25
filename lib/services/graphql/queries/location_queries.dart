class LocationQueries {
  static const String fetchByName = r'''
    query($name: String, $page: Int) {
      locations(page: $page, filter: { name: $name }) {
        info {
          next
        }
        results {
          id
          name
          type
          dimension
          residents {
            id
          }
        }
      }
    }
  ''';
}
