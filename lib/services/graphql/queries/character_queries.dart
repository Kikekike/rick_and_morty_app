class CharacterQueries {
  static const String fetchByIds = r''' 
    query GetCharacters($ids: [ID!]!) {
      charactersByIds(ids: $ids) {
        id
        name
        image
        species
        status
        gender
        origin {
          name
        }
        location {
          name
        }
      }
    }
  ''';
}
