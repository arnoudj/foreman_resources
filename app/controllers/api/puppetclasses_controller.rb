require 'json-schema'

module Api
  class PuppetclassesController < Api::ResourcesBaseController

    def search
      pclass = Puppetclass.find_by_name!(params[:id])
      hosts = pclass.hosts
      @data = {}
      hosts.each { |host|
        @data[host] = {}
        pclass.class_params.each { |key|
          @data[host][key.to_s] = key.value_for(host)
        }
      }
    end

  end
end

