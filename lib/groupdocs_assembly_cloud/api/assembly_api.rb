# -----------------------------------------------------------------------------------
# <copyright company="GroupDocs" file="assembly_api.rb">
#   Copyright (c) 2019 GroupDocs.Assembly for Cloud
# </copyright>
# <summary>
#   Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
# </summary>
# -----------------------------------------------------------------------------------

require 'uri'

module GroupDocsAssemblyCloud
  #
  # GroupDocs.Assembly for Cloud API
  #
  class AssemblyApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
      require_all '../models/requests'
      request_token
    end

    # Builds a document using document template and XML or JSON data passed in request
    # 
    # @param request PostAssembleDocumentRequest
    # @return [File]
    def post_assemble_document(request)
      data, _status_code, _headers = post_assemble_document_with_http_info(request)
      request_token if _status_code == 401
      data
    end

    # Builds a document using document template and XML or JSON data passed in request
    # 
    # @param request PostAssembleDocumentRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File data, response status code and response headers
    private def post_assemble_document_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? PostAssembleDocumentRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.post_assemble_document ...' if @api_client.config.debugging
      # verify the required parameter 'name' is set
      raise ArgumentError, 'Missing the required parameter name when calling AssemblyApi.post_assemble_document' if @api_client.config.client_side_validation && request.name.nil?
      # verify the required parameter 'data' is set
      raise ArgumentError, 'Missing the required parameter data when calling AssemblyApi.post_assemble_document' if @api_client.config.client_side_validation && request.data.nil?
      # verify the required parameter 'save_options' is set
      raise ArgumentError, 'Missing the required parameter save_options when calling AssemblyApi.post_assemble_document' if @api_client.config.client_side_validation && request.save_options.nil?
      # resource path
      local_var_path = '/assembly/{name}/build'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Name') + '}', request.name.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('Folder')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Folder') + '}', request.folder.to_s)
      else
        query_params[downcase_first_letter('Folder')] = request.folder unless request.folder.nil?
      end
      if local_var_path.include? downcase_first_letter('DestFileName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('DestFileName') + '}', request.dest_file_name.to_s)
      else
        query_params[downcase_first_letter('DestFileName')] = request.dest_file_name unless request.dest_file_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/octet-stream'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params[downcase_first_letter('SaveOptions')] = JSON.generate(request.save_options) unless request.save_options.nil?
      form_params[downcase_first_letter('Data')] = request.data

      # http body (model)
      auth_names = ['oauth']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names,
                                                        return_type: 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#post_assemble_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

     #
     # Helper method to convert first letter to downcase
     #
    private def downcase_first_letter(str)
      value = str[0].downcase + str[1..-1]
      value
    end
                 
     #
     # Gets a request token from server
     #
    private def request_token
      config = @api_client.config
      request_url = "/connect/token"
      post_data = "grant_type=client_credentials" + "&client_id=" + config.api_key['app_sid'] + "&client_secret=" + config.api_key['api_key']
      data, status_code, header = @api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object',  :header_params => {'Content-Type': 'application/x-www-form-urlencoded'})
      @api_client.config.access_token = data[:access_token]
    end
    
    # requires all files inside a directory from current dir
    # @param _dir can be relative path like '/lib' or "../lib"
    private def require_all(_dir)
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/*.rb"].each do |file|
        require file
      end
    end
  end
end
