require 'pry'
require 'pg'

class Note
  attr_accessor :title, :description
  def initialize(title, description=nil)
    @title = title
    @description = description
  end

  def insert
    sql = "insert into notes (title, description) values (\'#{@title}\',\'#{@description}\')"
    conn = this.connect
  end

  def connect
    conn = PG.connect(:dbname=> 'todo', :host=>'localhost')
    conn.db
    #binding.pry
    #conn.exec(sql)
  end


end

