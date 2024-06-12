import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../main.dart';

class ConnectionErrorPopup extends StatelessWidget   {
  const ConnectionErrorPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      contentPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 0, left: 0, right: 0),
      title: Container(
        padding:EdgeInsets.only(left: 15, right: 15,top:15,bottom:5),
        child: Text('ΣΦΑΛΜΑ ΔΙΚΤΟΥ',
            style: TextStyle(fontFamily: 'Futura-Bol',fontSize: 13,letterSpacing: 1.4,color:Colors.red)),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Divider(),
            Container(
              padding:EdgeInsets.only(left: 15, right: 15,top:5,bottom:15),
              child: Text('ΠΡΟΕΚΥΨΕ ΣΦΑΛΜΑ ΜΕ ΤΗΝ ΕΠΙΚΟΙΝΩΝΙΑ ΜΕ ΤΗΝ ΒΑΣΗ ΔΕΔΟΜΕΝΩΝ.\nΠΑΡΑΚΑΛΟΥΜΕ ΠΡΟΣΠΑΘΗΣΤΕ ΞΑΝΑ ΑΡΓΟΤΕΡΑ.',
                  style: TextStyle(fontFamily: 'Futura-Boo',fontSize: 11,letterSpacing: 1.4)),
            ),
            Container(
              margin: EdgeInsets.only(bottom:15),
              child: returnScreen(kind: 2 ),
            )
          ],
        ),
      ),
    );
  }
}

class ConnectionErrorHomePopup extends StatelessWidget   {
  const ConnectionErrorHomePopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      contentPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      titlePadding: EdgeInsets.only(top: 0, left: 0, right: 0),
      title: Container(
        padding:EdgeInsets.only(left: 15, right: 15,top:15,bottom:5),
        child: Text('ΣΦΑΛΜΑ ΔΙΚΤΟΥ',
            style: TextStyle(fontFamily: 'Futura-Bol',fontSize: 13,letterSpacing: 1.4,color:Colors.red)),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[

            Container(
              padding:EdgeInsets.only(left: 15, right: 15,top:5,bottom:15),
              child: Text('ΠΡΟΕΚΥΨΕ ΣΦΑΛΜΑ ΜΕ ΤΗΝ ΕΠΙΚΟΙΝΩΝΙΑ ΜΕ ΤΗΝ ΒΑΣΗ ΔΕΔΟΜΕΝΩΝ.\nΠΑΡΑΚΑΛΟΥΜΕ ΠΡΟΣΠΑΘΗΣΤΕ ΞΑΝΑ.',
                  style: TextStyle(fontFamily: 'Futura-Boo',fontSize: 11,letterSpacing: 1.4)),
            ),

            Container(
              margin: EdgeInsets.only(bottom:15),
              child: returnScreen(kind: 3),
            )
          ],
        ),
      ),
    );
  }
}
class returnScreen extends StatelessWidget {

  const returnScreen({Key? key, required this.kind,}) : super(key: key);
  final int kind;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: (){
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Aris News')),
                (Route<dynamic> route) => false,
          );
        },
        child: Container(
          height: 30,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(color: Colors.black),
          width: MediaQuery.of(context).size.width*0.7,
          child: Row(
            children: [

              Expanded(
                  child:Container(
                    margin: EdgeInsets.only(right: 15),
                    child:  Text("ΔΟΚΙΜΑΣΤΕ ΞΑΝΑ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,letterSpacing: 0.8,
                      ),
                      textAlign: TextAlign.center,),
                  )
              ),

              Container(
                padding: EdgeInsets.only(right: 5),
                child: Icon(Icons.refresh,color: Colors.white,),
              ),
            ],
          ),
        )
      ),
    );
  }
}