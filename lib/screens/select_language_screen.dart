import 'package:flipkart_clone/main.dart';
import 'package:flipkart_clone/providers/Language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flipkart_clone/widgets/language_item.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/language_model.dart';

class SelectLanguageScreen extends StatefulWidget {
  SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {

  Future<void> _selectLanguage(BuildContext ctx , String title) async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('chooseLanguage', isViewed);
    await prefs.setString('Language', title);
    print('$title saved as default language !!!');
    Navigator.of(ctx).pushReplacementNamed(MyHomeClass.routeName);
  }

  bool isSelected = false;

  String langTitle = '';

  void _isSelectedLanguage(String title) {
    langTitle = title ;
    setState(() {
      isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<LanguageModel> langList = Provider.of<LanguageProvider>(context).languageList ;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose language'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height - 70,
                child: ListView.builder(
                    itemCount: langList.length,
                    itemBuilder: (ctx, index) => LanguageItem(
                          index: index,
                          title: langList[index].title,
                          subtitle: langList[index].subtitle,
                          isSelected: _isSelectedLanguage,
                        )),
              ),
            ),
          ),
          // const SizedBox(height: 15,),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(width: 1, color: Colors.grey.shade400))),
            padding: EdgeInsets.all(8),
            height: 66,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                _selectLanguage(context , langTitle);
              },
              child: Text('CONTINUE'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected
                      ? Theme.of(context).primaryColor
                      : Colors.grey.shade400),
            ),
          )
        ],
      ),
    );
  }
}
