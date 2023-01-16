import 'package:flipkart_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:flipkart_clone/widgets/language_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  Future<void> _selectLanguage(BuildContext ctx) async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('chooseLanguage', isViewed);
    Navigator.of(ctx).pushReplacementNamed(MyHomeClass.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose language'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 6,),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 70,
                child: ListView.builder(
                    itemCount: 15, itemBuilder: (ctx, index) => LanguageItem(index: index,)),
              ),
            ),
          ),
          // const SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 1 , color: Colors.grey.shade400)
              )
            ),
            padding: EdgeInsets.all(8),
            height: 66,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: (){
                  _selectLanguage(context);
                },
                child: Text('CONTINUE')),
          )
        ],
      ),
    );
  }
}
