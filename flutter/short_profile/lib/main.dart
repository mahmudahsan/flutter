import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:short_profile/widget/info_card.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

const url = 'http://thinkdiff.net';
const email = 'mahmud@example.com';
const phone = '+880 123 456 78';
const location = 'Melaka, Malaysia';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  void _showDialog(BuildContext context, {String title, String msg}) {
    final dialog = AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: <Widget>[
        RaisedButton(
          color: Colors.teal,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Close',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (x) => dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/Mahmud_200.jpg'),
            ),
            Text('Mahmud Ahsan',
                style: GoogleFonts.pacifico(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            Text(
              'Software Engineer',
              style: GoogleFonts.sourceSansPro(
                  fontSize: 30,
                  color: Colors.teal[50],
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.teal.shade700,
              ),
            ),
            InfoCard(
              text: phone,
              icon: Icons.phone,
              onPressed: () async {
                String removeSpaceFromPhoneNumber =
                    phone.replaceAll(new RegExp(r"\s+\b|\b\s"), "");
                final phoneCall = 'tel:$removeSpaceFromPhoneNumber';

                if (await launcher.canLaunch(phoneCall)) {
                  await launcher.launch(phoneCall);
                } else {
                  _showDialog(
                    context,
                    title: 'Sorry',
                    msg: 'Phone number can not be called. Please try again!',
                  );
                }
              },
            ),
            InfoCard(
              text: email,
              icon: Icons.email,
              onPressed: () async {
                final emailAddress = 'mailto:$email';

                if (await launcher.canLaunch(emailAddress)) {
                  await launcher.launch(emailAddress);
                } else {
                  _showDialog(
                    context,
                    title: 'Sorry',
                    msg: 'Email can not be send. Please try again!',
                  );
                }
              },
            ),
            InfoCard(
              text: url,
              icon: Icons.web,
              onPressed: () async {
                if (await launcher.canLaunch(url)) {
                  await launcher.launch(url);
                } else {
                  _showDialog(
                    context,
                    title: 'Sorry',
                    msg: 'URL can not be opened. Please try again!',
                  );
                }
              },
            ),
            InfoCard(
              text: location,
              icon: Icons.location_city,
              onPressed: null,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal[200],
    );
  }
}
