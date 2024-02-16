import 'package:flutter/material.dart';

void main() {
  runApp(Campotexto());
}

class Campotexto extends StatefulWidget {
  const Campotexto({super.key});

  @override
  State<Campotexto> createState() => _CampotextoState();
}

class _CampotextoState extends State<Campotexto> {
  TextEditingController campo_nome = TextEditingController();
  TextEditingController campo_idade = TextEditingController();
  TextEditingController campo_endereco = TextEditingController();
  TextEditingController campo_email = TextEditingController();
  TextEditingController campo_telefone = TextEditingController();
  bool authorized = false;
  String? valor;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("App Caixa de Texto"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              TextField(
               
                keyboardType: TextInputType.name, 
                decoration: InputDecoration(
                  labelText: "Digite seu nome"),
                  
                  controller: campo_nome, 
              ),
              TextField(
                
                keyboardType: TextInputType.name, 
                decoration: InputDecoration(
                  labelText: "Digite sua idade"),
                  
                  controller: campo_idade, 
              ),
              TextField(
                
                keyboardType: TextInputType.name, 
                decoration: InputDecoration(
                  labelText: "Digite seu endereço"),
                  
                  controller: campo_endereco, 
              ),
              TextField(
                
                keyboardType: TextInputType.name, 
                decoration: InputDecoration(
                  labelText: "Digite seu email"),
                  
                  controller: campo_email, 
              ),
              TextField(
                
                keyboardType: TextInputType.name, 
                decoration: InputDecoration(
                  labelText: "Digite seu telefone"),
                  
                  controller: campo_telefone, 
              ),
                ElevatedButton(onPressed: (){
                  setState(() {
                    campo_nome.text = "";
                  });

                }, child: Text("Limpar")),
                ElevatedButton(onPressed: (){
                  print("${campo_nome.text}");
                  print("${campo_idade.text}");
                  print("${campo_endereco.text}");
                  print("${campo_email.text}");
                  print("${campo_telefone.text}");
                  
                }, child: Text("Verificar")),
                
            ] 
          ),
      ),
    );
  }
}