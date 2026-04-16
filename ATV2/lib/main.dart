import 'package:flutter/material.dart';
import 'telaConfirmacao.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Usuário',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const TelaCadastro(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _idadeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Focus nodes para navegação entre campos
  final FocusNode _nomeFocus = FocusNode();
  final FocusNode _idadeFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();

  
  String? _sexoSelecionado;
  bool _aceitaTermos = false;

  // ignore o cavalo professor, foi so uma zoeira kkkkkkk
  final List<String> _opcoesSexo = ['Masculino', 'Feminino', 'Cavalo', 'Outro'];

  @override
  void dispose() {
    _nomeController.dispose();
    _idadeController.dispose();
    _emailController.dispose();
    _nomeFocus.dispose();
    _idadeFocus.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  bool _validarCampos() {
    
    if (_nomeController.text.trim().isEmpty) {
      _mostrarSnackBar('O nome não pode ser vazio');
      return false;
    }

    
    if (_idadeController.text.trim().isEmpty) {
      _mostrarSnackBar('A idade não pode ser vazia');
      return false;
    }

    try {
      int idade = int.parse(_idadeController.text.trim());
      if (idade < 18) {
        _mostrarSnackBar('A idade deve ser maior ou igual a 18 anos');
        return false;
      }
    } catch (e) {
      _mostrarSnackBar('A idade deve ser um número válido');
      return false;
    }

    
    String email = _emailController.text.trim();
    if (email.isEmpty) {
      _mostrarSnackBar('O email não pode ser vazio');
      return false;
    }

    if (!email.contains('@') || !email.contains('.')) {
      _mostrarSnackBar('O email deve conter @ e .');
      return false;
    }

    
    if (_sexoSelecionado == null) {
      _mostrarSnackBar('Selecione o sexo');
      return false;
    }

    
    if (!_aceitaTermos) {
      _mostrarSnackBar('Você deve aceitar os termos de uso');
      return false;
    }

    return true;
  }

  void _mostrarSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensagem),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _cadastrar() {
    if (_validarCampos()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaConfirmacao(
            nome: _nomeController.text.trim(),
            idade: int.parse(_idadeController.text.trim()),
            email: _emailController.text.trim(),
            sexo: _sexoSelecionado!,
            aceitaTermos: _aceitaTermos,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Cadastro de Usuário',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 2,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                Text(
                  'Preencha os campos abaixo',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 32),

                
                TextField(
                  controller: _nomeController,
                  focusNode: _nomeFocus,
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                    hintText: 'Digite seu nome completo',
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => _idadeFocus.requestFocus(),
                ),

                const SizedBox(height: 16),

                
                TextField(
                  controller: _idadeController,
                  focusNode: _idadeFocus,
                  decoration: InputDecoration(
                    labelText: 'Idade',
                    hintText: 'Digite sua idade',
                    prefixIcon: const Icon(Icons.calendar_today, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (_) => _emailFocus.requestFocus(),
                ),

                const SizedBox(height: 16),

                
                TextField(
                  controller: _emailController,
                  focusNode: _emailFocus,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'exemplo@email.com',
                    prefixIcon: const Icon(Icons.email, color: Colors.blue),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey[300]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.blue, width: 2),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                ),

                const SizedBox(height: 16),

                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _sexoSelecionado,
                      hint: const Row(
                        children: [
                          Icon(Icons.people, color: Colors.blue, size: 20),
                          SizedBox(width: 12),
                          Text(
                            'Selecione o sexo',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down, color: Colors.blue),
                      items: _opcoesSexo.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _sexoSelecionado = newValue;
                        });
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: CheckboxListTile(
                    title: const Text(
                      'Aceito os termos de uso',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: const Text(
                      'Li e concordo com os termos e condições',
                      style: TextStyle(fontSize: 12),
                    ),
                    value: _aceitaTermos,
                    onChanged: (bool? value) {
                      setState(() {
                        _aceitaTermos = value ?? false;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: Colors.blue,
                    checkColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                
                ElevatedButton(
                  onPressed: _cadastrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 3,
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Cadastrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}