import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class Client{

  Future<ValueNotifier<GraphQLClient>> graphQlclient()async{
    final HttpLink httpLink= HttpLink("https://bab5-197-250-63-163.ngrok-free.app/graphql");

    FetchPolicy fetchPolicy =FetchPolicy.networkOnly;
    final policies =Policies(fetch:fetchPolicy);

   final ValueNotifier <GraphQLClient> client= ValueNotifier (GraphQLClient(
      link: httpLink, 
      defaultPolicies: DefaultPolicies(watchQuery: policies,mutate: policies,query: policies),
      cache: GraphQLCache()));
      return client;
  }
  
}