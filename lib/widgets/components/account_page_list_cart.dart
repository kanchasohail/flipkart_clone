import 'package:flipkart_clone/screens/enter_otp_screen.dart';
import 'package:flutter/material.dart';

class AccountPageListCard extends StatelessWidget {
   AccountPageListCard({Key? key}) : super(key: key);


   final List<Map<String, dynamic>> accountSettingsList = [
     {
       'icon' : Icons.language ,
       'title' : 'Select Language'
     },
     {
       'icon' : Icons.edit_notifications ,
       'title' : 'Notification Settings'
     },
     {
       'icon' : Icons.headset_mic ,
       'title' : 'Help Center'
     }

   ];

   final List<Map<String, dynamic>> earnWithFlipkart = [
     {
       'icon' : Icons.storefront ,
       'title' : 'Sell on Flipkart'
     },
   ];

   final List<Map<String, dynamic>> feedback = [
     {
       'icon' : Icons.feedback ,
       'title' : 'Terms, Policies and Licenses'
     },
     {
       'icon' : Icons.help_outline_sharp ,
       'title' : 'Browse FAQs'
     },

   ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Account Settings' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold)),
              ),
              ...accountSettingsList.map((item) => _row(item['icon'], item['title'])).toList(),
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Earn with Flipkart', style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold)),
              ),
              ...earnWithFlipkart.map((item) => _row(item['icon'], item['title'])).toList(),
            ],
          ),
        ),
        Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Feedback & Information' , style: TextStyle(fontSize: 16 , fontWeight: FontWeight.bold),),
              ),
              ...feedback.map((item) => GestureDetector(
                onTap: (){
                  // Navigator.of(context).pushNamed(EnterOtpScreen.routeName , arguments: '7488541900');
                },
                  child: _row(item['icon'], item['title']))).toList(),
            ],
          ),
        ),
      ],
    );
  }
}

class _row extends StatelessWidget{
  final IconData icon ;
  final String title ;
  _row(this.icon , this.title);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon , color: Colors.blue.shade700,),
        ),
        Expanded(child: Text(title)),

        const Icon(Icons.arrow_forward_ios_sharp),


      ],
    );
  }

}
