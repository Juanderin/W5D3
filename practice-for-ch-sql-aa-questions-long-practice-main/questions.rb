require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super('questions.db')
        self.type_translation = true
        self.results_as_hash = true
    end
end

class User
end

class Question
  attr_accessor :id, :title, :body, :associated_author

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def self.find_by_id(id)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM
        questions
      WHERE
        id = ?
    SQL
    return nil unless question.length > 0 

    Question.new(question.first) # question is stored in an array!
  end
end
#   def self.find_by_playwright(name)
#     playwright = Playwright.find_by_name(name)
#     raise "#{name} not found in DB" unless playwright

#     plays = PlayDBConnection.instance.execute(<<-SQL, playwright.id)
#       SELECT
#         *
#       FROM
#         plays
#       WHERE
#         playwright_id = ?
#     SQL

#     plays.map { |play| Play.new(play) }
#   end

#   def initialize(options)
#     @id = options['id']
#     @title = options['title']
#     @year = options['year']
#     @playwright_id = options['playwright_id']
#   end

#   def create
#     raise "#{self} already in database" if @id
#     PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
#       INSERT INTO
#         plays (title, year, playwright_id)
#       VALUES
#         (?, ?, ?)
#     SQL
#     @id = PlayDBConnection.instance.last_insert_row_id
#   end

#   def update
#     raise "#{self} not in database" unless @id
#     PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
#       UPDATE
#         plays
#       SET
#         title = ?, year = ?, playwright_id = ?
#       WHERE
#         id = ?
#     SQL
#   end
# end

# class QuestionsFollows
#   attr_accessor :name, :birth_year
#   attr_reader :id

#   def self.all
#     data = PlayDBConnection.instance.execute("SELECT * FROM playwrights")
#     data.map { |datum| Playwright.new(datum) }
#   end

#   def self.find_by_name(name)
#     person = PlayDBConnection.instance.execute(<<-SQL, name)
#       SELECT
#         *
#       FROM
#         playwrights
#       WHERE
#         name = ?
#     SQL
#     return nil unless person.length > 0 # person is stored in an array!

#     Playwright.new(person.first)
#   end

#   def initialize(options)
#     @id = options['id']
#     @name = options['name']
#     @birth_year = options['birth_year']
#   end

#   def create
#     raise "#{self} already in database" if @id
#     PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year)
#       INSERT INTO
#         playwrights (name, birth_year)
#       VALUES
#         (?, ?)
#     SQL
#     @id = PlayDBConnection.instance.last_insert_row_id
#   end

#   def update
#     raise "#{self} not in database" unless @id
#     PlayDBConnection.instance.execute(<<-SQL, @name, @birth_year, @id)
#       UPDATE
#         playwrights
#       SET
#         name = ?, birth_year = ?
#       WHERE
#         id = ?
#     SQL
#   end

#   def get_plays
#     raise "#{self} not in database" unless @id
#     plays = PlayDBConnection.instance.execute(<<-SQL, @id)
#       SELECT
#         *
#       FROM
#         plays
#       WHERE
#         playwright_id = ?
#     SQL
#     plays.map { |play| Play.new(play) }
#   end

# end
    

# class Replies
# end

# class QuestionsLikes
# end