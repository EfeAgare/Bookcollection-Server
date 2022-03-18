namespace :graphql do
  task export: :environment do
    require "graphql/rake_task"

    GraphQL::RakeTask.new(
      load_schema: ->(_task) {
        require File.expand_path("../../app/graphql/book_collection_schema", __dir__)
        BookCollectionSchema
      },
      directory: "./"
    )
    Rake::Task["graphql:schema:idl"].invoke
  end
end
