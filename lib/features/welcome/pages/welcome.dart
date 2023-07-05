import 'package:atividade_pratica/core/presentation/components/brand/brand_image.dart';
import 'package:atividade_pratica/core/presentation/components/brand/brand_title.dart';
import 'package:atividade_pratica/core/presentation/components/buttons/default_text_button.dart';
import 'package:atividade_pratica/core/presentation/components/checkbox/checkbox.dart';
import 'package:atividade_pratica/features/produtos/pages/crud.dart';
import 'package:atividade_pratica/features/welcome/data/datasources/welcome_datasource.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatelessWidget {
  bool _checkedBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
    SafeArea(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BrandTitleWidget(),
          BrandImageWidget(width: MediaQuery.of(context).size.width * 0.7, height: MediaQuery.of(context).size.height * 0.7,),
          _buildWelcomeText(), 
          _buildBottomRow(context),
        ],
      ),
    ),);
  }

  _buildWelcomeText(){
    return Text('Seja Bem-Vindo(a) ao PeF Delivery', textAlign: TextAlign.center, style: TextStyle(fontSize: 18));
  }

  _buildBottomRow(BuildContext context){
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      CheckBoxWidget(onChanged: (value) { 
        _checkedBoxValue = value;
       },),
      DefaultTextButton(text: 'Avançar', textFontSize: 24, 
      onPressed: () async {
        var sp = await SharedPreferences.getInstance();
        var ds = WelcomeDataSource(sharedPreferences: sp);
        
        await ds.registerDontShowAgain(value: _checkedBoxValue);

        Navigator.pushReplacement(context, 
          MaterialPageRoute(builder: (context) => ProdutoCRUDPage())
      );
      }, 
      )
      ],
    );
  }

}