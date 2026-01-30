//
//  main.swift
//  POOBootcampMasterCode
//
//  Created by Caio Fabrini on 26/01/26.
//

import Foundation

// POO -> Programação orientada a objeto

//POO é um paradigma de programação que permite organizar o código em torno de objetos, que são instâncias de classes que encapsulam dados e comportamentos relacionados. Esses objetos interagem entre si por meio de métodos, que são funções que podem manipular os dados contidos nos objetos.
//A POO tem quatro conceitos principais:
//1.⁠ ⁠Abstração: é o processo de identificar as características mais importantes de um objeto e modelá-las em uma classe. A abstração ajuda a simplificar o problema em questão e torná-lo mais fácil de entender. Abstração é o ato de esconder detalhes complexos e mostrar só o que importa. É como usar uma máquina de café: você aperta um botão e ela faz tudo por trás dos panos — você não precisa entender como funciona por dentro, só sabe que ela entrega café.
//2.⁠ ⁠Encapsulamento: é a ideia de que os dados e comportamentos relacionados devem ser agrupados em uma unidade coesa, que é a classe. O encapsulamento ajuda a proteger os dados de serem acessados e modificados de maneira incorreta.
//3.⁠ ⁠Herança: é o processo de criar uma nova classe a partir de uma classe existente, aproveitando seus dados e comportamentos. A herança ajuda a evitar a duplicação de código e a criar uma hierarquia de classes que reflete a relação entre os objetos do problema em questão.
//4.⁠ ⁠Polimorfismo: é a capacidade de os objetos se comportarem de maneira diferente em diferentes contextos. O polimorfismo permite que os métodos das classes derivadas possam substituir os métodos da classe base, proporcionando uma flexibilidade e reutilização do código.
//A POO é uma abordagem muito útil para lidar com problemas complexos, pois permite que o código seja dividido em partes menores e mais gerenciáveis, facilitando a manutenção e a evolução do software.


//Orientação a Objetos (OO) não é só sobre programação, mas também envolve análise e design. Vamos separar as ideias pra deixar tudo bem claro:
//Existem 3 conceitos na Orientação a Objeto, esse conceito se refere para desenvolver qualquer software. você precisa entender esse 3 conceito:
//
//
//•⁠  ⁠Análise: Entender o problema.
//
//•⁠  ⁠O que precisa ser feito?
//•⁠  ⁠Qual o problema a ser resolvido?
//
//•⁠  ⁠Design: Planejar a solução do problema.
//
//•⁠  ⁠Como fazer o que precisa ser feito?
//•⁠  ⁠Como resolver o problema
//
//•⁠  ⁠Programação: Criar o aplicativo (Botar a mão na massa)
//
//•⁠  ⁠Fazer o que precisar ser feito
//•⁠  ⁠Implementar a solução do problema


// MARK: - Classe -> Modelo de um OBJETO!!!
// Atributo / Propriedades = características de um objeto
// Ações = função / método
// Classe trabalha com REFERENCY TYPE!!!

// Como posso criar uma classe?
// Utilizamos a palavra reservada "class" e na sequencia o nome do mesmo. OBS: SEMPREEE COM A PRIMEIRA LETRA MAIÚSCULA

class Automovel {
  var cor: String = "Vermelho"
  let quantidadeDePortas: Int = 2
  let marca: String = "Ferrari"
  let conversivel: Bool = true
  let modelo: String = "F40"
  let ano: Int = 2018
  let placa: String = "ABC-123"

  func ligar() {
    print("O carro está ligado!")
  }

  func acelerar() {
    print("O carro está acelerando!")
  }
}

// Como criar um objeto? Como posso dar VIDA ao nosso objeto?
// Um objeto só ganha VIDAA, quando geramos a sua INSTANCIA -> que é quando abrimos e fechamos parenteses -> ()

let minhaFerrari: Automovel = Automovel()
minhaFerrari.cor = "Preta"

let gabrielFerrari: Automovel = Automovel()


//print(minhaFerrari.cor)
//print(gabrielFerrari.cor)


//print(minhaFerrari.ano)
//print(minhaFerrari.placa)
//print(minhaFerrari.conversivel)
//minhaFerrari.ligar()
//minhaFerrari.acelerar()


// Casos opcionais

//var wallaceFerrari: Automovel?
//print(wallaceFerrari?.ano ?? 10)
//wallaceFerrari?.ligar()
//
//wallaceFerrari = Automovel()
//
//print(wallaceFerrari?.ano ?? 0)
//wallaceFerrari?.ligar()

// MARK: - Construtores
// Se caso não tem valor inicial, você precisa passar ele através do init!
// Caso a propriedade tenha uma valor inicial, repare que o init não vai te pedir obrigatoriedade sobre o mesmo, pois ele TEM VALOR. Diferente das propriedades que não tem valor inicial, que elas sim, necessitam do init (método construtor)

// OBS: O self sempre será chamado quando tiver uma variável externa com o mesmo nome da propriedade de uma função por exemplo...
class Pessoa {
  var idade: Int
  var nome: String
  var altura: Double
  var peso: Double
  var corCabelo: String = "azul"

  // Metodo construtor
  init(idade: Int, nome: String, altura: Double, peso: Double) {
    self.idade = idade
    self.nome = nome
    self.altura = altura
    self.peso = peso
  }
}

var caio: Pessoa = Pessoa(idade: 24, nome: "Caio", altura: 1.83, peso: 90.0)
//print(caio.corCabelo)
var marcello: Pessoa = Pessoa(idade: 26, nome: "Marcello", altura: 1.60, peso: 90)
//print(marcello.corCabelo)


class Bolo {
  var peso: Double
  var preco: Double
  var sabor: [String]
  var eDoce: Bool?

  init(peso: Double, preco: Double, sabor: [String]) {
    self.peso = peso
    self.preco = preco
    self.sabor = sabor
  }

  func adicionarSabores(novoSabor: String) {
    sabor.append(novoSabor)
  }
}


// MARK: - Exercícios Classe

// Exercício 1: Conta Poupança
// Objetivo: Desenvolver uma classe chamada 'ContaPoupanca' para gerenciar os depósitos em uma conta poupança de banco.
//
// Descrição:
// Propriedades:
// - saldo (Double): O saldo atual na conta.
// Construtor:
// - Inicialize o saldo.
// Métodos:
// - depositar(valor: Double): Adiciona(+) o valor especificado ao saldo atual. (saldo = saldo + valor especificado)
// - consultarSaldo() -> Double: Retorna o saldo atual da conta.

//   Para usar este método, você deve criar uma instância da classe, chamar este método e armazenar o valor retornado em uma variável. Em seguida, você pode imprimir esse valor.
// print("Saldo atual: R$\(saldoAtual)")

class ContaPoupanca {
  var saldo: Double

  init(saldo: Double) {
    self.saldo = saldo
  }

  func depositar(valor: Double) {
    saldo = saldo + valor
  }

  func consultarSaldo() -> Double {
    return saldo
  }
}

var minhaConta: ContaPoupanca = ContaPoupanca(saldo: 10)
minhaConta.depositar(valor: 50)
//print("Saldo atual: R$ \(minhaConta.consultarSaldo()) reais")


// Exercício 2: Gerenciador de Filmes
// Objetivo: Desenvolver uma classe chamada 'Filme' para gerenciar informações sobre filmes em um acervo pessoal.
//
// Descrição:
// Propriedades:
// - titulo (String): O título do filme.
// - diretor (String): O diretor do filme.
// - ano (Int): O ano de lançamento do filme.
// Construtor:
// - Inicialize titulo, diretor e ano.
// Métodos:
// - exibirInfo() -> String: Retorna uma string com todas as informações do filme formatadas.

//   Para usar este método, crie uma instância da classe, chame o método e armazene a informação retornada em uma variável. Em seguida, imprima essa variável para visualizar os detalhes do filme.

class Filme {
  var titulo: String
  var diretor: String
  var ano: Int
  
  init(titulo: String, diretor: String, ano: Int) {
    self.titulo = titulo
    self.diretor = diretor
    self.ano = ano
  }
  
  func exibirInfo() -> String {
    return "Título: \(titulo), Diretor: \(diretor), Ano: \(ano)"
  }
}

var avatar: Filme = Filme(titulo: "Avatar", diretor: "Caio Fabrini", ano: 2026)
var info = avatar.exibirInfo()
print(info)


// Exercício 3: Sistema de Registro de Alunos
// Objetivo: Criar uma classe chamada 'Aluno' para armazenar dados e calcular a média de notas de alunos em uma escola.
//
// Descrição:
// Propriedades:
// - nome (String): O nome do aluno.
// - notas (Array<Double>): Uma lista de notas do aluno.
// Construtor:
// - Inicialize nome e notas.
// Métodos:
// - calcularMedia() -> Double: Calcula e retorna a média das notas do aluno utilizando um laço de repetição para somar as notas.

//   Para utilizar este método, crie uma instância da classe, invoque o método para calcular a média, armazene esse valor em uma variável e imprima a média para visualizar.
// print("Média das notas de \(aluno.nome): \(media)")


class Aluno {
  var nome: String
  var notas: [Double]
  
  init(nome: String, notas: [Double]) {
    self.nome = nome
    self.notas = notas
  }
  
  func calcularMedia() -> Double {
    var soma: Double = 0
    for notaEspecificaAluno in notas {
      soma += notaEspecificaAluno
    }
    return soma / Double(notas.count)
  }
}


var barbara: Aluno = Aluno(nome: "Barbara", notas: [9, 10, 9, 10])
print(barbara.calcularMedia())


// MARK: - Herança

// Classe PAI

class Animal {
  var nome: String
  var cor: String
  var peso: Double

  init(nome: String, cor: String, peso: Double) {
    self.nome = nome
    self.cor = cor
    self.peso = peso
  }
}

// Classe Filha (classe na qual HERDA as propriedades/ações do pai)
// A classe filha contem TUDO OQUE O PAI TEM E + Oque a mesma já tem


class Gato: Animal {
  var contemRabo: Bool = true
}

var bartolomeu: Gato = Gato(nome: "Bartolomeu", cor: "Branco", peso: 5)

class Cachorro: Animal {
  var latir: Bool

  init(latir: Bool, nome: String, cor: String, peso: Double) {
    self.latir = latir
    super.init(nome: nome, cor: cor, peso: peso)
  }

}

var ayron: Cachorro = Cachorro(latir: false, nome: "Ayron", cor: "Branco", peso: 30)


//MARK: - Encapsulamento
// O encapsulamento é a prática de manter os detalhes de implementação de um objeto escondidos e seguros de acesso externo. Isso é feito usando modificadores de acesso para restringir o acesso às propriedades e métodos de uma classe.
// De criar variaveis/função get e set
// get -> pegar/acessar/consultar valor
// set -> setar novo valor/substituir o valor atual por um novo
// Tudo que você coloca sendo private -> ele só existe dentro daquele bloco!!


//open: Acessível em qualquer lugar do mesmo módulo e módulos importados. Permite herança e sobrescrita (override) fora do módulo.
//public: Semelhante ao open, mas restringe a herança/sobrescrita a módulos que o definiram.
//internal: (Padrão) Acessível apenas dentro do módulo de origem (projeto/framework).
//fileprivate: Restringe o acesso apenas ao arquivo fonte onde foi definido.
//private: Restringe o acesso apenas ao escopo definido (ex: dentro de uma classe ou extensão).

class Computador {
    private var armazenamento: Int
    internal var processador: String
    var memoriaRam: Int
    
    init(armazenamento: Int, processador: String, memoriaRam: Int) {
        self.armazenamento = armazenamento
        self.processador = processador
        self.memoriaRam = memoriaRam
    }
    
//    função SET
    public func melhorarArmazenamento(armazenamentoNovo: Int) {
        if validaNovoArmazenamento(novoArmazenamento: armazenamentoNovo) {
            armazenamento = armazenamentoNovo
        }
    }
    
//    Função GET
    public func getArmazenamento() -> Int {
        return armazenamento
    }
    
    private func validaNovoArmazenamento(novoArmazenamento: Int) -> Bool {
        let eValido: Bool = armazenamento < novoArmazenamento
        return eValido
    }
}


var meuComputador: Computador = Computador(armazenamento: 1, processador: "M4", memoriaRam: 18)

//Set
//meuComputador.melhorarArmazenamento(armazenamentoNovo: 20)

//Get
//print(meuComputador.getArmazenamento())



// MARK: - Polimorfismo
// O polimorfismo permite que objetos de diferentes classes sejam tratados como objetos de uma classe comum. Em outras palavras, polimorfismo permite que um método tenha muitas "formas" diferentes, dependendo do objeto que o chama.
// override -> sobrescrever -> substituir


// O polimorfismo, é nada mais, nada menos que quando se tem uma classe FILHA e você quer utilizar o mesmo nome ou função da classe pai, você precisa colocar o override.
// Segue o exemplo:


class Veiculo {
    var velocidadeMaxima: Int
    
    init(velocidadeMaxima: Int) {
        self.velocidadeMaxima = velocidadeMaxima
    }
    
    func detalheDoVeiculo() -> String {
        return "Veiculo com velocidade maxima de \(velocidadeMaxima) km/h"
    }
}


class Carro: Veiculo {
    
    override func detalheDoVeiculo() -> String {
        return "Carros com velocidade maxima de \(velocidadeMaxima) km/h"
    }
}


//Desafio 1 – Sistema de Pagamento
//📌 Descrição
//Você está criando um sistema que processa diferentes formas de pagamento.
//Cada tipo de pagamento calcula a taxa de forma diferente.
// O que precisa ser feito
//Crie uma classe base chamada Pagamento
//Essa classe deve ter um método calcularValorFinal(valor: Double) -> Double
//Crie duas subclasses:
//CartaoCredito
//Pix
//Cada forma de pagamento deve calcular a taxa de forma diferente:
//Cartão de crédito: taxa de 5%
//Pix: sem taxa
//Crie um array do tipo [Pagamento]
//Percorra esse array e imprima o valor final de cada pagamento

// Regras
//Use override
//Não use if ou switch para decidir o tipo de pagamento



//Desafio 2 – Notificações do App
// Descrição
//Um app envia notificações por diferentes canais.
//Cada canal envia a mensagem de uma forma diferente.
// O que precisa ser feito

//Crie uma classe base Notificacao
//Crie o método enviar(mensagem: String)
//Crie pelo menos duas subclasses:
//Email
//SMS
//Cada classe deve sobrescrever o método enviar
//Armazene as notificações em um array [Notificacao]
//Envie a mesma mensagem para todas

// Regras
//O código que envia a mensagem não pode saber qual é o tipo da notificação



//Desafio 3 – Cofre Digital

// Descrição
//Você precisa criar um cofre digital que protege um valor armazenado.
// O que precisa ser feito
//Crie uma classe Cofre
//O valor armazenado deve ser private
//Crie métodos para:
//Depositar valor
//Sacar valor
//O saque só pode acontecer se houver saldo suficiente
//Crie um método para consultar o saldo

// Regras
//O saldo não pode ser acessado diretamente
//Todo acesso deve passar pelos métodos da classe


//Desafio 4 – Usuário Seguro
// Descrição
//Você está criando um sistema de usuários onde a senha precisa ser protegida.
// O que precisa ser feito
//Crie uma classe Usuario
//A senha deve ser private
//A senha só pode ser alterada por um método
//A nova senha deve ter pelo menos 6 caracteres
//Se não for válida, a senha não deve ser alterada

// Regras
//Não permita acesso direto à senha
//A validação deve acontecer dentro da classe


//Desafio 5 – Funcionários da Empresa
// Descrição
//Uma empresa possui funcionários de tipos diferentes, e cada um tem uma forma distinta de cálculo salarial.
// O que precisa ser feito
//Crie uma classe base Funcionario
//Crie um método calcularSalario() -> Double
//Crie subclasses como:
//CLT
//PJ
//Cada tipo deve calcular o salário de forma diferente
//Armazene os funcionários em um array [Funcionario]
//Percorra o array imprimindo o salário de cada funcionário
//Regras
//Use polimorfismo
//Não use if ou switch
//O salário não pode ser um valor público e alterável diretamente





//MARK: - Struct
// Com a struct, não é obrigatorio deixar o construtor de forma explicita
// Struct NÃO ACEITA HERENÇA!!!
// Struct aceita apenas PROTOCOLO em sua hierarquia!!
// Struct trabalha com VALUE TYPE!!!


struct Documento {
    
    var quantidadeDeFolhas: Int
    var tipo: String
    
}


var minhaCNH: Documento = Documento(quantidadeDeFolhas: 5, tipo: "Muito cara")
var meuRG: Documento = Documento(quantidadeDeFolhas: 2, tipo: "Muito importante")




//struct Humano {
//    var nome: String
//}
//
//var pessoa1 = Humano(nome: "Gabriel")// Objeto
//var pessoa2 = pessoa1  // copia do VALOR
//
//
//print(pessoa1.nome)//Gabriel
//print(pessoa2.nome)//Gabriel
//
//pessoa2.nome = "Renato" // O Swift copiou os dados
////São duas pessoas diferentes na memória
//
//print(pessoa1.nome)//Gabriel
//print(pessoa2.nome)//Renato


class Humano {
    var nome: String
    
    init(nome: String) {
        self.nome = nome
    }
}

var pessoa1 = Humano(nome: "Gabriel")// Objeto
var pessoa2 = pessoa1 // Referência para o MESMO OBJETO


print(pessoa1.nome)//Gabriel
print(pessoa2.nome)//Gabriel

pessoa2.nome = "Renato"


print(pessoa1.nome)//Renato
print(pessoa2.nome)//Renato

// ----------------------//---------------------

//struct ContaBancaria {
//    var saldo: Double
//}
//
//var contaA = ContaBancaria(saldo: 100)
//var contaB = contaA // Copia
//
//contaB.saldo = 50
//
//print(contaA.saldo)// 100
//print(contaB.saldo)// 50



class ContaBancaria {
    var saldo: Double
    
    init(saldo: Double) {
        self.saldo = saldo
    }
}

var contaA = ContaBancaria(saldo: 100)
var contaB = contaA

contaB.saldo = 50

print(contaA.saldo)// 50
print(contaB.saldo)// 50


// ----------------------//---------------------

class Carro2 {
    var modelo: String
    
    init(modelo: String) {
        self.modelo = modelo
    }
}


let carro1 = Carro2(modelo: "Fusca")
let carro2 = carro1


let carro3 = Carro2(modelo: "Ferrari")
let carro4 = carro3


print(carro1 === carro2)// true

// === Verifica se é o mesmo OBJETO NA MEMÓRIA
// So funciona com class


//private(set)
//• Quando você escreve private(set) antes de uma propriedade, significa que:
//• A propriedade é pública para leitura no escopo onde ela é visível (por exemplo, internal por padrão, ou public se você declarar).
//• Mas o setter é privado, ou seja, só pode ser modificado dentro do mesmo arquivo/estrutura/classe onde foi declarado (no mesmo tipo).


//• Struct é um tipo por valor. A imutabilidade é incentivada, mas depende de como você declara e usa as instâncias.
//• Se a instância for criada como let, ela é imutável por completo: você não pode alterar nenhuma propriedade, mesmo que a propriedade seja var.
//• Se a instância for criada como var, você pode modificar as propriedades — porém, dentro de métodos da própria struct, qualquer método que altere o estado precisa ser marcado como mutating.



struct Contador {
    public private(set) var valor: Int = 0
    
    mutating func incrementar() {// Porque structs são imutáveis por padrão. mutating permite alterar o próprio valor.
        valor += 1
    }
    
    func getValue() -> Int {
        return valor
    }
}


var c = Contador()
//c.valor = 10 // -> Erro setter é privado
print(c.valor)// OK: Leitura permitida
c.incrementar()// Ok: Pode modificar por metodos internos


//MARK: - Desafios

//1️⃣ Classe e Objeto
//Deve criar uma classe representando algo concreto (ex: Pessoa, Carro, Produto).
//A classe define atributos (estado) e métodos (comportamento).
//Ao criar dois objetos, cada um deve possuir estado próprio, provando que objetos são instâncias independentes da mesma classe.

class Pessoa2 {
    var nome: String
    var idade: Int
    
    init(nome: String, idade: Int) {
        self.nome = nome
        self.idade = idade
    }
    
    func apresentar() {
        print("Meu nome é \(nome) e tenho \(idade) anos.")
    }
}

let pessoa4 = Pessoa2(nome: "Merenfeld", idade: 22)// Objeto
let pessoa5 = Pessoa2(nome: "Juliano", idade: 34)// Objeto

print(pessoa4 === pessoa5)// False

pessoa4.apresentar()
pessoa5.apresentar()

//2️⃣ Estado influencia comportamento
//Deve mostrar que o mesmo método produz resultados diferentes dependendo do estado interno do objeto.
//Ex: status ativo/inativo, ligado/desligado.
//Conceito avaliado:
//Comportamento depende de estado → base da POO real.

class Lampada {
    var ligada: Bool = false
    
    func alternar() {
        ligada.toggle()
    }
    
    func status() {
        print(ligada ? "Lâmpada ligada" : "Lâmpada desligada")
    }
}

let lampada = Lampada()
lampada.status()//Lâmpada desligada
lampada.alternar()// alterou de false para true
lampada.status()//Lâmpada ligada


//3️⃣ Ciclo de vida do objeto
//A classe deve exigir dados obrigatórios no momento da criação.
//Não pode existir objeto “incompleto” ou inválido.
//Conceito avaliado:
//Responsabilidade do init, integridade do objeto.

class Usuario {
    let email: String
    
    init(email: String) {
        self.email = email
    }
}

let usuario = Usuario(email: "gabriel@gmail.com")


//4️⃣ Encapsulamento de dados
//Deve impedir acesso direto a atributos sensíveis e controlar alterações por métodos.
//Exemplo clássico: saldo, senha, status.
//Conceito avaliado:
//Encapsulamento ≠ esconder por esconder, mas proteger regras.

//class Conta {
//    private var saldo: Double = 0
//    
//    func consultarSaldo() -> Double {
//        saldo
//    }
//    
//    func depositar(valor: Double) {
//        saldo += valor
//    }
//}
//
//let contaGabriel = Conta()
//print(contaGabriel.consultarSaldo())
//contaGabriel.depositar(valor: 10)

//5️⃣ Controle de regras de negócio
//A própria classe valida suas regras antes de alterar o estado.
//Ex: impedir valores negativos, estados inválidos.
//Conceito avaliado:
//Objeto é responsável por sua consistência.

class Conta {
    private var saldo: Double = 0
    
    func sacar(valor: Double) {
        guard valor <= saldo else {
            print("Saldo insuficiente")
            return
        }
        saldo -= valor
    }
    
    func depositar(valor: Double) {
        saldo += valor
    }
}


//6️⃣ Struct vs Class

struct ProdutoStruct {
    var preco: Double
}

class ProdutoClass {
    var preco: Double
    
    init(preco: Double) {
        self.preco = preco
    }
}

var ps1 = ProdutoStruct(preco: 10)
var ps2 = ps1
ps2.preco = 15

print(ps1.preco)// 10

let pc1 = ProdutoClass(preco: 100)
let pc2 = pc1
pc2.preco = 20

print(pc1.preco)// 20



//8️⃣ Herança e override

class Animal2 {
    func emitirSom() {
        print("Som generico")
    }
}

class Cachorro2: Animal2 {
    
    override func emitirSom() {
        print("Latido")
    }
}


let animal: Animal2 = Cachorro2()
animal.emitirSom()

//-----------------//----------------

class Ave {
    func voar() {
        print("voando")
    }
}

class Pinguim: Ave {
//    Herança ruim: pinguim nao voa
}



class Forma {
    func area() -> Double { 0 }
}

class Quadrado: Forma {
    override func area() -> Double { 25 }
}

class Circulo: Forma {
    override func area() -> Double { 78.9 }
}


//1️⃣2️⃣ Uso polimórfico
//Objetos de tipos diferentes são tratados por um tipo comum (classe base ou protocolo) e respondem corretamente ao método.
//Substituição e polimorfismo real.

let formas: [Forma] = [Quadrado(), Circulo()]

for forma in formas {
    print(forma.area())
}



//MARK: - Inicializadores / Construtores



class Casa {
    
    var numeroDeQuartos: Int
    var localizacao: String
    
//    Inicializador principal que deve configurar todas as propriedades.
    init(numeroDeQuartos: Int, localizacao: String) {
        self.numeroDeQuartos = numeroDeQuartos
        self.localizacao = localizacao
    }
    
    
//convenience init
//Inicializador secundário que fornece valores padrão ou simplifica a criação da instância.
    convenience init() {
        self.init(numeroDeQuartos: 5, localizacao: "São Paulo")
    }
    
    convenience init(numeroDeQuartos: Int) {
        self.init(numeroDeQuartos: numeroDeQuartos, localizacao: "São Paulo")
    }
    
//    Failable Initializer
//    Inicializador que pode falhar e retornar nil SE as condições nao forem atendidas
    init?(numeroDeQuartos: Int, localizacao: String, validaQuarto: Bool) {
        if validaQuarto == false || numeroDeQuartos < 2 {
            return nil
        }
        self.numeroDeQuartos = numeroDeQuartos
        self.localizacao = localizacao
    }
    
//    Exige que todas as subclasses implementem esse inicializador
    required init(localizacao: String) {
        self.localizacao = localizacao
        self.numeroDeQuartos = 10
    }
}

var minhaCasa: Casa = Casa(numeroDeQuartos: 10, localizacao: "Guaruja")
var minhaCasa2: Casa = Casa()
var minhaCasa3: Casa = Casa(numeroDeQuartos: 2)



class CasaDePraia: Casa {
    
    var distanciaDaPraia: Int
    
    init(distanciaDaPraia: Int) {
        self.distanciaDaPraia = distanciaDaPraia
        super.init(numeroDeQuartos: 10, localizacao: "SP")
    }
    
    required init(localizacao: String) {
        self.distanciaDaPraia = 1000
        super.init(localizacao: localizacao)
    }
}

var minhaCasaDePraia: CasaDePraia = CasaDePraia(localizacao: "SP")











