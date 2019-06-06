module Api::V1
    class ApiController < ApplicationController
        def render_success(data = {}, params = {}, message = "successful requisition")
            data = {} if data.nil?
            render json: {status: 'SUCCESS', message: message, data: JSON.parse(data.to_json(params))}, status: :ok
        end

        def render_error(data = {}, form_error = false, message = "unsuccessful request")
            data = {} if data.nil?
            if form_error
                aux = []
                data.each do |att, error|
                    data.full_messages_for(att).each do |error|
                        aux << {
                            title: att,
                            detail: error,
                            field_name: att
                        }
                    end                
                end
                data = aux
            end

            render json: {status: 'ERROR', message: message, data: data}, status: :unprocessable_entity
        end
    end
end