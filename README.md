# my_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


***

# Anotações sobre a aula

> [!NOTE]
> Para baixar as dependências de um projeto Flutter, utilizas-se o comando:
> ```bash
> flutter pub get
> ```
> 
> Para executar a aplicação em um emulador, utilizamos o comando:
> ```
> flutter run
> ```

> [!WARNING]
> Esse projeto esta sendo utilizado com propósitos didáticos ao ensinar Flutter
> O projeto passado pelo docente é encontrado na branch `main`
> O projeto desenvolvido pelo discente é encontrado na branch `studant_script`
> Esse README.md será composto pelas anotações téquinicas de cada aula, mas também pelas pesquisas individuais do discente.


# Estudo extensivo do discente

## Introdução

> [!NOTE]
> Adorei a documentação do Flutter, achei muito bem organizada e feita com carinho, vale a pena navegar por ela.
> Também senti um poco de similaridade com o BootsTrap, como algumas referências a widget column ou widget row e a forma de adicionar ícones já prontos como no seguinte exemplo:
> ```dart
> @override
> Widget build(BuildContext context) {
>   return Card(
>     child: ListTile(
>       leading: const Icon(Icons.monetization_on, color: Colors.green),
>       title: Text(value),
>       subtitle: Text(accountNumber),
>     ),
>   );
> }
> ```
> Assim como a uilização de materiais do `https://m3.material.io/` como os componentes em `https://m3.material.io/components`

### SACAFFOLD

No Flutter, o `Scaffold` é um widget essencial que fornece uma estrutura básica para a criação da interface do usuário. Ele é usado como um "esqueleto", ou um andaime, para construir uma tela e oferece várias funcionalidades importantes para a criação de aplicativos móveis.

Alguns dos principais elementos e funcionalidades que o Scaffold oferece:

1. **AppBar**: Uma barra de aplicativo no topo da tela, que geralmente contém o título do aplicativo e ações como botões de navegação ou de menu.

2. **Drawer**: Um menu deslizante que pode ser acessado a partir da borda da tela (normalmente a esquerda) e pode ser usado para navegação ou outras opções de configuração.

3. **BottomNavigationBar**: Uma barra na parte inferior da tela que permite a navegação entre diferentes seções do aplicativo.

4. **FloatingActionButton**: Um botão de ação flutuante que pode ser colocado em uma posição fixa na tela e geralmente é usado para ações principais, como adicionar um novo item.

5. **Body**: O principal conteúdo da tela, onde você coloca os widgets que formam o conteúdo da sua página.

6. **BottomSheet**: Uma folha deslizante que aparece na parte inferior da tela, geralmente usada para mostrar informações ou opções adicionais.

7. **SnackBar**: Um widget que aparece temporariamente na parte inferior da tela para mostrar mensagens breves ou feedback para o usuário.

Em suma, o Scaffold fornece a estrutura básica e o layout geral da tela, semelhante ao esqueleto de um edifício que define a estrutura fundamental onde os outros elementos são montados.

### WIDGET

Um `widget` é a unidade básica de construção da interface do usuário. Cada elemento da interface, desde um botão até uma lista ou um texto, é representado por um widget. Widgets são usados para construir e compor a interface do usuário em um aplicativo Flutter.

Algumas características importantes dos widgets no Flutter:

1. **Imutabilidade**: Widgets no Flutter são imutáveis, o que significa que uma vez criados, seus estados não podem ser alterados. Em vez disso, se você precisar alterar algo, você cria um novo widget com as novas propriedades.

2. **Composição**: Widgets podem ser compostos, o que significa que você pode criar widgets complexos a partir de widgets mais simples. Por exemplo, um Column pode conter vários Text widgets, e um Row pode conter diversos botões (ElevatedButton).

3. **Hierarquia**: Widgets são organizados em uma hierarquia. O widget pai pode conter widgets filhos, e cada widget pode ter um papel específico na construção da interface. Por exemplo, um Scaffold pode ter um AppBar, um Drawer e um body.

4. **Funcionalidade** e Aparência: Widgets no Flutter não apenas definem a aparência da interface do usuário, mas também podem controlar o comportamento e a interação. Por exemplo, o widget ElevatedButton define um botão que pode ser pressionado e possui um comportamento associado a essa interação.

5. **Estado**: Enquanto widgets são imutáveis, eles podem ter um estado associado a eles. O estado é gerenciado por um widget chamado StatefulWidget. Um StatefulWidget pode manter o estado que pode mudar ao longo do tempo, e quando isso acontece, o widget pode ser reconstruído para refletir essas mudanças. Seria algo semelhante ao ninâmismo oferecido pelo javascript quando há interações do usuário na aplicação em sistemas baseadas em HTML e CSS.

Resumindo, os widgets são comparáveis às `<div>`s no HTML, no sentido de que ambos são usados para compor a interface do usuário e definir a estrutura visual e o comportamento dos elementos.

