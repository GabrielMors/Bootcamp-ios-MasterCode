//
//  main.swift
//  Estrutura Condicional
//
//  Created by Gabriel Mors Pulga on 22/01/26.
//

import Foundation

//MARK: ESTRUTURAS CONDICIONAIS

// if -> Significa "SE"
// Tudo oque está na frente do "if" significa que está realizando uma validação para verificar se é VERDADEIRO OU FALSO
// O sinal para comparar a igualdade no swift é ==
// else -> se não (caso falso)


let valoresIguais: Bool = 1 + 1 == 2
//print(valoresIguais)

if valoresIguais {
    //    Se cair no primeiro bloco de código siginifica que a condição é VERDADEIRA
    
} else {
    //    Se cair no else significa que a condição é FALSA
    print("Valor está incorreto")
}


func validaMaiorDeIdade(idade: Int) {
    if idade >= 18 {
        print("Usuario é maior de idade")
    } else {
        print("Usuario é menor de idade")
    }
}

//validaMaiorDeIdade(idade: 17)


// se caso o valor total for maior que 1000, então imprima uma mensagem dizendo que ele "tem desconto", caso contrario imprima uma mensagem dizendo "sem desconto"
// se caso o valor informado NÃO SEJA UM NUMERO quero que imprima a mensagem "informe um valor númerico"


//func validaDesconto(valorTotal: String) {
//    let valorDouble: Double = Double(valorTotal) ?? 0
//
//    if valorDouble > 1000.0 {
//        print("Tem desconto")
//    } else {
//        print("Sem desconto")
//    }
//}
//
//validaDesconto(valorTotal: "100")


// IF LET -> utilizamos quando queremos REMOVER A OPCIONALIDADE DAQUELA DEVIDA VARIAVEL/CONSTRANTE

func validaDesconto(valorTotal: String) {
    
    if let valorDouble: Double = Double(valorTotal) {
        if valorDouble > 1000.0 {
            print("Tem desconto")
        } else {
            print("Sem desconto")
        }
    } else {
        print("informe um valor númerico")
    }
}

//validaDesconto(valorTotal: "100a")




// VALIDAÇÕES COMPOSTAS

// && -> E -> TODAS as validações tem que ser VERDADEIRAS
// || -> OU -> SE uma das validações forem verdadeiras ele retorna VERDADEIRA caso contrario FALSO


// Crie um metodo para validar se o usuario pode comprar um carro ou não. Para que ele possa comprar um carro ele deve conter a carteira de motorista E ter no minimo 10000 mil reais, caso contrário, não pode comprar o carro.

func comprarCarro(carteiraDeMotorista: Bool, valorTotal: Double) {
    
    if carteiraDeMotorista && valorTotal >= 10000 {
        print("Pode comprar o carro!!!")
    } else {
        print("Não ode comprar o carro!!!")
    }
}

//comprarCarro(carteiraDeMotorista: true, valorTotal: 10000)



// Se o usuario gastou mais de 1000 reais OU ele tem o cartão fidelidade então ele tem desconto, caso contrario, sem desconto

func descontoLoja(gasto: Double, cartaoFedelidade: Bool) -> Bool {
    if gasto > 1000 || cartaoFedelidade {
        return true
    } else {
        return false
    }
}

let temDesconto = descontoLoja(gasto: 5000, cartaoFedelidade: false)
//print(temDesconto)




// guard let -> Muito semelhante ao if let, porem o guard let ele mata o metodo -> tem o intuido de REMOVER A OPCIONALIDADE
// OBS: sempre que for utilizar o guard let, você precisa ao final da validação informar o else { return },
// Caso você esteja utilizando o guard let dentro de um metodo de retorno, você necessita retornar a sua respectiva tipagem!!!!


func validaDescontoGuardLet(valorTotal: String) -> Void {
    
    guard let valorDouble: Double = Double(valorTotal) else {
        print("Informe um valor numerico")
        return
    }
    
    if valorDouble > 1000.0 {
        print("Tem desconto")
    } else {
        print("Sem desconto")
    }
}

//validaDescontoGuardLet(valorTotal: "100")




//MARK: if ternário
// Para criar o ternario vamos divir em 5 partes
// 1 parte deve conter uma validação(Bool) Ex: 1 + 1 == 2
// 2 parte você deve informar o ? Ex: 1 + 1 == 2 ?
// 3 parte você deve informar oque você quer em caso VERDADEIRO Ex: 1 + 1 == 2 ? print("Soma dos valores corretos")
// 4 parte você deve informar os : Ex: 1 + 1 == 2 ? print("Soma dos valores corretos") :
// 5 parte você deve informar oque você quer em caso FALSO Ex: 1 + 1 == 2 ? print("Soma dos valores corretos") : print("Soma dos valores incorretos")


func motorLigado(ligado: Bool) {
//    if ligado {
//        print("O motor esta ligado")
//    } else {
//        print("O motor não esta ligado")
//    }
    
    ligado == true ? print("O motor esta ligado") : print("O motor não esta ligado")
}

//motorLigado(ligado: true)




//Crie uma função que calcule a tarifa de uma corrida de táxi. A função deve receber a distância da viagem em quilômetros (tipo Double) e retornar o custo total (tipo Double). O custo é calculado da seguinte forma:

//Uma taxa fixa de base de R$ 4,00 é cobrada para qualquer corrida.
//Para distâncias até 5 km, são cobrados R$ 1,50 por quilômetro.
//Para distâncias entre 5 km e 10 km, o custo é de R$ 2,00 por quilômetro.
//Para distâncias acima de 10 km, o custo é de R$ 2,50 por quilômetro.



func calcularTarifaTaxi(distancia: Double) -> Double {
    let taxaFixa: Double = 4.0
    
    if distancia <= 0 {
        return 0
    } else if distancia <= 5 {
        return taxaFixa + (distancia * 1.5)
    } else if distancia <= 10 {
        return taxaFixa + (distancia * 2.0)
    } else {
        return taxaFixa + (distancia * 2.5)
    }
}

let valorTotalTaxi = calcularTarifaTaxi(distancia: 5)
print("O valor total é de: R$ \(valorTotalTaxi) reais")



//MARK: Exercicio alunos


//1- Crie uma função que receba dois parâmetros (nota1: Double, nota2: Double) e retorne "Aluno aprovado” se a media das notas for maior ou igual a 7. Caso contrário retorne "Aluno reprovado"


//2- Crie uma função "desconto" que receba um parâmetro (total: Double). Caso o total (parâmetro) seja menor que 100.0, dê 10% de desconto. Caso o valor esteja entre 100.0 e 200.0 dê 15% de desconto. Valores acima de 200.0 dê 20% de desconto. A função tem que ter um retorno do tipo Double que vai ser o total (parâmetro) com o desconto aplicado de acordo com as condições citadas.
// Dica: return total * 0.9 (isso significa o valor com 10% de desconto)


//3- Crie uma função semáforo que receba uma parâmetro do tipo string. Se o valor recebido no parâmetro for vermelho, retorne "PARE", se for amarelo, retorne "ATENÇÃO", se for verde, retorne "SIGA EM FRENTE", se não, retorne "PARÂMETRO INVÁLIDO" caso o valor recebido seja diferente dos já citados.



//4- Crie uma função que receba dois parâmetros (eFimDeSemana: Bool, tenhoDinheiro: Bool) e caso
//seja final de semana e você tenha dinheiro, print "VAMOS PASSEAR", caso contrário, print "VAMOS FICAR EM CASA"



//5- Crie uma função que receba dois parâmetros do tipo Double e caso o valor do 1° parâmetro seja maior que o valor do 2° parâmetro. Retorne "Bola", caso contrário, retorne "Banana"


//6- Crie uma função que receba um parâmetro (foiConvidado: Bool). Caso o valor seja true, print "Liberado para a festa" Caso contrário, print "Infelizmente você não foi convidado"


//7 - Implemente uma função que receba a idade de uma pessoa e determine se ela tem direito a entrada gratuita em um evento. Entrada gratuita é concedida para pessoas com menos de 5 anos ou mais de 65 anos.


//8 - Crie uma função que receba um score de crédito (tipo Int) de 0 a 1000 e retorne se a pessoa tem um "Bom crédito" (score acima de 700), "Crédito regular" (score entre 300 e 700) ou "Mau crédito" (abaixo de 300).



//9 - Implemente uma função que receba um dia da semana (tipo String) e retorne "Dia útil" se for de segunda a sexta, e "Final de semana" se for sábado ou domingo.


//10 - Desenvolva uma função que receba uma senha (tipo String) e retorne "Senha fraca" se tiver menos de 6 caracteres, "Senha média" se tiver entre 6 e 8 caracteres, e "Senha forte" se tiver mais de 8 caracteres.
// Dica: Para descobrir a quantidade de caracteres de uma string, basta utilizar a propriedade .count
// var nome: String = "caio"
// print(nome.count) -> vai printar a quantidade de caracteres


//11 - Crie uma função que receba a altura de uma pessoa em metros (tipo Double) e retorne "Baixa" se for menor que 1.60 metros, "Média" se for entre 1.60 e 1.85 metros, e "Alta" se for maior que 1.85 metros.


//12 - Crie uma função que receba a idade de uma pessoa (tipo Int) e o tempo de serviço em anos (tipo Int). Uma pessoa é elegível para promoção se tiver mais de 30 anos e mais de 5 anos de serviço. A função deve retornar "Promoção Elegível" se ambas as condições forem verdadeiras, e "Promoção Não Elegível" caso contrário.


//13 - Implemente uma função que receba a previsão de chuva (tipo Bool) e a temperatura (tipo Double). O evento ao ar livre deve ser cancelado se chover (true) ou se a temperatura for inferior a 15 graus. A função deve retornar "Evento Cancelado" se alguma das condições for verdadeira, e "Evento Confirmado" caso contrário.


//14 - Desenvolva uma função que receba uma senha (tipo String) e a hora do dia (tipo Int, representando a hora). O acesso é permitido se a senha for "1234" e for entre as 9h e as 17h. A função deve retornar "Acesso Permitido" se ambas as condições forem verdadeiras, e "Acesso Negado" se qualquer uma das condições não for atendida.
















