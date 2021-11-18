require_relative 'task'
require 'io/console'

print "\n Bem-vindo ao Diário de Estudos, seu companheiro para estudar! \n"

def menu()
  print "  
  [1] Cadastrar um item para estudar
  [2] Ver todos os itens cadastrados
  [3] Buscar um item de Estudos
  [4] Listar por categoria
  [5] Apagar um item
  [6] Marcar item como concluído
  [7] Listar itens concluídos
  [8] Sair
  
  Escolha uma opção: "
  @option = gets.chomp
  
  if not @option.to_i in 1..8
    print "\nOpção inválida...\n"
    print "\nPressione qualquer tecla para voltar ao menu\n"
    STDIN.getch
    menu()
  end

  if @option.to_i == 1
    print "\nDigite o título do seu item de estudo: "
    title = gets.chomp
    print "\nEscolha uma categoria para o seu item de estudo:
    #1 - Ruby
    #2 - Rails
    #3 - HTML \n"
    category_input = gets.chomp
    print "\nDigite uma descrição para o seu item de estudo: "
    descript = gets.chomp

    if category_input.to_i == 1
      new_item = Task.new(title: title, category: 'Ruby', descript: descript)
    elsif category_input.to_i == 2
      new_item = Task.new(title: title, category: 'Rails', descript: descript)
    elsif category_input.to_i == 3
      new_item = Task.new(title: title, category: 'HTML', descript: descript)
    end
  
    new_item.save_to_db
  
    print "\nItem #{new_item.title} da categoria #{new_item.category} com a descrição #{new_item.descript} cadastrado com Sucesso! \n"
    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end

  if @option.to_i == 2
    print "\nOs itens já cadastrados são:\n"
    Task.all
    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end
  
  if @option.to_i == 3
    print "\nDigite uma palavra para procurar:"
    find_input = gets.chomp

    Task.find_by_title(find_input)

    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end

  if @option.to_i == 4
    Task.all
    print "\nDigite uma categoria para procurar:"
    find_category_input = gets.chomp

    Task.find_by_category(find_category_input)

    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end

  if @option.to_i == 5
    Task.all
    print "\nEscolha um item para apagar:"
    delete_input = gets.chomp

    Task.delete(delete_input)

    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end

  if @option.to_i == 6
    Task.all
    print "\nEscolha um item para concluir:"
    done_input = gets.chomp

    Task.done(done_input)

    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end

  if @option.to_i == 7
    Task.find_done

    print "\nPressione qualquer tecla para continuar\n"
    STDIN.getch
    menu()
  end
end

menu()
