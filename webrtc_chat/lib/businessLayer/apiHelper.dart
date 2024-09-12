import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:webrtc_chat/businessLayer/global.dart' as global;

class DatabaseUtils {
  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),

      link: AuthLink(
        getToken: () async {
          if (global.currentUserData.checkotpNew == null ||
              global.currentUserData.checkotpNew!.accessToken == null) {
            return "";
          } 
          else {
            print(global.currentUserData.checkotpNew!.accessToken);
            return "Bearer \n${global.currentUserData.checkotpNew!.accessToken}";
          }
        }
      ).concat(HttpLink(
        global.baseUrl, 
        defaultHeaders: {
          'Authorization': "Bearer \n${global.currentUserData.checkotpNew == null || global.currentUserData.checkotpNew!.accessToken == null ? "" : global.currentUserData.checkotpNew!.accessToken}",        
        }
      ))
    ),
  );
  
  GraphQLClient clientSend = GraphQLClient(
    cache: GraphQLCache(),

    link: AuthLink(
      getToken: () async {       
        // ignore: unnecessary_null_comparison
        if (global.currentUserData == null ||
            global.currentUserData.checkotpNew == null ||
            global.currentUserData.checkotpNew!.accessToken == null) {
          return "";
        } 
        else {
          print(global.currentUserData.checkotpNew!.accessToken);
          return "Bearer ${global.currentUserData.checkotpNew!.accessToken}";
        }
      }
    ).concat(HttpLink(
      global.baseUrl, 
      defaultHeaders: {
        'Authorization': "Bearer ${global.currentUserData.checkotpNew == null || global.currentUserData.checkotpNew!.accessToken == null ? "" : global.currentUserData.checkotpNew!.accessToken}",
      },
    ))
  );
}
