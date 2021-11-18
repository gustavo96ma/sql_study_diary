# sql_study_diary
Projeto SQL e Ruby de um Diário de Estudo CLI.

Execute bin/setup para configurar o banco de dados em SqLite3 e posteriormente execute lib/menu.rb para rodar o programa no terminal.

O programa é capaz de cadastrar itens no Diário de Estudo com as propriedades Título, Categoria, Descrição e Concluído. O título é o nome da tarefa a ser executada em si, a categoria indica que tipo de tarefa é essa que será cadastrada. A descrição detalha a tarefa e a propriedade concluído indica se a tarefa já foi executada ou não. Por padrão o item é cadastrado com a propriedade Concluído = "Não".

Além disso, o programa pode exibir todas os itens já cadastrados, buscar um item pelo seu título, listar todos os itens de uma certa categoria, apagar um item, marcar um item como concluído, trocando o valor de concluído para "Sim". Ainda, pode exibir todos os itens concluídos, já que nas outras consultas e listas os itens concluídos não constam.

É um projeto relativamente simples que promove a interação de dados fornecidos pelo usuário com um banco de dados por meio da linguagem Ruby.
