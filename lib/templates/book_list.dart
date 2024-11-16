import 'package:flutter/material.dart';
import 'book_form.dart';
import '../database/database_controller.dart';

class ListaDeLivrosScreen extends StatefulWidget {
  const ListaDeLivrosScreen({super.key});

  @override
  ListaDeLivrosScreenState createState() => ListaDeLivrosScreenState();
}

class ListaDeLivrosScreenState extends State<ListaDeLivrosScreen> {
  final DatabaseController _databaseController = DatabaseController();
  List<Map<String, dynamic>> _livros = [];

  @override
  void initState() {
    super.initState();
    _loadLivros();
  }

  _loadLivros() async {
    var livros = await _databaseController.getLivros();
    setState(() {
      _livros = livros;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Livros'),
      ),
      body: ListView.builder(
        itemCount: _livros.length,
        itemBuilder: (context, index) {
          var livro = _livros[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(livro['titulo'] ?? 'Título não disponível'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Autor: ${livro['autor'] ?? 'Autor não disponível'}'),
                  Text('Editora: ${livro['editora'] ?? 'Editora não disponível'}'),
                  Text('Edição: ${livro['edicao'] ?? 'Edição não disponível'}'),
                  Text('ISBN: ${livro['isbn'] ?? 'ISBN não disponível'}'),
                  Text('Endereço de Fabricação: ${livro['enderecoFabricacao'] ?? 'Endereço não disponível'}'),
                  Text('Data de Publicação: ${livro['dataPublicacao'] ?? 'Data não disponível'}'),
                  Text('Descrição: ${livro['descricao'] ?? 'Descrição não disponível'}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CadastroDeLivroScreen()),
          ).then((_) {
            _loadLivros();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
