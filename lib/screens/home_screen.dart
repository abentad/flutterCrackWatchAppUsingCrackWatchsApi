import 'package:crackwatchapp/providers/games_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DateFormat formatter = DateFormat('yMMMEd');

  @override
  Widget build(BuildContext context) {
    GamesProvider _provider = Provider.of<GamesProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: _provider.games.length == 0
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _provider.games.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(2, 8),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Row(
                      children: [
                        Image(
                          image:
                              NetworkImage(_provider.games[index].imagePoster),
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _provider.games[index].title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                overflow: TextOverflow.fade,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                "RD: ${formatter.format(DateTime.parse(_provider.games[index].releaseDate))}",
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                  "CD: ${formatter.format(DateTime.parse(_provider.games[index].crackDate))}"),
                              SizedBox(height: 10.0),
                              Text(
                                  "Protection: ${_provider.games[index].protections[0]}"),
                              SizedBox(height: 10.0),
                              Text(
                                  "Groups: ${_provider.games[index].groups[0]}"),
                              SizedBox(height: 10.0),
                              Text(
                                  "FC: ${_provider.games[index].followersCount.toString()}"),
                              SizedBox(height: 10.0),
                              Text(
                                  "CC: ${_provider.games[index].commentsCount.toString()}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
