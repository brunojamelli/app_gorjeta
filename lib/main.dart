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

  void _calcularGorjeta(String value) {
    double valorCompra = double.tryParse(value) ?? 0.0;
    setState(() {
      _gorjeta = valorCompra * 0.1; // 10% de gorjeta
      _valorTotal = valorCompra + _gorjeta;
    });
  }

  @override
  void initState() {
    super.initState();
    _valorController.addListener(() {
      _calcularGorjeta(_valorController.text);
    });
  }

  @override
  void dispose() {
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcula Gorjetas',
          style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Imagem local
              Image.asset(
                'assets/gorjetas_image.jpg', // Caminho da imagem
                height: 200, // Altura da imagem
                width: 200, // Largura da imagem
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
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