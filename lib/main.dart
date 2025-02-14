import 'package:flutter/material.dart';

void main() {
  runApp(CalculaGorjetasApp());
}

class CalculaGorjetasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcula Gorjetas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculaGorjetasScreen(),
    );
  }
}

class CalculaGorjetasScreen extends StatefulWidget {
  @override
  _CalculaGorjetasScreenState createState() => _CalculaGorjetasScreenState();
}

class _CalculaGorjetasScreenState extends State<CalculaGorjetasScreen> {
  final TextEditingController _valorController = TextEditingController();
  double _valorTotal = 0.0;
  double _gorjeta = 0.0;

  void _calcularGorjeta() {
    double valorCompra = double.tryParse(_valorController.text) ?? 0.0;
    setState(() {
      _gorjeta = valorCompra * 0.1; // 10% de gorjeta
      _valorTotal = valorCompra + _gorjeta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcula Gorjetas'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centraliza verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centraliza horizontalmente
            children: [
              SizedBox(
                width: 300, // Largura fixa para o campo de texto
                child: TextField(
                  controller: _valorController,
                  decoration: InputDecoration(
                    labelText: 'Valor da Compra',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularGorjeta,
                child: Text('Calcular Gorjeta'),
              ),
              SizedBox(height: 20),
              Text(
                'Valor da Gorjeta: R\$${_gorjeta.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Valor Total: R\$${_valorTotal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}