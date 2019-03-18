module Mutations
  class CreateBook < GraphQL::Schema::RelayClassicMutation
    # define fields to return once a book is created
    field :book, Types::BookType, null: false

    # define arguments required to create a book
    argument :title, String, required: true
    argument :author, String, required: true
    argument :review, String, required: true
    argument :reviewer, String, required: true

    # define resolver method
    def resolve(args)
      begin
        book = Book.create(
          title: args[:title],
          author: args[:author],
          review: args[:review],
          reviewer: args[:reviewer]
        )
        { book: book }
      rescue ActiveRecord::RecordInvalid => invalid
        GraphQL::ExecutionError.new(
          {
            errors: invalid.record.errors.full_messages
          }.to_json
        )  
      end
    end
  end
end
