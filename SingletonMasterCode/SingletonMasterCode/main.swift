//
//  main.swift
//  SingletonMasterCode
//
//  Created by Caio Fabrini on 28/03/26.
//

import Foundation

// ============================================================
// MARK: - 1. O que é um Design Pattern?
// ============================================================
//
// Design Pattern (Padrão de Projeto) é uma solução reutilizável
// para um problema comum que aparece no desenvolvimento de software.
//
// Ele NÃO é um código pronto.
// Ele é uma "ideia de solução", um modelo que você adapta ao seu projeto.
//
// Exemplo:
// "Preciso garantir que exista apenas um objeto de configuração
// do app inteiro."
//
// Para esse tipo de problema, existe um padrão chamado Singleton.
//
// Alguns grupos de padrões:
//
// 1. Criacionais
//    - relacionados à criação de objetos
//    - exemplos: Singleton, Factory
//
// 2. Estruturais
//    - relacionados à organização entre classes/objetos
//    - exemplos: Adapter, Composite
//
// 3. Comportamentais
//    - relacionados à comunicação e comportamento
//    - exemplos: Strategy, Observer, Command
//
// Neste material, vamos focar apenas no padrão Singleton.


// ============================================================
// MARK: - 2. O que é Singleton?
// ============================================================
//
// Singleton é um padrão de projeto que garante:
//
// 1. Que uma classe tenha apenas UMA instância
// 2. Que exista um ponto global de acesso para essa instância
//
// Em outras palavras:
//
// Ao invés de criar vários objetos da mesma classe,
// o sistema utiliza sempre o mesmo objeto compartilhado.
//
// Exemplo de ideia:
//
// Exemplo de cenário de instância única:
// let logger1: Logger = Logger()
// let logger2: Logger = Logger()
//
// Nesse caso, temos DOIS objetos diferentes.
//
// Com Singleton:
// Logger.shared
//
// Nesse caso, todas as partes do app usam a MESMA instância.
//
// Isso é útil quando queremos centralizar:
// - logs
// - sessão do usuário
// - configurações do app
// - gerenciadores compartilhados
// - cache
// - remote config
// - etc.


// ============================================================
// MARK: - 3. Estrutura mais comum de um Singleton
// ============================================================
//
// Estrutura clássica:
//
// final class NomeDaClasse {
//     static let shared = NomeDaClasse()
//     private init() { }
// }
//
// Agora vamos entender CADA parte disso.
//

final class BasicSingletonExample {
  // static:
  // Pertence a propria classe, e não a uma instancia especifica

  // let:
  // Estamos dizendo que essa referencia NÃO PODERÁ SER TROCADA!!!!
  // Ou seja, uma vez criado, ela continua sendo a mesma. Ela é uma constante, ou seja, ela é IMUTÁVEL.

  // shared:
  // é o nome mais comum usar para representar a instancia compartilhada
  static let shared: BasicSingletonExample = BasicSingletonExample()

  // private init():
  // Impede que outras partes do codigo criem novas instancias.
  // Sem isso, alguem poderia vir e fazer:
  // let anotherObject = BasicSingletonExample()
  private init() { }

  func showMessage() {
    print("Minha primeira classe singleton :) ")
  }

}

BasicSingletonExample.shared.showMessage()


// ============================================================
// MARK: - 4. Entendendo o problema que o Singleton resolve
// ============================================================
//
// Imagine que queremos registrar logs do sistema.
// Se várias partes do app criam vários objetos Logger,
// perdemos a ideia de centralização.
//
// Exemplo sem Singleton:
final class LoggerWithoutSingleton {
  func log(_ message: String) {
    print("[Logger] \(message)")
  }
}

let logger1 = LoggerWithoutSingleton()
logger1.log("Opa, sou o logger 1")

let logger2 = LoggerWithoutSingleton()
logger2.log("Opa, sou o logger 2")

// Aqui temos dois objetos diferente.
// Em muitos cenários isso não é viável, pois ele passa de uma classe simples, a um grande problema.
// Seria muito mais simples ter 1 instancia do que tantas outras que podem ser geradas sem a necessidade

// Exemplo com singleton:
final class LoggerWithSingleton {
  static let shared = LoggerWithSingleton()
  private init() {}

  func log(_ message: String) {
    print("[Logger] \(message)")
  }
}

let logger3 = LoggerWithSingleton.shared
logger3.log("Opa, sou o logger 3")

let logger4 = LoggerWithSingleton.shared
logger4.log("Opa, sou o logger 4")

// Nesse caso, estamos UTILIZANDO a mesma INSTANCIA!!
// Vantagens: Utilizar a mesma instancia, fácil acesso, estado compartilhado globalmente, principio de responsabilidade única!!!!

// ============================================================
// MARK: - 5. Por que usamos private init()?
// ============================================================
//
// O private init() é uma das partes mais importantes do Singleton.
//
// Sem ele, ainda seria possível criar novos objetos.

final class WrongSingletonExample {
  static let shared = WrongSingletonExample()

  // ...se o init NÃO FOR PRIVADO, ainda conseguimos criar novas instancias!!!!
  init() { }

  // Sendo assim, temos 2 FORMAS de utilizar essa nossa estrutura
  // 1 - Com shared
  // 2 - Gerando uma nova instancia -> let teste = WrongSingletonExample()
}

// criando um NOVO - que vai iniciar e morrer dentro da estrutura que ele estiver
// EX: Tela de login vai ter essa variavel, com isso, quando a tela for DESALOCADA da memória, seu wrongSingleton morre com ela!
var wrongSingleton = WrongSingletonExample()


// usando o compartilhado! Só morre com o APP!!!
var wrongSharedSingleton = WrongSingletonExample.shared


// ============================================================
// MARK: - 6. Exemplo prático: Sessão do usuário
// ============================================================
//
// Esse é um exemplo muito didático.
//
// Imagine que o usuário fez login.
// Queremos que outras partes do app consigam acessar
// as informações do usuário logado sem ficar recriando objetos.

final class UserSession {
  static let shared = UserSession()

  private init() { }

  var userName: String?
  var email: String?
}

final class LoginService {
  func login() {
    UserSession.shared.userName = "Fulano"
    UserSession.shared.email = "fulano@email.com"
  }
}

var loginService = LoginService()
loginService.login()

final class ProfileViewControllerFake {
  func showUserData() {
    let name = UserSession.shared.userName ?? ""
    let email = UserSession.shared.email ?? ""

    print("O nome é: \(name)")
    print("O email é: \(email)")
  }
}

final class HomeViewControllerFake {
  func showUserData() {
    let name = UserSession.shared.userName ?? ""
    let email = UserSession.shared.email ?? ""

    print("O nome é: \(name)")
    print("O email é: \(email)")
  }
}

final class PersonControllerFake {
  func showUserData() {
    let name = UserSession.shared.userName ?? ""
    let email = UserSession.shared.email ?? ""

    print("O nome é: \(name)")
    print("O email é: \(email)")
  }
}

var profileFake = ProfileViewControllerFake()
profileFake.showUserData()

var homeFake = HomeViewControllerFake()
homeFake.showUserData()

var personFake = PersonControllerFake()
personFake.showUserData()


//MARK: - Como posso provar que é a mesma instancia?

let instance1 = UserSession.shared
let instance2 = UserSession.shared

print("Sou a mesma instancia? \(instance1 === instance2)")


// ============================================================
// MARK: - 7. Vantagens do Singleton
// ============================================================
//
// 1. Instância única
//    - evita várias criações desnecessárias do mesmo objeto
//
// 2. Compartilhamento de estado
//    - várias partes do app acessam a mesma informação
//
// 3. Ponto central de acesso
//    - facilita encontrar onde aquele recurso está
//
// 4. Bom para gerenciadores globais
//    - logger
//    - sessão
//    - cache
//    - analytics
//    - remote config

// ============================================================
// MARK: - 8. Cuidados com Singleton
// ============================================================
//
// Singleton NÃO é perfeito.
//
// Se usado demais, pode gerar problemas.
//
// Principais cuidados:
//
// 1. Estado global
//    - qualquer parte do sistema pode alterar os dados
//    - isso pode dificultar prever o comportamento do app
//
// 2. Dificuldade em testes
//    - como a instância é compartilhada,
//      ela pode carregar estados de testes anteriores
//
// 3. Acoplamento excessivo
//    - muitas classes passam a depender diretamente do Singleton
//
// 4. Violação de responsabilidade
//    - se você começar a colocar muitas funções dentro dele,
//      ele vira uma classe "faz tudo"


// ============================================================
// MARK: - 9. Quando faz sentido usar Singleton?
// ============================================================
//
// Faz sentido quando você REALMENTE precisa de:
//
// - uma única instância
// - estado compartilhado
// - acesso centralizado
//
// Bons exemplos:
// - Logger
// - UserSession
// - CacheManager
// - RemoteConfigManager
// - AnalyticsManager
//
// Quando evitar:
// - quando o objeto não precisa ser único
// - quando a dependência poderia ser injetada
// - quando o uso vai gerar estado global descontrolado
//
// Regra prática:
// "Eu realmente preciso que exista UMA única instância disso no app inteiro?"
//
// Se sim, talvez Singleton faça sentido.
// Se não, talvez uma instância comum seja melhor.

// ============================================================
// MARK: - 10. Singleton com class
// ============================================================
//
// Singleton normalmente é feito com class.
//
// Motivo:
// class é Reference Type.
// Ou seja, várias variáveis podem apontar para o MESMO objeto.
//
// Isso combina perfeitamente com a ideia do Singleton.

// ============================================================
// MARK: - 11. Singleton com struct
// ============================================================
//
// Tecnicamente, você consegue montar algo parecido com Singleton
// usando struct, mas existe um detalhe MUITO importante:
//
// struct é Value Type.
//
// Isso significa que, quando você copia,
// você cria outra cópia dos dados.
//
// Isso já entra em conflito com a ideia de "uma instância única"
// sendo compartilhada por referência.

struct StructSingleton {
  static var shared = StructSingleton()
  private init() { }

  var state: Int = 10
}

func testStructSingleton() {
  print("Valor inicial da struct: \(StructSingleton.shared.state)")

  StructSingleton.shared.state = 50

  var copy = StructSingleton.shared
  copy.state = 20

  print("Valor final em StructSingleton.shared: \(StructSingleton.shared.state)")
  print("Valor final em copy: \(copy.state)")
}

testStructSingleton()

// Repare:
//
// StructSingleton.shared.state virou 50
// Mas depois criamos:
// var copy = StructSingleton.shared
//
// Nesse momento, copy recebe uma CÓPIA dos dados.
//
// Quando fazemos:
// copy.state = 20
//
// Alteramos apenas a cópia.
// Não alteramos a instância que estava em shared.
//
// Por isso, na prática, Singleton normalmente é feito com class,
// e não com struct.

// ============================================================
// MARK: - 12. Resumo: class vs struct no Singleton
// ============================================================
//
// CLASS
// - Reference Type
// - Compartilha a mesma referência
// - Combina com a ideia de instância única
//
// STRUCT
// - Value Type
// - Ao copiar, gera uma nova cópia dos valores
// - Não combina tão bem com a proposta de Singleton
//
// Por isso:
// Na prática, o mais comum e recomendado é usar class.

// ============================================================
// MARK: - 13. Diferença entre static let e static var
// ============================================================
//
// Esse ponto é MUITO importante.
//
// static let shared
// - cria uma instância fixa
// - você NÃO pode substituir a instância depois
// - é a forma mais segura e mais comum para Singleton
//
// static var shared
// - permite substituir a instância inteira depois
// - isso pode ser perigoso
// - pode apagar estado anterior sem querer

// ============================================================
// MARK: - 14. Resumo geral sobre let/var e class/struct
// ============================================================
//
// 1. class + static let
//    - forma mais comum e recomendada
//    - não troca a instância
//    - pode alterar propriedades internas
//
// 2. class + static var
//    - permite trocar a instância inteira
//    - perigoso para Singleton
//    - automaticamente, você precisa remover o private init
//
// 3. struct + static var
//    - permite alterar shared
//    - mas cópias geram valores independentes
//
// 4. struct + static let
//    - tudo fica imutável
//    - não é útil para um Singleton mutável
//
// Conclusão prática:
// Para Singleton real, normalmente usamos:
//
// final class MinhaClasse {
//     static let shared = MinhaClasse()
//     private init() { }
// }

// ============================================================
// MARK: - 15. Exemplo de problema com estado global
// ============================================================
//
// Aqui está um cuidado importante.
// Como tudo usa a mesma instância, qualquer lugar pode alterar o estado.

final class CounterManager {
  static let shared = CounterManager()
  private init() { }

  var count: Int = 0
}

func screenA() {
  CounterManager.shared.count += 1
  print("ScreenA count: \(CounterManager.shared.count)")
}

func screenB() {
  CounterManager.shared.count += 10
  print("ScreenB count: \(CounterManager.shared.count)")
}

screenA()
screenB()
screenA()

// Isso pode ser útil.
// Mas também pode gerar confusão,
// porque várias partes do sistema mexem no mesmo estado de FORMA INDEPENDENTE

// ============================================================
// MARK: - 16. Estrutura recomendada de Singleton
// ============================================================

final class BestPracticeSingleton {
  static let shared = BestPracticeSingleton()
  private init() { }
  private var value: String = "Valor inicial"

  func updateValue(_ newValue: String) {
    value = newValue
  }

  var getValue: String {
    return value
  }
}

print("Antes: \(BestPracticeSingleton.shared.getValue)")
BestPracticeSingleton.shared.updateValue("Novo valor")
print("Depois: \(BestPracticeSingleton.shared.getValue)")

// ============================================================
// MARK: - 17. Resumo final
// ============================================================
//
// Singleton é um padrão que:
//
// - garante uma única instância
// - oferece acesso global a essa instância
//
// Estrutura mais comum:
//
// final class NomeDaClasse {
//     static let shared = NomeDaClasse()
//     private init() { }
// }
//
// Normalmente usamos class porque:
//
// - class é Reference Type
// - várias referências podem apontar para o mesmo objeto
//
// Normalmente usamos let porque:
//
// - evita trocar a instância shared
//
// private init() é importante porque:
//
// - impede que criem novos objetos fora da classe
//
// Vantagens:
//
// - centralização
// - compartilhamento de estado
// - fácil acesso
//
// Cuidados:
//
// - estado global
// - excesso de responsabilidade
// - dificuldade em testes
//
// Regra prática:
//
// Use Singleton quando REALMENTE fizer sentido existir
// UMA única instância compartilhada no app inteiro.
