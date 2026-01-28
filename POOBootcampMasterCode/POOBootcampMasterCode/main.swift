//
//  main.swift
//  POOBootcampMasterCode
//
//  Created by Caio Fabrini on 26/01/26.
//

import Foundation

// POO -> Programação orientada a objeto

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
//🎯 O que precisa ser feito
//Crie uma classe Cofre
//O valor armazenado deve ser private
//Crie métodos para:
//Depositar valor
//Sacar valor
//O saque só pode acontecer se houver saldo suficiente
//Crie um método para consultar o saldo

//⚠️ Regras
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
