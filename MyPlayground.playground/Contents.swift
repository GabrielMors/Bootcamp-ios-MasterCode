import UIKit

//O que é uma variável?

// Uma variável é um espaço reservado na memória do computador.
// Ela é utilizada para armazenar valores que podem ser alterados
// durante a execução do programa.

//Exemplo:
//Imagine que você está anotando quanto dinheiro tem na carteira.
//    •    No início do dia: R$ 50
//    •    Depois do almoço: R$ 35
//    •    No fim do dia: R$ 20
//
//O valor muda, mas a “carteira” continua sendo a mesma.
//Essa carteira é a variável, e o dinheiro dentro é o valor que pode ser alterado.

var myName = "Gabriel"
print(myName)

myName = "Gustavo"
print(myName)

myName = "Marcello"
myName = "Caio"

print(myName)
print(myName)


//  Constante => let
//  Aconselho sempre utilizar let. Caso precise alterar, o compilador vai te avisar, e é só você pressionar um fix.

let myLastName = "Mors"
print(myLastName)
//myLastName = "1232345"



//-----DICAS-----
// Uma variável ou constante NÃO pode ter o mesmo nome de outra já existente no mesmo escopo.
// Os nomes devem ser únicos para evitar conflitos no código.
// Utilizamos o padrão de nomenclatura chamado camelCase.
// Nesse padrão, a primeira letra é sempre minúscula e cada nova palavra começa com letra maiúscula,
// sem espaços entre elas.
// Exemplos: minhaVariavel, valorTotal, calcularIdadeUsuario.
// Nunca utilize caracteres especiais, acentos ou espaços nos nomes.


//MARK: Tipo de dados

// String -> Tipo texto "Gabriel"
// Double -> Cotem MAIS casa decimais 10.409380942534045
// Float -> Cotem MENOS casa decimais 10.4093
// Int -> Numero inteiro 10
// Bool -> True or false

// Tipagem - TODAS SE INICIAM COM A PRIMEIRA LETRA MAIUSCULA

// Implicita
// É quando criamos uma variavel e não deixamos em evidencia sua respectiva TIPAGEM

// Explicita
// É quando criamos uma variavel e deixamos em evidencia sua respectiva TIPAGEM


var double: Double = 10.409380942534045
print(double)

var float: Float = 10.409380942534045
print(float)

var inteiro: Int = 10
print(inteiro)

var string: String = "Hello, World!"
print(string)

var bool: Bool = false
print(bool)


// MARK: - Concatenação | Interpolação

var nomeUsuario: String = "Gabriel"
var periodo: String = "Bom dia"
var empresa: String = "MasterCode Academy"

// Concatenação
var mensagemConcat: String = periodo + ", " + nomeUsuario + "! " + "Bem-vindo a " + empresa + "."

print(mensagemConcat)

// Interpolação
// Forma mais simples e legível
var mensagemInterp: String = "\(periodo), \(nomeUsuario)! Bem-vindo a \(empresa)."

print(mensagemInterp)


// MARK: - Conversão de Tipos

// COALECÊNCIA --> ??

// Exemplo 1: Cadastro de usuário (idade vindo de um TextField)
var idadeDigitada: String = "18"
var idadeUsuario: Int = Int(idadeDigitada) ?? 0
print("Idade do usuário: \(idadeUsuario)")

// Exemplo 2: Preço de produto vindo da API (Double → Int)
var precoProduto: Double = 49.90
var precoSemCentavos: Int = Int(precoProduto)
print("Preço sem centavos: \(precoSemCentavos)")

// Exemplo 3: Quantidade de itens no carrinho (String → Int)
var quantidadeTexto: String = "3"
var quantidadeItens: Int = Int(quantidadeTexto) ?? 0
print("Quantidade de itens: \(quantidadeItens)")

// Exemplo 4: Nota do aluno digitada no app
var notaDigitada: String = "9.5"
var notaAluno: Double = Double(notaDigitada) ?? 0.0
print("Nota do aluno: \(notaAluno)")


//MARK: Operadores lógicos

var salario: Int = 3000
var aluguel: Int = 1200
var supermercado: Int = 600
var transporte: Int = 300

// Cálculo do total de despesas
var totalDespesas: Int = aluguel + supermercado + transporte
print("Total de despesas: \(totalDespesas)")

// Cálculo do dinheiro restante
var dinheiroRestante: Int = salario - totalDespesas
print("Dinheiro restante: \(dinheiroRestante)")

// Planejamento de economia
var metaEconomia: Int = 500
var mesesParaEconomizar: Int = dinheiroRestante / metaEconomia
print("Meses necessários para atingir a meta: \(mesesParaEconomizar)")

// Quanto vai gastar em 12 meses
var gastoAnual: Int = totalDespesas * 12
print("Gasto anual: \(gastoAnual)")


//MARK: Opcional
var opcional: Int? = nil
print(opcional ?? 0)

// nil -> NULO, ou seja, não existe valor


// Atalhos de teclado:
// Duplicar Linha de codigo: CMD + D
// Selecionar mais de um local ao mesmo tempo: Control + Shift
// Rodar o buid: CMR + R
// Como comentar rapido uma linha: CMD + /
// Como comentar rapido varias linha: Selecione tudo oque você quer comentar e pressione -> CMD + /
// Como pesquisar de forma rapida: CMD + F ele vai abrir a busca, com isso você pode colar o nome da variavel e pressione o return, que ele vai procurar em todo local do seu codigo onde está sendo chamado



// MARK: - Exercicios


// MARK: Exercício 1: Formatação de Strings
// Declare uma variável produto do tipo String e atribua a ela o valor "Notebook". Declare outra variável preco do tipo Double e atribua a ela o valor 3999.99. Formate e imprima uma frase que diga "O produto Notebook custa R$ 3999.99".

var produto: String = "Notebook"
var preco: Double = 3999.99

print("O produto \(produto) custa R$ \(preco)")


// MARK: Exercício 2: Média de Três Números
// Declare três variáveis com números inteiros. Calcule e imprima a média desses números.
// print("Média dos três números: \(variavel)")

var numero1: Int = 10
var numero2: Int = 20
var numero3: Int = 30

var media = (numero1 + numero2 + numero3) / 3
print("Média dos três números: \(media)")


// MARK: Exercício 3: Concatenação de Strings
// Declare duas variáveis de tipo String para o nome e sobrenome de uma pessoa. Concatene as duas strings em uma terceira variável e imprima o nome completo no console.
// print("Nome completo: \(variavel)")

var nomeConcatenacao: String = "Gabriel"
var sobreNomeConcatenacao: String = "Mors"
var nomeCompleto: String = nomeConcatenacao + " " + sobreNomeConcatenacao
print(nomeCompleto)

// MARK: Exercício 4: Conversão de Tipagem
// Declare uma variável idadeString com o valor "25". Converta essa string para um valor do tipo Int. Em seguida, declare uma variável alturaString com o valor "1.75" e converta-a para um valor do tipo Double. Imprima ambos os valores convertidos.
// print("Idade: \(variavel)")
// print("Altura: \(variavel)")

var idadeStringExercicio: String = "25"
var idadeIntExercicio: Int = Int(idadeStringExercicio) ?? 0
print("Idade: \(idadeIntExercicio)")

var alturaString = "1.75"
var alturaDouble: Double = Double(alturaString) ?? 0
print(alturaDouble)


// MARK: Exercício 5: Operações Aritméticas
// Declare duas variáveis do tipo Float, numeroA e numeroB, com valores de sua escolha. Calcule e imprima a soma, subtração, multiplicação e divisão desses valores.
//print("Soma: \(variavel)")
//print("Subtração: \(variavel)")
//print("Multiplicação: \(variavel)")
//print("Divisão: \(variavel)")

var numeroA: Float = 10
var numeroB: Float = 10

var somaExercicio: Float = numeroA + numeroB
var subtracaoExercicio: Float = numeroA - numeroB
var multiplicacaoExercicio: Float = numeroA * numeroB
var divisaoExercicio: Float = numeroA / numeroB

print("Soma: \(somaExercicio)")
print("Subtração: \(subtracaoExercicio)")
print("Multiplicação: \(multiplicacaoExercicio)")
print("Divisão: \(divisaoExercicio)")

// MARK: Exercício 6: Conversão de Tipagem de Float para Int
// Declare uma variável pesoFloat do tipo Float e atribua a ela o valor 70.5. Converta essa variável para o tipo Int e imprima o valor convertido.
//print("Peso como Int: \(variavel)")

let pesoFloat: Float = 70.5
let pesoInt: Int = Int(pesoFloat)
print("Peso como Int: \(pesoInt)")

// MARK: Exercício 7: Divisão de Conta
// Declare uma variável totalConta do tipo Double com o valor da conta de um restaurante. Declare uma variável numeroDePessoas do tipo Int com o número de pessoas que dividirão a conta. Calcule e imprima quanto cada pessoa deve pagar.
//print("Cada pessoa deve pagar: R$ \(variavel)")

let totalConta: Double = 500.50
let numeroDePessoas: Int = 5
let valorPorPessoa: Double = totalConta / Double(numeroDePessoas)
print("Cada pessoa deve pagar: R$ \(valorPorPessoa)")

// MARK: Exercício 8: Calculadora de IMC
// Declare variáveis peso e altura do tipo Double. Calcule e imprima o Índice de Massa Corporal (IMC) usando a fórmula: IMC = peso / (altura * altura).
//print("O IMC é: \(variavel)")

let peso: Double = 80
let altura: Double = 1.79
let imc = peso / (altura * altura)
print("O IMC é: \(imc)")

// MARK: Exercício 9: Segundos em um Ano
// Calcule e imprima o número de segundos em um ano (considere um ano com 365 dias).
//print("Número de segundos em um ano: \(variavel)")

let dias = 365
let horasPorDia = 24
let minutosPorHora = 60
let segundosPorMinuto = 60
let totalSegundos = dias * horasPorDia * minutosPorHora * segundosPorMinuto

print("Número de segundos em um ano: \(totalSegundos)")


// MARK: Exercício 10: Comparação de Números
// Declare duas variáveis primeiroNumero e segundoNumero do tipo Int. Verifique se numero1 é maior que numero2 e imprima o resultado.
// print("O primeiro número é maior que o segundo: \(variavel)")

let primeiroNumero: Int = 10
let segundoNumero: Int = 10
let primeiroMaiorQueSegundo: Bool = primeiroNumero > segundoNumero

 print("O primeiro número é maior que o segundo: \(primeiroMaiorQueSegundo)")
