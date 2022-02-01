
import 'package:flutter/material.dart';
import 'package:workport/Search/place_service.dart';

class Search extends SearchDelegate<Suggestion>{

  final sessionToken;
  PlaceApiProvider? apiClient;

  Search(this.sessionToken) {
    apiClient = PlaceApiProvider(sessionToken);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back), onPressed: () {
      close(context,null!);
    },
    );  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null!;}

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return FutureBuilder(
      future: query == ""
          ? null
          : apiClient!.fetchSuggestions(
          query, Localizations.localeOf(context).languageCode),
      builder: (context, AsyncSnapshot snapshot) => query == ''
          ? Container(
        padding: EdgeInsets.all(16.0),
        child: Text('Enter your address'),
      )
          : snapshot.hasData
          ? ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title:
          Text((snapshot.data[index] as Suggestion).description),
          onTap: () {
            close(context, snapshot.data[index] as Suggestion);
          },
        ),
        itemCount: snapshot.data.length,
      )
          : Container(child: Text('Loading...')),
    );
  }
  
}