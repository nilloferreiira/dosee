# Dosee

Nunca esqueça de tomar seus medicamentos — o Dosee ajuda a criar e receber lembretes locais para sua medicação.

Resumo rápido

- Projeto: aplicativo Flutter para gerenciar lembretes de medicamentos e enviar notificações locais.
- Plataforma: Android / iOS / Web (dependendo da configuração do Flutter e plugins).

Sumário

- Requisitos
- Instalação
- Como rodar (desenvolvimento)
- Build para release
- Dependências principais
- Contribuição e contato

Requisitos

- Flutter SDK (canal estável). Recomenda-se Flutter 3.x+ ou compatível com o `pubspec.yaml` do projeto.
- Android SDK (para rodar em emuladores ou dispositivos Android). Para iOS é preciso Xcode em macOS.
- Java (JDK) para compilação Android (conforme ambiente Flutter/Android).

Instalação (clone e dependências)

1. Clone o repositório:

```bash
git clone https://github.com/nilloferreiira/dosee.git
cd dosee
```

2. Instale dependências do Flutter:

```bash
flutter pub get
```

3. (Android) Verifique o arquivo `local.properties` para apontar para o SDK do Android se necessário. O Flutter costuma autodetectar, mas em alguns ambientes pode ser preciso criar/ajustar:

```properties
sdk.dir=/caminho/para/Android/Sdk
```

Como rodar (desenvolvimento)

Opções rápidas:

- Executar no emulador/avd:

```bash
flutter emulators                  # lista emuladores disponíveis
flutter emulators --launch <nome>  # inicia um emulador específico
flutter run                        # roda no emulador aberto (ou dispositivo conectado)
```

- Executar em um dispositivo físico: conecte o dispositivo e use `flutter devices` para ver o id, depois `flutter run -d <device-id>`.

Observações úteis do workspace

- Este projeto inclui tasks de VS Code (ex.: "Iniciar Pixel 4") que podem iniciar um AVD automaticamente. Use a paleta de comandos do VS Code (Tasks: Run Task) para executar.

Dependências principais

- flutter_local_notifications — notificações locais
- permission_handler — gerenciamento de permissões
- hive_ce & hive_ce_flutter — armazenamento local (Hive)

Funcionalidades

- Adicionar e excluir lembretes de medicamentos.
- Notificações locais para lembrar o usuário.
- Telas: Splash, Home (lista), Add Medication, Login, Register, Welcome, Team, About.

Boas práticas locais

- Mantenha seu SDK Flutter atualizado com o canal estável.
- Use `flutter doctor` para verificar se o ambiente está corretamente configurado.

Contribuição

- Pull requests são bem-vindos. Abra uma issue para discutir mudanças maiores antes de implementá-las.

Contato

- Desenvolvedor: Danillo Ferreira
- contato: nilloferreiira@gmail.com
