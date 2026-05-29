//MARK: - Passo a passo, subindo app para loja 🚀❤️

//MARK: - 1 passo: Criando sua conta apple e realizando assinatura

// Acessar o site -> https://developer.apple.com/programs/
// Logar com sua conta -> https://developer.apple.com/account

// Comparar assinaturas de 100 dolares / no android é 50 dolares porem concede acesso vitalicio

// Ele vai te pedir informações pessoais, e seus dados
// Informe sua CNH ou seu RG.
// Para pagamento, infrome seu cartão FISICO, o virtual costuma dar problema!
// O prazo medio é de 2-3 dias para te liberarem depois da confirmação do pagamento, se demorar mais de 5 dias cancele e faça novamente o processo.

// MARK: - 2 passo: Configurar certificados, Identificadores e perfis de provisionamento

// MARK: 1. Mas,o que são Certificados?
// Os certificados são como "documentos de identidade" que garantem à Apple que você é um desenvolvedor aurorizado e que o aplicativo é seguro. Quando você cria um app para a Apple, é necessário "assinar" esse app com um certificado, o que confirma sua identidade como desenvolvedor e garante que o código não foi alterado por terceiros. Sem essa assinatura, a Apple não vai permitir que o app seja instalado em iPhones ou publicado na App Store.

// MARK: 2. Por que a Apple pede Certificados?
// A Apple é muito cuidadosa com a segurança de seus usuários e seus dispositivos. Por isso, ela exige os certificados para:
// • Garantir que o app foi feito por uma pessoa autorizada.
// • Evitar que os apps com códigos maliciosos sejam instalados nos iPhones, iPads, etc.
// • Controlar quais apps podem ser distribuidos e garantir a qualidade e a seguranca.

// MARK: 3. Tipos de Certificados
// Existem dois principais tipos de certificados que você vai usar no desenvolvimento de apps:

// • Certificado de Desenvolvimento (Development Certificate): Usado enquanto você está criando e testando o app. Ele permite que você instale e teste o app em dispositivos reais (iPhones, iPads), mas somente em dispositivos que você registrou como confiáveis. Esse certificado é só para a fase de desenvolvimento.
// • Certificado de Distribuição (Distribution Certificate): Usado quando você termina o app e está pronto para enviá-lo para a App Store. Esse certificado é como um selo de “autorização” da Apple, permitindo que o app seja distribuído e baixado por qualquer pessoa na App Store.

// MARK: 4. Quem precisa de Certificados?
// • Desenvolvedores: Todos os desenvolvedores que querem testar seu app em dispositivos reais (como um iPhone ou iPad) precisam de um Certificado de Desenvolvimento.
// • Quem vai publicar o app na App Store: Apenas uma pessoa ou uma pequena equipe precisa do Certificado de Distribuição. Esse certificado é usado para fazer o upload do app para a App Store.

// MARK: 5. Quantos Certificados devem ser gerados?
// • Certificado de Desenvolvimento: Cada desenvolvedor que vai testar o app no seu próprio iPhone, por exemplo, precisa gerar o seu próprio certificado de desenvolvimento. Isso permite que ele conecte seus dispositivos ao projeto e teste o app de forma segura.
// • Certificado de Distribuição: Apenas um certificado de distribuição é necessário para toda a equipe, geralmente gerado por quem é dono da conta de desenvolvedor ou o líder do projeto. Esse certificado será usado para assinar o app e enviá-lo para a App Store.

// MARK: 6. Como funciona com uma equipe?
// Se você trabalha com uma equipe de desenvolvedores:

// • Cada desenvolvedor pode ter seu próprio Certificado de Desenvolvimento para poder testar o app em seus dispositivos.
// • Para publicar o app na App Store, um único Certificado de Distribuição é gerado e compartilhado com a equipe, ou apenas o responsável pela publicação utiliza.

// MARK: 7. Provisioning Profiles o que é isso?
// O Provisioning Profile (perfil de provisionamento) são como “permissões” que dizem para quais dispositivos o app pode ser instalado e testado durante o desenvolvimento. Cada Provisioning Profile contém:

// • O Certificado de Desenvolvimento ou Certificado de Distribuição.
// • O Bundle ID (um identificador único do app).
// • Uma lista dos dispositivos que podem rodar o app (no caso do desenvolvimento).

// Quando você está desenvolvendo, o Provisioning Profile para desenvolvimento autoriza o app a rodar nos dispositivos que você registrou. Quando você vai distribuir o app, o Provisioning Profile de distribuição é usado para permitir que o app seja enviado para a App Store.

// Resumo Rápido:

// 1. Certificados são como “identidades” que garantem para a Apple que você é um desenvolvedor autorizado.
// 2. A Apple exige certificados para garantir segurança e controle sobre os apps que são distribuídos.
// 3. Certificado de Desenvolvimento: Necessário para testar o app em dispositivos reais. Cada desenvolvedor tem o seu.
// 4. Certificado de Distribuição: Necessário para enviar o app para a App Store. Somente um é necessário para a equipe.
// 5. Provisioning Profiles conectam o certificado ao app e ao dispositivo, permitindo que o app seja instalado durante os testes ou enviado para a App Store.

// MARK: - 3 Criando App ID

// • Registre um novo identificador:
// • Acesse o Apple Developer Portal e navegue até a seção Certificates, Identifiers & Profiles.
// • Selecione a aba Identifiers no menu lateral e clique no botão “+” para registrar um novo identificador.
// • Escolha App IDs.
// • Na próxima tela, escolha a opção App IDs. Esse tipo de identificador é necessário para associar seu app a recursos específicos do iOS, como notificações push, iCloud, entre outros.
// • Configuração do App
// • Dê um nome ao seu App ID, algo descritivo e fácil de identificar (por exemplo, “MeuApp”).
// • No campo Bundle ID (Explicit), insira um identificador exclusivo do seu app, no formato: com.suaempresa.nomeapp
// • Selecione os serviços e funcionalidades que seu app utilizará (como Push Notifications, Sign In with Apple, etc.).
// • Por fim, clique em Register para concluir a criação do App ID.

// Agora, seu app está registrado com um identificador único, permitindo configurar os certificados e perfis de provisionamento necessários para desenvolvimento e distribuição.

// MARK: - 4 Registrando o App no App Store Connect (https://appstoreconnect.apple.com/apps)

// Neste passo, você vai adicionar seu aplicativo ao App Store Connect, a plataforma que gerencia a publicação de apps na App Store. É aqui que você vai configurar todas as informações visuais e descritivas, como nome, ícones, screenshots, e detalhes sobre o app.

// MARK: Como preencher?

//1. Platforma:
//• Selecione a(s) plataforma(s) para o qual você está desenvolvendo o app (iOS, watchOS, tvOS ou visionOS).
//• No seu caso, para apps de iOS, marque a opção iOS.

//2. Nome:
//• Este é o nome do seu app que aparecerá na App Store. Escolha um nome que represente bem o seu app e que esteja disponível (não utilizado por outro app na loja).
//• Lembre-se de que o nome deve ter até 30 caracteres no máximo.

//3. Idioma principal:
//• Selecione o idioma principal do seu app, ou seja, o idioma no qual ele será exibido na App Store. Se o seu app for em português, escolha Português.
//• Você pode adicionar traduções mais tarde, mas aqui defina o idioma padrão.

//4. ID de Pacote (Bundle ID):
//• Escolha o App ID que você registrou anteriormente no Apple Developer Portal. O ID de Pacote é o identificador único do seu app, geralmente no formato com.seudominio.nomeapp.
//• Esse ID de Pacote deve já estar registrado no Apple Developer Portal (como foi feito no passo de criação do App ID).

//5. SKU:
//• O SKU (Stock Keeping Unit) é um identificador único criado por você para fins de controle interno. Ele não será visível para os usuários finais.
//• Pode ser algo como um código que você usa para rastrear as diferentes versões do app. Por exemplo, MeuApp2026.

//6. Acesso de Utilizador:
//• Aqui, você define o nível de acesso que esse app terá dentro da conta do App Store Connect.
//• Acesso total significa que a pessoa ou conta que está criando o app terá controle total sobre todas as funcionalidades.
//• Acesso limitado pode ser configurado caso você queira restringir algumas ações para determinados usuários.

// Passos Finais:

// Depois de preencher todos os campos corretamente, clique em Criar. Isso vai adicionar seu app ao App Store Connect, e você poderá seguir com o processo de configuração das informações visuais, metadados, preços e outras definições antes de fazer o upload do build do app via Xcode.

// MARK: - 5 Criando Certificados

// Passos para criar os certificados:

// 1. Acesse o Apple Developer Portal:
// • Vá para o Apple Developer Portal e faça login.
// 2. Vá para a seção "Certificates, Identifiers & Profiles":
// • No menu lateral, clique em Certificates, Identifiers & Profiles.
// 3. Crie o Certificado de Desenvolvimento:
// • Clique em Certificates no menu lateral e depois no botão "+" para adicionar um novo certificado.
// • Selecione Desenvolvimento de Aplicativos iOS (ou Apple Development para plataformas múltiplas).
// • Siga o processo para gerar uma Certificate Signing Request (CSR) no seu Mac:
// • Abra o Acesso às Chaves (Keychain Access) no seu Mac.
// • No menu superior do keychain, selecione Assistente de Certificação › Solicitar um Certificado de uma Autoridade de Certificação.
// • Salve o arquivo CSR e faça o upload no Apple Developer Portal.
// • Finalize o processo e baixe o certificado gerado.
// • Instale o certificado clicando duas vezes nele para abrir no Acesso às Chaves.
// 4. Crie o Certificado de Distribuição:
// • Repita o mesmo processo, mas agora selecione Distribuição iOS (App Store Connect e Ad Hoc).
// • Da mesma forma, gere o CSR e faça o upload no portal.
// • Baixe o certificado gerado e instale-o no Acesso as Chaves.

// Esses dois certificados vão permitir que você assine seu app tanto para testes em dispositivos físicos (usando o Certificado de Desenvolvimento) quanto para distribuição via App Store (usando o Certificado de Distribuição).

// MARK: - 6 Criando Perfis de Provisionamento

// Os Perfis de Provisionamento são responsáveis por conectar seus certificados (que você acabou de criar) ao App ID e aos dispositivos nos quais você deseja testar ou distribuir seu app. Você precisará criar dois perfis de provisionamento: um para Desenvolvimento e outro para Distribuição.

// Passos para criar os Perfis de Provisionamento:
// 1. Acesse o Apple Developer Portal:
// • Vá para o Apple Developer Portal e faça login.
// 2. Vá para "Certificates, Identifiers & Profiles":
// • No menu lateral, clique em Profiles e, em seguida, clique no botão "+" no canto superior direito para criar um novo perfil.

// Criando o Perfil de Provisionamento de Desenvolvimento:
// • Escolha a opção Desenvolvimento de Aplicativos ios.
// • Selecione o App ID que você criou anteriormente para o seu app.
// • Na próxima tela, selecione o Certificado de Desenvolvimento que você gerou no passo anterior.
// • Selecione os dispositivos em que você deseja testar o app (esses dispositivos devem estar registrados no Apple Developer Portal).
// • Nomeie o perfil (por exemplo, "MeuApp_Dev_Profile").
// • Clique em Gerar e, depois, baixe o perfil de provisionamento gerado.
// • No Xcode, adicione esse perfil de provisionamento para associá-lo ao seu projeto.

// Criando o Perfil de Provisionamento de Distribuição:

// • Volte ao início do processo e clique novamente no botão "+" para criar um novo perfil de provisionamento.
// • Desta vez, selecione Conectar App Store para um perfil de distribuição (você também pode escolher Ad Hoc caso queira distribuir o app para um número limitado de dispositivos fora da App Store).
// • Escolha o App ID correspondente ao seu app.
// • Selecione o Certificado de Distribuição que você gerou anteriormente.
// • Nomeie o perfil (por exemplo, "MeuApp_Distribution_Profile").
// • Clique em Gerar, depois baixe o perfil de provisionamento e adicione-o ao Xcode.

// Agora, com os Perfis de Provisionamento configurados, você poderá testar seu app em dispositivos físicos (usando o perfil de desenvolvimento) e preparar seu app para publicação na App Store (com o perfil de distribuição).
