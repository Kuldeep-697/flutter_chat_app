class MyQueries {
  String get getContinents {
    return """
      query {
        countries {
          code 
          name
          emoji
          phone
          capital
          awsRegion
          currencies
          emojiU
          __typename
          states {
            code
            name
          }
          languages {
            code
            name
            native
            rtl
          }
          
        }
      }
    """;
  }
}
