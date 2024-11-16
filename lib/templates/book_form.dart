import 'package:flutter/material.dart';
import '../database/database_controller.dart';

class CadastroDeLivroScreen extends StatefulWidget {
  const CadastroDeLivroScreen({super.key});

  @override
  CadastroDeLivroScreenState createState() => CadastroDeLivroScreenState();
}

class CadastroDeLivroScreenState extends State<CadastroDeLivroScreen> {
  final _formKey = GlobalKey<FormState>();
  final DatabaseController _databaseController = DatabaseController();

  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _editoraController = TextEditingController();
  final TextEditingController _edicaoController = TextEditingController();
  final TextEditingController _enderecoController = TextEditingController();
  final TextEditingController _isbnController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  final TextEditingController _dataPublicacaoController = TextEditingController();

  _cadastrarLivro() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> livro = {
        'titulo': _tituloController.text,
        'autor': _autorController.text,
        'editora': _editoraController.text,
        'edicao': _edicaoController.text,
        'enderecoFabricacao': _enderecoController.text,
        'isbn': _isbnController.text,
        'descricao': _descricaoController.text,
        'dataPublicacao': _dataPublicacaoController.text,
      };
      await _databaseController.insertLivro(livro);
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Livro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _tituloController,
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) => value!.isEmpty ? 'Título é obrigatório' : null,
              ),
              TextFormField(
                controller: _autorController,
                decoration: const InputDecoration(labelText: 'Autor'),
                validator: (value) => value!.isEmpty ? 'Autor é obrigatório' : null,
              ),
              TextFormField(
                controller: _editoraController,
                decoration: const InputDecoration(labelText: 'Editora'),
                validator: (value) => value!.isEmpty ? 'Editora é obrigatória' : null,
              ),
              TextFormField(
                controller: _edicaoController,
                decoration: const InputDecoration(labelText: 'Edição'),
                validator: (value) => value!.isEmpty ? 'Edição é obrigatória' : null,
              ),
              TextFormField(
                controller: _enderecoController,
                decoration: const InputDecoration(labelText: 'Endereço de Fabricação'),
                validator: (value) => value!.isEmpty ? 'Endereço de fabricação é obrigatório' : null,
              ),
              TextFormField(
                controller: _isbnController,
                decoration: const InputDecoration(labelText: 'ISBN'),
                validator: (value) => value!.isEmpty ? 'ISBN é obrigatório' : null,
              ),
              TextFormField(
                controller: _descricaoController,
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) => value!.isEmpty ? 'Descrição é obrigatória' : null,
              ),
              TextFormField(
                controller: _dataPublicacaoController,
                decoration: const InputDecoration(labelText: 'Data de Publicação'),
                validator: (value) => value!.isEmpty ? 'Data de publicação é obrigatória' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _cadastrarLivro,
                child: const Text('Cadastrar Livro'),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
