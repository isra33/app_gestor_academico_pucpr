# 📱 Gestor Acadêmico - Pós Graduação

Aplicativo desenvolvido em Flutter como projeto de pós-graduação, com foco em boas práticas de desenvolvimento mobile.

---

## 🎯 Objetivo

O aplicativo tem como objetivo auxiliar alunos de pós-graduação a gerenciar:

- Disciplinas
- Tarefas
- Progresso acadêmico

---

## 🧱 Arquitetura

O projeto utiliza a arquitetura:

👉 **MVVM (Model - View - ViewModel)**

### Estrutura:

- **Model** → Representação dos dados (`models/`)
- **View** → Telas da aplicação (`views/`)
- **ViewModel** → Lógica de apresentação (`viewmodels/`)
- **Repository** → Camada de dados (`repositories/`)

---

## 💉 Injeção de Dependência

Foi utilizada a biblioteca:

👉 **GetIt**

Local de implementação:

lib/core/di/injection.dart


Responsável por:

- Registrar dependências
- Injetar ViewModels e Repositories

---

## 🧪 Testes Unitários

O projeto contém **5 testes unitários**, garantindo a qualidade da aplicação.

Local:

test/


### Testes implementados:

- Validação da lista de disciplinas
- Validação do total de tarefas
- Validação do dashboard
- Alteração de status de tarefas
- Verificação de dados retornados pelos ViewModels

---

## 🎨 Interface

O aplicativo possui **3 telas funcionais**:

1. 🏠 **Dashboard**
   - Resumo geral (disciplinas e tarefas)

2. 📚 **Disciplinas**
   - Lista de matérias da pós

3. ✅ **Tarefas**
   - Lista de atividades com controle de status

---

## 🧩 Design Patterns Utilizados

- **Repository Pattern**
  - Separação da fonte de dados

- **Service Locator (GetIt)**
  - Gerenciamento de dependências

- **Observer (ChangeNotifier)**
  - Atualização reativa da interface

---

## 🧼 Clean Code

O projeto segue boas práticas de código limpo:

- Separação de responsabilidades
- Nomes claros e descritivos
- Organização por camadas
- Código reutilizável

---

## 🚀 Tecnologias Utilizadas

- Flutter
- Dart
- GetIt (Dependency Injection)

---

## ▶️ Como executar o projeto

```bash
flutter pub get
flutter run

🧪 Executar testes

flutter test

📹 Vídeo Demonstrativo

👉 (Cole aqui o link do YouTube)

💻 Repositório

👉 (Cole aqui o link do GitHub)