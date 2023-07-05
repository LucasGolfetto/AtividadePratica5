import 'package:atividade_pratica/features/produtos/crud.dart';
import 'package:atividade_pratica/features/welcome/pages/welcome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/welcome/data/datasources/welcome_datasource.dart';

void main() {
  runApp(AtividadePratica());
}

class AtividadePratica extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PeF Delivery',
      theme: ThemeData(
        primaryColor: Colors.indigo.shade900,
      ),

      home: FutureBuilder(
        future: _buildHome(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
         if(snapshot.connectionState == ConnectionState.done) {
          return snapshot.data;
         }

         return Container();
        }
      ),
    );
  }
 

  Future<Widget>_buildHome() async {
    var sp = await SharedPreferences.getInstance();
    var ds = WelcomeDataSource(sharedPreferences: sp);

    if (ds.getDontShowAgain()){
      return ProdutoCRUDPage();
    }
    
    return WelcomePage();
  }
}
