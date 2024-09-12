import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_project/queries.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const APP(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class APP extends StatefulWidget {
  const APP({super.key});

  @override
  State<APP> createState() => _APPState();
}

class _APPState extends State<APP> {
  List<dynamic> countries = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GraphQL'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              final country = countries[index];
              return InkWell(
                onTap: () {
                  print(countries.length);
                },
                child: ListTile(
                  title: Text(country['name']),
                  subtitle: Text(country['code']),
                  trailing: Text(country['emoji']),
                ),
              );
            },
          )

    );
  }

  void fetchData() async {
    final HttpLink link = HttpLink("https://countries.trevorblades.com");

    final GraphQLClient client = GraphQLClient(
        link: link,
        cache: GraphQLCache(),
    );

    final QueryResult result = await client.query(
      QueryOptions(
        document: gql(MyQueries().getContinents),
      )
    );

    if (result.hasException) {
      print(result.exception.toString());
    } 
    else {
      setState(() {
        countries = result.data!['countries'];
        _isLoading = false;
      });
    }
  }
}
