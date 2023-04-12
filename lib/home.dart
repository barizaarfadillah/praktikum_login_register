import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic hasil = '';

  TextEditingController tinggiValue = TextEditingController();
  TextEditingController beratValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    var username = arguments?['username'];
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(60),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.orange, Colors.black])),
        child: Card(
          elevation: 15,
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 0),
              // ignore: prefer_const_constructors
              child: Text(
                "BMI Kalkulator",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                children: [
                  Text('Selamat Datang, ' + username),
                  SizedBox(height: 50),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: tinggiValue,
                    decoration:
                        const InputDecoration(labelText: 'Tinggi Badan (cm)'),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: beratValue,
                    decoration:
                        const InputDecoration(labelText: 'Berat Badan (kg)'),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 40.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.black,
                      elevation: 10.0,
                      child: ElevatedButton(
                        onPressed: () {
                          final int berat = int.tryParse(beratValue.text) ?? 0;
                          final int tinggi =
                              int.tryParse(tinggiValue.text) ?? 0;
                          dynamic hitung =
                              (berat / ((tinggi / 100) * (tinggi / 100)));

                          setState(() {
                            if (hitung < 18.5) {
                              hasil = 'Berat badan kurang';
                            } else if (hitung < 25) {
                              hasil = 'Berat badan normal';
                            } else if (hitung < 30) {
                              hasil = 'Kelebihan berat badan';
                            } else if (hitung > 30) {
                              hasil = 'Obesitas';
                            } else {
                              hasil = 'Masukkan data';
                            }
                          });
                          beratValue.text = "";
                          tinggiValue.text = "";
                        },
                        child: Text('Hasil'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 330,
                    height: 60,
                    child: Center(
                      child: Text(
                        'Hasil BMI : ${hasil}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
