module Api
  class TypesController < Api::ResourcesBaseController
    include Api::ResourcesSchema

    def index
      @data = schema['properties'][params[:puppetclass_id]]['properties'].keys
    end

    def show
      h = Host.find_by_name!(params[:host_id])
      if schema['properties'][params[:puppetclass_id]]['properties'].has_key?(params[:id])
        @data = h.puppetclasses.find_by_name!(params[:puppetclass_id]).class_params.find_by_key!(params[:id]).value_for(h).keys
      else
        render "api/errors/not_found", :status => 404
      end
    end

  end
end

