import 'package:ferry/ferry.dart';
import 'package:ferry_flutter/ferry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:rxdart/rxdart.dart';
import 'graphql/jobs.data.gql.dart';
import 'graphql/jobs.req.gql.dart';

class CounterBloc {
  BehaviorSubject<int> data;
  CounterBloc(){
    data = BehaviorSubject.seeded(0);
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final cache = Cache();
  final link = HttpLink("https://api.graphql.jobs");
  final client = Client(
    link: link,
    cache: cache,
  );
  GetIt.I.registerSingleton<CounterBloc>(CounterBloc());
  GetIt.I.registerSingleton<Client>(client);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Example(),
    );
  }
}

class Example extends StatelessWidget {
  final Client _client = GetIt.I<Client>();
  final CounterBloc _counterBloc = GetIt.I<CounterBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var newValue = _counterBloc.data.value + 1;
          _counterBloc.data.add(newValue);
        },
      ),
      body: StreamBuilder<int>(
        stream: _counterBloc.data,
        builder: (context, snapshot) {
          print(snapshot.data); //Note that this value does change
          return Query(
            client: _client,
            queryRequest: AllJobs(),
            builder: (BuildContext context, QueryResponse<$AllJobs> response) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text("Current counter value ${snapshot?.data}"), //but widget does not re render this value even though query does change
                      response.loading
                          ? Text("loading")
                          : Text("current query response ${response.data.data}")
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
