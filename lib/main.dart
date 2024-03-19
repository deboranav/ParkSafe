import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _vaga = 0;
  String _mensagem = "Temos 20 vagas";

  void _changeVaga(int delta) {
    setState(() {
      _vaga += delta;
      if (_vaga >= 20) {
        _mensagem = "Estamos lotados!";
        _vaga = 20;
      } else if (_vaga < 20 && _vaga >= 0) {
        _mensagem = "Temos ${20 - _vaga} vagas";
      } else {
        _vaga = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Parksafe'),
            backgroundColor: Color.fromARGB(255, 131, 33, 243),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 250,
                        height: 250,
                        child: Image(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        "Estacionamento Park Safe",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "O que deseja?",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 131, 33, 243),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _changeVaga(1);
                                });
                              },
                              child: Text(
                                "Entrar",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _changeVaga(-1);
                                });
                              },
                              child: Text(
                                "Sair",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          _mensagem,
                          style: TextStyle(
                              color: Colors.blue,
                              fontStyle: FontStyle.italic,
                              fontSize: 17),
                        ),
                      ),
                      Container(
                        child: LinearProgressIndicator(
                            color: Color.fromARGB(255, 131, 33, 243),
                            value: (1 / 20) * _vaga),
                        width: 200,
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
