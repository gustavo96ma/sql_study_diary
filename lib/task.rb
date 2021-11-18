require 'sqlite3'

class Task

  attr_accessor :title, :category, :descript, :done
  
  def initialize(title:, category:, descript:, done: "Não")
    @title = title
    @category = category
    @descript = descript
    @done = done
  end

  def self.all
    db = SQLite3::Database.open "../db/database.db"
    db.results_as_hash = true
    tasks = db.execute "SELECT title, category, descript, done FROM tasks where done LIKE'Não'"
    db.close
    tasks.map { |task| new(title: task['title'], category: task['category'], descript: task['descript'], done: task['done']) }
    print "\nLEGENDA -- Título - Categoria - Descrição - Concluído\n"
    tasks.each { |task| print "\n#{task['title']} - #{task['category']} - #{task['descript']} - #{task['done']}\n"}
  end

  def save_to_db
    db = SQLite3::Database.open "../db/database.db"
    db.execute "INSERT INTO tasks VALUES('#{ title }', '#{ category }', '#{ descript }', '#{ done }')"
    db.close
    self
  end

  def self.find_by_title(title)
    db = SQLite3::Database.open "../db/database.db"
    db.results_as_hash = true
    tasks = db.execute "SELECT title, category, descript, done FROM tasks where (title LIKE'%#{title}%' OR descript LIKE'%#{title}%') AND done LIKE'Não'"
    db.close
    tasks.map {|task| new(title: task['title'], category: task['category'], descript: task['descript'], done: task['done']) }
    if tasks.length == 0
      return print "\nNão foi encontrado nenhum item.\n"
    else
      print "\nResultado da busca:\n"
      tasks.each { |task| print "\n#{task['title']} - #{task['category']} - #{task['descript']} - #{task['done']}\n"}
    end
  end

  def self.find_by_category(category)
    db = SQLite3::Database.open "../db/database.db"
    db.results_as_hash = true
    tasks = db.execute "SELECT title, category, descript, done FROM tasks where category LIKE'%#{category}%' AND done LIKE'Não'"
    db.close
    tasks.map {|task| new(title: task['title'], category: task['category'], descript: task['descript'], done: task['done']) }
    if tasks.length == 0
      return print "\nNão foi encontrado nenhum item.\n"
    else
      print "\nResultado da busca:\n"
      tasks.each { |task| print "\n#{task['title']} - #{task['category']} - #{task['descript']} - #{task['done']}\n"}
    end
  end

  def self.delete(title)
    db = SQLite3::Database.open "../db/database.db"
    db.results_as_hash = true
    tasks = db.execute "DELETE FROM tasks where title LIKE'#{title}'"
    db.close
  end

  def self.done(title)
    db = SQLite3::Database.open "../db/database.db"
    db.results_as_hash = true
    tasks = db.execute "UPDATE tasks SET done = 'Sim' where title LIKE'#{title}'"
    db.close
    print "\nO item #{title} foi marcado como concluído\n"
  end

  def self.find_done
    db = SQLite3::Database.open "../db/database.db"
    db.results_as_hash = true
    tasks = db.execute "SELECT title, category, descript, done FROM tasks where done LIKE'Sim'"
    db.close
    tasks.map {|task| new(title: task['title'], category: task['category'], descript: task['descript'], done: task['done']) }
    print "\nOs itens marcados como concluídos são:\n"
    tasks.each { |task| print "\n#{task['title']} - #{task['category']} - #{task['descript']} - #{task['done']}\n"}
  end
end
