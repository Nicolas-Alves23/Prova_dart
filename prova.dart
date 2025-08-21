import 'dart:io';

void main(){
  // mensagem de forma de pagamento
  String forma_pag = """
    Me informe a forma de pagamento:
            1 - Crédito
            2 - Débito
            3 - Pix
            4 - Dinheiro
""";
  // mensagem de boas vindas personalizada
  String msg_boasvindas = """

⠀⠀⠀⠈⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣀⣀⣀⡀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣶⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢹⣿⣿⣿⣿⣿⠟⢻⠛⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⡄⠈⡗⠲⢤⣀⠀⠀⠀
⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠁⠀⣾⣿⣿⣿⠟⠁⢠⠃⢀⣿⣿⡏⠀⢻⣿⣿⣿⣿⣿⣿⣿⣄⣸⡀⠀⠀⠉⠒⠄
⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠻⣆⠀⠀⣿⣿⡿⠁⠀⢀⣾⣶⣿⣿⡿⣿⣦⠀⢿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣠⠤⣽⡆⠀⣿⠏⠀⢀⣴⡿⠋⠁⣻⠿⡄⠀⠁⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⡇⠀⡇⠀⠀⠁⠰⠏⠀⡠⠛⠉⠁⠀⠀⠉⠀⣧⠀⠀⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡧⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⣀⣘⣿⣿⣿⣿⣿⣷⡀⡇⠀⠀⣠⠀⠀⠀⢰⣶⠄⠀⠀⡰⢤⠀⡇⠀⢀⡾⢟⣿⣿⣿⠟⠁⠘⣿⠙⠿⠁⠀⠀⠀⠀
⠀⠀⠠⣤⣶⣾⣿⣿⣿⣿⠉⣿⣿⣿⣏⠁⣇⠀⠀⠛⠀⠀⠀⠀⠁⣤⣤⣴⠷⡀⠙⢷⣄⠀⠀⣾⠛⠟⠁⣼⠁⠀⢿⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠉⠛⠻⣿⡏⠘⡄⢸⠹⣿⣿⠀⠘⣮⣭⠶⠂⠀⠀⠒⠚⢉⠉⡿⢄⠈⢢⡈⠢⡑⢎⠁⠀⠀⢸⡁⠁⠀⣺⡇⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢰⠛⡇⠀⡇⢸⠀⢻⣿⡇⠉⠀⠳⡤⠗⠀⣀⠤⠊⣉⣣⠳⡀⠑⢄⠙⢦⡉⢮⣧⠀⠀⠈⣩⠇⢀⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡼⠀⡇⠠⡃⢸⠀⢸⠿⣇⠀⠀⠀⠀⡖⠩⢴⣾⣿⣿⠿⡆⠙⣄⠀⠳⡀⠑⢄⠻⣇⣰⠿⠋⣠⣾⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡇⠀⡇⠀⡇⠸⡄⠈⣇⡼⣄⠀⠀⠀⠙⣶⣾⣿⡿⠋⠀⡇⠀⠘⡄⠀⠙⢄⠀⠀⠈⢧⠴⠾⠿⠟⠛⢻⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡇⠀⡇⠀⣇⡼⠧⠴⠏⠀⠈⣆⠀⠀⠀⠈⢿⠿⡇⠀⢀⡇⠀⠀⠹⡄⠀⢺⣳⠀⠣⠈⣇⠀⠀⠀⢀⣸⠆⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⡇⢀⡷⠚⢁⡠⠀⠀⢸⣀⠀⡏⠑⢄⡀⠀⠈⠳⢍⣛⠽⠃⠀⠀⠀⣇⠀⠀⠀⠀⠀⠀⠸⡄⠈⢏⠉⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢧⠀⠀⠴⠉⢀⡠⠤⢼⠀⠀⣧⡀⠀⣏⠒⢤⡀⠀⠀⠀⠀⠀⣀⡤⢿⡀⠀⠀⠀⠀⠀⠀⢱⠀⠈⢧⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⠀⢀⠐⠋⠁⠀⣠⠋⠁⠀⡏⢿⡀⢸⠀⠀⢹⠓⠒⠒⠲⣏⠁⠉⠉⣇⠀⠀⠀⠀⠀⠀⠀⠳⣶⣼⡆⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⡇⠈⠙⠲⠤⠀⠁⠀⠀⢠⠇⠘⣧⠸⡄⠀⠈⣆⣀⣀⣀⠈⠳⡄⠀⠘⡄⠀⠀⠀⠀⠀⠀⢠⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⣠⣿⣇⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠈⠀⢣⠀⠀⠸⡄⠀⠈⠉⠙⠚⠦⣀⣹⣄⠀⠀⠀⠀⣠⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢀⣴⣿⣿⣿⣶⣤⠀⢠⣶⣾⣿⠷⡀⠀⠀⠀⠀⠈⣆⠀⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠀⠙⠲⣤⣴⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⡄⢳⠀⠀⠀⠀⠀⠈⠢⡀⠀⠀⠑⢄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀
⠀⡠⠞⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠀⠘⣌⢧⠀⠀⠀⠀⠀⠀⠈⠓⢄⣀⠀⠙⠢⣄⠀⢸⡀⠀⠀⢀⠞⠉⠛⢿⣿⣿⣅⠀⠀⠀⠀⠀
          BEMMM VINDOOOO
Você acabou de chegar na Star games
      Temos diversos produtos 
                  \n
""";
  print(msg_boasvindas);
  
  // Dando inicio ao inventario (19 produtos)
  // Fiz os primeiros 5 produtos e pedi para uma IA fazer o restante
  Map<int, Produto> inventario = {
    // Consoles
    1: Produto("PS5", 3500.00, 8),
    2: Produto("PS5 Digital", 3200.00, 5),
    3: Produto("Xbox Series X", 3200.00, 5),
    4: Produto("Xbox Series S", 1800.00, 10),
    5: Produto("Nintendo Switch", 2000.00, 12),
    6: Produto("Nintendo Switch OLED", 2500.00, 6),

    // Controles
    7: Produto("Controle DualSense PS5", 450.00, 20),
    8: Produto("Controle Xbox", 400.00, 15),
    9: Produto("Controle Joy-Con Switch", 350.00, 18),

    // Jogos PS5
    10: Produto("Marvel's Spider-Man: Miles Morales (PS5)", 299.00, 12),
    11: Produto("Demon's Souls (PS5)", 349.00, 8),
    
    // Jogos Xbox
    12: Produto("Halo Infinite (Xbox)", 299.00, 10),
    13: Produto("Forza Horizon 5 (Xbox)", 349.00, 7),

    // Jogos Switch
   14: Produto("Zelda: Breath of the Wild (Switch)", 299.00, 9),
   15: Produto("Mario Party Superstars (Switch)", 249.00, 10),

  };
  // forEach para print do estoque
  inventario.forEach((codigo, produto) => print("━═━═━═━┤$codigo -> $produto├━═━═━═━ ,\n")); 

  // Perguntando para o usuário se ele deseja comprar na loja
  print("Esse é o nosso estoque, quer comprar conosco? (sim/não)");
  String? escolha = stdin.readLineSync();

//Caso seja "sim" ira criar o primeiro usuário
if (escolha == "sim") {
    print("Vamos primeiro criar seu usuário");
    // iniciando a manipulação do usuário 
    Cliente cliente = criarCliente(); // Objeto Cliente criado
    mostrarDados(cliente.nome, cliente.documento); // Print com nome do Cliente e Documento

    Map<Produto, int> carrinho = {}; // iniciando o carrinho do cliente caso sua escolha seja sim 

    double total_carrinho = 0.0;

while (true) {
  // Repetição de carrinho 
  print("\nCarrinho do cliente:");

  // Caso o carrinho esteja vazio print "carrinho vazio"
  if (carrinho.isEmpty) {
    print("Seu carrinho está vazio.");
  } 

  // Caso o carrinho tenha produtos  
  else {
    carrinho.forEach((produto, quantidade) {
      print("${produto.nome} | Quantidade: $quantidade | Preço unitário: R\$${produto.preco.toStringAsFixed(2)} | Total: R\$${(produto.preco * quantidade).toStringAsFixed(2)}");
    });
  }

  print("\nDigite o código do produto que deseja adicionar ao carrinho (ou '0' para finalizar):");
  int inputCodigo = int.parse(stdin.readLineSync()!); // recebendo o input

  if (inputCodigo == 0) break; // Parando o while

  // Caso seja um valor que não seja congruente com o inventario
  if (inputCodigo == null || !inventario.containsKey(inputCodigo)) {
    print("Código inválido. Tente novamente.");
    continue;
  }

  Produto produtoSelecionado = inventario[inputCodigo]!;

  print("Digite a quantidade desejada:");
  String? inputQtd = stdin.readLineSync();
  int? quantidade = int.tryParse(inputQtd ?? '');
  if (quantidade == null || quantidade <= 0) {
    print("Quantidade inválida. Tente novamente.");
    continue;
  }

  adicionarAoCarrinho(carrinho, produtoSelecionado, quantidade);

  print("\nDeseja adicionar mais produtos? (sim/não)");
  String? continuar = stdin.readLineSync();
  if (continuar?.toLowerCase() != 'sim') break;

  limparTerminal();
}


// Mostra o carrinho final
print("\nResumo final do carrinho:");
carrinho.forEach((produto, quantidade) {
  print("${produto.nome} | Quantidade: $quantidade | Preço unitário: R\$${produto.preco.toStringAsFixed(2)} | Total: R\$${(produto.preco * quantidade).toStringAsFixed(2)}");
   total_carrinho += produto.preco * quantidade;
});

print("\nO preço total à pagar é = R\$${total_carrinho.toStringAsFixed(2)}\n");

print(forma_pag); 
int opcao = int.parse(stdin.readLineSync()!);

  switch (opcao) {
    case 1:
      print("Você escolheu o método de pagamento no Crédito");
      print("Deseja parcelar? (Ex: 2x, 3x...)");
  
      break;

    case 2:
      print("Você escolheu o método de pagamento no Débito");
      print("Pagamento será feito à vista.");
      print("Preço = R\$${total_carrinho.toStringAsFixed(2)}\n");
      Recibo(carrinho, cliente.nome, total_carrinho);
      break;

    case 3:
      print("Você escolheu o método de pagamento no Pix");
      print("Você só tem a opção de pagar à vista");
      print("Preço = R\$${total_carrinho.toStringAsFixed(2)}\n");
      Recibo(carrinho, cliente.nome, total_carrinho);
      break;

    case 4:
      print("Você escolheu o método de pagamento no Dinheiro");
      print("Preço = R\$${total_carrinho.toStringAsFixed(2)}");

      double valorPago = 0.0;

      while (valorPago < total_carrinho) {
        stdout.write("Digite o valor entregue pelo cliente: R\$ ");
        String? entrada = stdin.readLineSync();

        if (entrada == null || entrada.isEmpty) {
          print("Valor inválido, tente novamente.");
          continue;
        }

        double? dinheiro = double.tryParse(entrada.replaceAll(",", "."));
        if (dinheiro == null) {
          print("Entrada inválida! Digite apenas números.");
          continue;
        }

        valorPago = dinheiro;

        if (valorPago < total_carrinho) {
          print("Valor insuficiente! Faltam R\$${(total_carrinho - valorPago).toStringAsFixed(2)}");
        }
      }

      double troco = valorPago - total_carrinho;
      print("Valor pago: R\$${valorPago.toStringAsFixed(2)}");
      print("Troco: R\$${troco.toStringAsFixed(2)}\n");

      Recibo(carrinho, cliente.nome, total_carrinho);

    default:
      print("Método de pagamento inválido! Escolha entre 1 a 4.");
  }
}

  else{
    print("FLW");
  }
  }



void Recibo (carrinho, nome, total_carrinho){
  print("--------------------RECIBO--------------------\n");
  carrinho.forEach((produto , quantidade){
    print("${produto.nome} | Quantidade: $quantidade | Preço unitário: R\$${produto.preco.toStringAsFixed(2)} | Total: R\$${(produto.preco * quantidade).toStringAsFixed(2)}");
  });
  print("Valor pago = R\$${total_carrinho.toStringAsFixed(2)} ");
  print("Muito obrigado pela compra $nome");
}

void mostrarDados (nome , documento){
  print('꧁𓊈 Nome:$nome 𓊉꧂\n꧁𓊈 Documento: $documento 𓊉꧂');
}

// Produtos como um objeto
class Produto{
  String nome;
  double preco;
  int quantidade;

  Produto(this.nome, this.preco, this.quantidade);

// Utilizado para auxiliar o dart no mostrar do objeto
// Caso não tenha essa função o dart não sabe como exatamente mostrar o objeto
// não é totalmente necessário para o programa, porém é útil
@override 
String toString() {
  return "Produto: $nome | Preço: R\$${preco.toStringAsFixed(2)} | Quantidade: $quantidade";
}
}

// Objeto Cliente
class Cliente{
  // Primeira vez utilizando POO em dart
  // Criei um objeto Cliente para conseguiu retornar dois valores (Documentos e Nome)
  final String nome;
  final String documento;

  Cliente(this.nome, this.documento);
}

Cliente criarCliente() {
  String? nome;
  String? documento;
  String? erro;
  String? errodocuments;

  do {
    stdout.write("Nome:");
    nome = stdin.readLineSync();

    stdout.write("Documento(RG):");
    documento = stdin.readLineSync();

    erro = validarNome(nome);
    errodocuments = validarDocumento(documento);


    if (erro != null) {
      print("Erro: $erro\n");
      print("Repita e passe o seu documento e nome novamente \n");
    }

    if(errodocuments != null){
      print("Erro referente a documentos:$errodocuments");
      print("Repita e passe o seu documento e nome novamente \n");
    }

  } while (erro != null); // repete enquanto houver erro

  print("Cliente criado com sucesso! Nome: $nome \n");
  return Cliente (nome!, documento!);
}

String? validarNome(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Digite seu nome";
  }

  final regex = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');

  if (!regex.hasMatch(value)) {
    return "Somente letras são permitidas";
  }

  return null; // válido
}

String? validarDocumento (String? value){
    if (value == null || value.trim().isEmpty) {
    return "Digite seu nome";
  }
  final regex = RegExp(r'^[0-9]+$'); // aceita somente números

  if (!regex.hasMatch(value)) {
    return "Somente números são permitidos";
  }

  return null; // válido
}

void adicionarAoCarrinho(Map<Produto, int> carrinho, Produto produto, int quantidade) {
  if (quantidade > produto.quantidade) {
    print("Não há estoque suficiente para ${produto.nome}. Estoque atual: ${produto.quantidade}");
    return;
  }

  // Atualiza o carrinho
  if (carrinho.containsKey(produto)) {
    carrinho[produto] = carrinho[produto]! + quantidade;
  } else {
    carrinho[produto] = quantidade;
  }

  // Reduz estoque
  produto.quantidade -= quantidade;

  print("$quantidade ${produto.nome} adicionados ao carrinho.");
}

void limparTerminal() {
  // Código ANSI para limpar a tela e colocar o cursor no topo
  // Para deixar a vizualização melhor
  print('\x1B[2J\x1B[0;0H');
}

// ━═━═━═━┤Make by Nicolas-Alves23├━═━═━═━  
