module Api
  module ResourcesSchema

    private
    def schema 
      # Todo: cache the json
      JSON.parse(File.open(Rails.root.join('public','resources.json').to_s).read)
    end

  end
end

