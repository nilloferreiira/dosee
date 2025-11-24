# Sobre o Dosee

Nunca esqueca de tomar seus medicamentos com o Dosee! Este aplicativo Flutter permite que você adicione lembretes para seus medicamentos e receba notificações quando for hora de tomá-los. Com uma interface simples e intuitiva, o Dosee facilita o gerenciamento de sua medicação diária.

### Dependencies

- flutter_local_notifications -> for local notifications
- permission_handler -> to handle permissions for notifications
- hive_ce -> for local storage
- hive_ce_flutter -> for local storage with flutter

### Telas

- Splash -> Tela de carregamento inicial.
- Home -> Lista de medicamentos e opções para adicionar, editar ou excluí-los.
- Add Medication -> Formulário para adicionar um novo medicamento.
- Login -> Formulário para fazer login.
- Register -> Formulário para registrar um novo usuário.
- Welcome -> Tela inicial com opções para login ou registro.
- Team -> Informações sobre a equipe de desenvolvimento.
- About -> Informações sobre o aplicativo.

### Funcionalidades

- Login como convidado
- Adicionar e excluir lembretes para medicamentos
- Visualizar todos os medicamentos em uma lista
- Notificações para lembretes de medicamentos

### Api

O aplicativo utiliza uma API RESTful para retornar os dados da equipe em formato JSON. A API está hospedada no Vercel e pode ser acessada em: `https://dosee-api.herokuapp.com/team`

### Equipe

Composto apenas por mim:

- Danillo Ferreira
