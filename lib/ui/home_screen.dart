import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/view_model/movie_view_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Provider Example Apps'),
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: ChangeNotifierProvider(
            create: (_) => MovieViewModel(),
            child: Consumer<MovieViewModel>(
              builder: (context, model, child) => model.onLoading == true
                  ?

                  ///check if data is lodaing
                  const Center(
                      child: CircularProgressIndicator(),
                    )
                  : model.movies.search == null || model.movies.search!.isEmpty
                      ?

                      ///if object is null or data is empty display button
                      Center(
                          child: TextButton(
                            onPressed: () async {
                              await model.getMovie();
                            },
                            child: const Text('Fetch movie'),
                          ),
                        )
                      :

                      ///if data is exist display length of data
                      Center(
                          child: Text(
                              'length of movies data : ${model.movies.search!.length}'),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
