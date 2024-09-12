import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:webrtc_chat/businessLayer/queries.dart';

class QueriesDocumentProvider extends InheritedWidget {
  const QueriesDocumentProvider({Key? key, this.queries, required Widget child})
      : super(key: key, child: child);

  final NovamaxAPIs? queries;

  static NovamaxAPIs? of(BuildContext context) {
    final InheritedElement element = context
        .getElementForInheritedWidgetOfExactType<QueriesDocumentProvider>()!;
    assert(element != null, 'No MusicMateQueries found in context');
    return (element.widget as QueriesDocumentProvider).queries;
  }

  @override
  bool updateShouldNotify(QueriesDocumentProvider oldWidget) =>
      queries != oldWidget.queries;
}

extension BuildContextExtension on BuildContext {
  NovamaxAPIs? get queries => QueriesDocumentProvider.of(this);

  GraphQLClient get graphQlClient => GraphQLProvider.of(this).value;

  setHeader() {
    return true;
  }

  void cacheGoogleId(String googleId) {
    graphQlClient.cache.writeNormalized('AppData', {'googleId': googleId});
  }

  String? get retrieveGoogleId =>
      graphQlClient.cache.store.get('AppData')!['googleId'];
}
