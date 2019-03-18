module Types
  class QueryType < Types::BaseObject
    graphql_name 'Query'
    field :all_books, [BookType], null: true, description: "Returns a list of all books"
	
    field :book, BookType, null: true do
      description "Returns single a book given an ID"
      argument :id, ID, required: true
    end

    def all_books
      Book.all
    end

    def book(id:)
      Book.find_by(id: id)
    end	
  end
end
