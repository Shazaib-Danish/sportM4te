import 'package:flutter/material.dart';
import 'package:sportm4te/Models/google_search_auto.dart';

class AddressSearch extends SearchDelegate<Suggestion> {
  AddressSearch(final sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  late PlaceApiProvider apiClient;

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        tooltip: 'Clear',
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: query == ""
          ? null
          : apiClient.fetchSuggestions(
              query, Localizations.localeOf(context).languageCode),
      builder: (context, snapshot) => query == ''
          ? Container(
              padding: const EdgeInsets.all(16.0),
              child: const Text('Enter your address'),
            )
          : snapshot.hasData
              ? ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) => Container(
                        child: Text((snapshot.data as Suggestion).description),
                      ))
              : Container(child: const Text('Loading...')),
    );
  }
}
