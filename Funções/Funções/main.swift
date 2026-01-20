//
//  main.swift
//  Funções
//
//  Created by Gabriel Mors Pulga on 15/01/26.
//

import Foundation

// MARK: - Funções / Métodos

// Uma função é um bloco de código que executa algo e que pode ser reutilizavel quando quiser.
// Uma função executa tudo aquilo que está dentro do bloco de codigo (entre as chaves { } )
// Uma função tem 4 tipos
// Função sem parametro e sem retorno
// Função com parametro e sem retorno
// Função sem parametro e com retorno
// Função com parametro e com retorno

// Como criar uma função:
// Informe a palavra reservada func e na sequencia informe o nome da função (o nome da função é uma das parte mais importantes da função, pois ela tem que deixar claro exatamente oque ela vai executar).
// Abra e feche os parenteses, caso tenha parametros os informe, caso constrario não.
// ->
// Abra e feche as chaves

// "" aspas
// () parênteses
// {} Chaves
// [] Colchetes


// Funções Simples
// Funções sem parametro e sem retorno


func sayHello() {
    print("Hello World!")
}

sayHello()


func abrirJanela() {
    let janela: String = "A janela foi aberta"
    print(janela)
}

abrirJanela()


// Funções com parametro


func soma(valor1: Int, valor2: Int) {
    let resultado: Int = valor1 + valor2
    print("O resultado é: \(resultado)")
}

soma(valor1: 10, valor2: 10)

func exibirSoma() {
    soma(valor1: 10, valor2: 10)
    soma(valor1: 100, valor2: 130)
    soma(valor1: 102, valor2: 120)
    soma(valor1: 105, valor2: 101)
}

exibirSoma()


func nomeIdade(nome: String, idade: Int) {
    print("Meu nome é \(nome) e tenho \(idade) anos")
}

nomeIdade(nome: "Wallace", idade: 37)


func tester(valor1: Int, valor2: Double) {
    var total = valor1 + Int(valor2)
    print("Minha resposta é: \(total)")
}

tester(valor1: 10, valor2: 10.5)


// Rotulos de parâmetros
// sem _
// minhaIdade(idade: 22)
// com _
// minhaIdade(22)
//Usado quando o significado já é óbvio.

func minhaIdade(_ idade: Int) {
    print("Minhas Idade é: \(idade)")
}

minhaIdade(25)

//passando algo que será usado pela função
func login(with email: String) {
    print("login com email: \(email)")
}

login(with: "gabriel@mastercode.com")


//Usado para indicar destino.
func navigato(to screen: String) {
    print("navegando para \(screen)")
}

navigato(to: "HomeScreen")


//MARK: Função com retorno


func meuNome() -> String {
    return "Gabriel"
}


func nome() -> Void {
    // Lógica
}


//MARK: Função com parametro e com retorno

func somaRetorno(valor1: Int, valor2: Int) -> Int {
    let resultado: Int = valor1 + valor2
    print("O resultado é: \(resultado)")
    return resultado
}

var soma: Int = somaRetorno(valor1: 10, valor2: 10)


func idade(anoNascimento: Int = 2000, anoAtual: Int) -> Int {
    let minhaIdade: Int = anoAtual - anoNascimento
    return minhaIdade
}

var minhaIdade = idade(anoNascimento: 2004, anoAtual: 2026)




//MARK: Exercicios
//Criar função onde ela mostre na area de debug a frase: "Olá mundo, estou aprendendo a criar minhas primeiras funções".

//criar função com nome soma que tenha 3 parametros (valor1: Int, valor2: Double, valor3: Int) e que ela faça uma soma entre os valores e retorno sobre valor total.

// crie uma funcao com um parametro e com o tipo de retorno diferente do parametro

// Crie uma função que receba uma idade e retorne true se for maior de idade.

//Crie uma função que receba um valor e imprima:
//O valor informado foi X

//Crie uma função que receba um número e imprima o dobro dele.

//Crie uma função que receba um nome.

//Se nenhum nome for passado, imprima:

//Crie uma função que receba nome, idade e cidade e imprima tudo em uma frase.

//Crie uma função que receba um valor e retorne o valor com 10% de desconto.

//Crie uma função que receba uma nota e retorne:
//    •    "Aprovado" ou
//    •    "Reprovado"


