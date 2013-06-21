require 'json-schema'

module Api
  class PuppetclassesController < Api::ResourcesBaseController

    def search
      pclass = Puppetclass.find_by_name!(params[:id])
      hosts = pclass.hosts
      @data = {}
      hosts.each { |host|
        @data[host] = host.info['classes'][params[:id]]
      }
    end

  end
end

