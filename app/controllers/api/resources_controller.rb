require 'json-schema'

module Api
  class ResourcesController < Api::ResourcesBaseController
    include Api::ResourcesSchema

    def index
      h = Host.find_by_name!(params[:host_id])
      if schema['properties'][params[:puppetclass_id]]['properties'].has_key?(params[:type_id])
        @data = h.puppetclasses.find_by_name!(params[:puppetclass_id]).class_params.find_by_key!(params[:type_id]).value_for(h)
        if not params[:active_only] == "false"
          @data.delete_if { |k,v|
            v["ensure"] == false or v["ensure"] == "absent" or v["ensure"] == "false"
          }
        end
      else
        render "api/errors/not_found", :status => 404
      end
    end

    def show
      h = Host.find_by_name!(params[:host_id])
      if schema['properties'][params[:puppetclass_id]]['properties'].has_key?(params[:type_id])
        @data = h.puppetclasses.find_by_name!(params[:puppetclass_id]).class_params.find_by_key!(params[:type_id]).value_for(h)[params[:id]] or render "api/errors/not_found", :status => 404
      else
        render "api/errors/not_found", :status => 404
      end
    end

    def update
      @value = JSON.parse(request.body.read)
      data = {
        params[:puppetclass_id] => {
          params[:type_id] => {
            params[:id] => @value
          }
        }
      }
      JSON::Validator.validate!(schema, data, :validate_schema => true)

      h = Host.find_by_name!(params[:host_id])

      puts h.puppetclasses.find_by_name!(params[:puppetclass_id]).class_params.find_by_key!(params[:type_id]).to_s
      lv = h.puppetclasses.find_by_name!(params[:puppetclass_id]).class_params.find_by_key!(params[:type_id]).lookup_values.find_or_create_by_match("fqdn=#{params[:host_id]}")
      lv.value = Hash.new if not lv.value
      lv.value[params[:id]] = @value
      lv.save
    end

    def destroy
      h = Host.find_by_name!(params[:host_id])
      if schema['properties'][params[:puppetclass_id]]['properties'].has_key?(params[:type_id])
        lv = h.puppetclasses.find_by_name!(params[:puppetclass_id]).class_params.find_by_key!(params[:type_id]).lookup_values.find_by_match!("fqdn=#{params[:host_id]}")
        @value = lv.value.delete(params[:id])
        lv.save
      else
        render "api/errors/not_found", :status => 404
      end
    end

  end
end

