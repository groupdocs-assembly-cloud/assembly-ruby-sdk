# -----------------------------------------------------------------------------------
# <copyright company="Aspose" file="assembly_api.rb">
#   Copyright (c) 2021 GroupDocs.Assembly for Cloud
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

    # Builds a document using document template and XML or JSON data passed in request.
    # 
    # @param request AssembleDocumentRequest
    # @return [File]
    def assemble_document(request)
      begin
        data, _status_code, _headers = assemble_document_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = assemble_document_with_http_info(request)
          else
            raise
          end
      end
      data
    end

    # Builds a document using document template and XML or JSON data passed in request.
    # 
    # @param request AssembleDocumentRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File data, response status code and response headers
    private def assemble_document_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? AssembleDocumentRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.assemble_document ...' if @api_client.config.debugging
      # verify the required parameter 'assemble_options' is set
      raise ArgumentError, 'Missing the required parameter assemble_options when calling AssemblyApi.assemble_document' if @api_client.config.client_side_validation && request.assemble_options.nil?
      # resource path
      local_var_path = '/assembly/assemble'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.assemble_options)
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'File')
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'File')
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#assemble_document\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Copy file
    # 
    # @param request CopyFileRequest
    # @return [nil]
    def copy_file(request)
      begin
        data, _status_code, _headers = copy_file_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = copy_file_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Copy file
    # 
    # @param request CopyFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def copy_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.copy_file ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.copy_file' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.copy_file' if @api_client.config.client_side_validation && request.src_path.nil?
      # resource path
      local_var_path = '/assembly/storage/file/copy/{srcPath}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcPath') + '}', request.src_path.to_s)

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DestPath')] = request.dest_path

      if local_var_path.include? downcase_first_letter('SrcStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcStorageName') + '}', request.src_storage_name.to_s)
      else
        query_params[downcase_first_letter('SrcStorageName')] = request.src_storage_name unless request.src_storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('DestStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('DestStorageName') + '}', request.dest_storage_name.to_s)
      else
        query_params[downcase_first_letter('DestStorageName')] = request.dest_storage_name unless request.dest_storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('VersionId')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('VersionId') + '}', request.version_id.to_s)
      else
        query_params[downcase_first_letter('VersionId')] = request.version_id unless request.version_id.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#copy_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Copy folder
    # 
    # @param request CopyFolderRequest
    # @return [nil]
    def copy_folder(request)
      begin
        data, _status_code, _headers = copy_folder_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = copy_folder_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Copy folder
    # 
    # @param request CopyFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def copy_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CopyFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.copy_folder ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.copy_folder' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.copy_folder' if @api_client.config.client_side_validation && request.src_path.nil?
      # resource path
      local_var_path = '/assembly/storage/folder/copy/{srcPath}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcPath') + '}', request.src_path.to_s)

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DestPath')] = request.dest_path

      if local_var_path.include? downcase_first_letter('SrcStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcStorageName') + '}', request.src_storage_name.to_s)
      else
        query_params[downcase_first_letter('SrcStorageName')] = request.src_storage_name unless request.src_storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('DestStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('DestStorageName') + '}', request.dest_storage_name.to_s)
      else
        query_params[downcase_first_letter('DestStorageName')] = request.dest_storage_name unless request.dest_storage_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#copy_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Create the folder
    # 
    # @param request CreateFolderRequest
    # @return [nil]
    def create_folder(request)
      begin
        data, _status_code, _headers = create_folder_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = create_folder_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Create the folder
    # 
    # @param request CreateFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def create_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.create_folder ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.create_folder' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/assembly/storage/folder/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('StorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('StorageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('StorageName')] = request.storage_name unless request.storage_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#create_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete file
    # 
    # @param request DeleteFileRequest
    # @return [nil]
    def delete_file(request)
      begin
        data, _status_code, _headers = delete_file_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = delete_file_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Delete file
    # 
    # @param request DeleteFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.delete_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.delete_file' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/assembly/storage/file/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('StorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('StorageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('StorageName')] = request.storage_name unless request.storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('VersionId')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('VersionId') + '}', request.version_id.to_s)
      else
        query_params[downcase_first_letter('VersionId')] = request.version_id unless request.version_id.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#delete_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete folder
    # 
    # @param request DeleteFolderRequest
    # @return [nil]
    def delete_folder(request)
      begin
        data, _status_code, _headers = delete_folder_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = delete_folder_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Delete folder
    # 
    # @param request DeleteFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def delete_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.delete_folder ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.delete_folder' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/assembly/storage/folder/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('StorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('StorageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('StorageName')] = request.storage_name unless request.storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('Recursive')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('Recursive') + '}', request.recursive.to_s)
      else
        query_params[downcase_first_letter('Recursive')] = request.recursive unless request.recursive.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#delete_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Download file
    # 
    # @param request DownloadFileRequest
    # @return [File]
    def download_file(request)
      begin
        data, _status_code, _headers = download_file_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = download_file_with_http_info(request)
          else
            raise
          end
      end
      data
    end

    # Download file
    # 
    # @param request DownloadFileRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File data, response status code and response headers
    private def download_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DownloadFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.download_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.download_file' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/assembly/storage/file/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('StorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('StorageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('StorageName')] = request.storage_name unless request.storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('VersionId')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('VersionId') + '}', request.version_id.to_s)
      else
        query_params[downcase_first_letter('VersionId')] = request.version_id unless request.version_id.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'File')
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'File')
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#download_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Get all files and folders within a folder
    # 
    # @param request GetFilesListRequest
    # @return [FilesList]
    def get_files_list(request)
      begin
        data, _status_code, _headers = get_files_list_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = get_files_list_with_http_info(request)
          else
            raise
          end
      end
      data
    end

    # Get all files and folders within a folder
    # 
    # @param request GetFilesListRequest
    # @return [Array<(FilesList, Fixnum, Hash)>]
    # FilesList data, response status code and response headers
    private def get_files_list_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? GetFilesListRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.get_files_list ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.get_files_list' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/assembly/storage/folder/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('StorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('StorageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('StorageName')] = request.storage_name unless request.storage_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'FilesList')
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'FilesList')
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#get_files_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Retrieves list of supported file formats.
    # 
    # @param request GetSupportedFileFormatsRequest
    # @return [FileFormatsResponse]
    def get_supported_file_formats(request)
      begin
        data, _status_code, _headers = get_supported_file_formats_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = get_supported_file_formats_with_http_info(request)
          else
            raise
          end
      end
      data
    end

    # Retrieves list of supported file formats.
    # 
    # @param request GetSupportedFileFormatsRequest
    # @return [Array<(FileFormatsResponse, Fixnum, Hash)>]
    # FileFormatsResponse data, response status code and response headers
    private def get_supported_file_formats_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? GetSupportedFileFormatsRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.get_supported_file_formats ...' if @api_client.config.debugging
      # resource path
      local_var_path = '/assembly/formats'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'FileFormatsResponse')
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'FileFormatsResponse')
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#get_supported_file_formats\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Move file
    # 
    # @param request MoveFileRequest
    # @return [nil]
    def move_file(request)
      begin
        data, _status_code, _headers = move_file_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = move_file_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Move file
    # 
    # @param request MoveFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def move_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? MoveFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.move_file ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.move_file' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.move_file' if @api_client.config.client_side_validation && request.src_path.nil?
      # resource path
      local_var_path = '/assembly/storage/file/move/{srcPath}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcPath') + '}', request.src_path.to_s)

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DestPath')] = request.dest_path

      if local_var_path.include? downcase_first_letter('SrcStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcStorageName') + '}', request.src_storage_name.to_s)
      else
        query_params[downcase_first_letter('SrcStorageName')] = request.src_storage_name unless request.src_storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('DestStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('DestStorageName') + '}', request.dest_storage_name.to_s)
      else
        query_params[downcase_first_letter('DestStorageName')] = request.dest_storage_name unless request.dest_storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('VersionId')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('VersionId') + '}', request.version_id.to_s)
      else
        query_params[downcase_first_letter('VersionId')] = request.version_id unless request.version_id.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#move_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Move folder
    # 
    # @param request MoveFolderRequest
    # @return [nil]
    def move_folder(request)
      begin
        data, _status_code, _headers = move_folder_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = move_folder_with_http_info(request)
          else
            raise
          end
      end
      nil
    end

    # Move folder
    # 
    # @param request MoveFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def move_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? MoveFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.move_folder ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.move_folder' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.move_folder' if @api_client.config.client_side_validation && request.src_path.nil?
      # resource path
      local_var_path = '/assembly/storage/folder/move/{srcPath}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcPath') + '}', request.src_path.to_s)

      # query parameters
      query_params = {}
      query_params[downcase_first_letter('DestPath')] = request.dest_path

      if local_var_path.include? downcase_first_letter('SrcStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('SrcStorageName') + '}', request.src_storage_name.to_s)
      else
        query_params[downcase_first_letter('SrcStorageName')] = request.src_storage_name unless request.src_storage_name.nil?
      end
      if local_var_path.include? downcase_first_letter('DestStorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('DestStorageName') + '}', request.dest_storage_name.to_s)
      else
        query_params[downcase_first_letter('DestStorageName')] = request.dest_storage_name unless request.dest_storage_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/xml'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names)
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#move_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Upload file
    # 
    # @param request UploadFileRequest
    # @return [FilesUploadResult]
    def upload_file(request)
      begin
        data, _status_code, _headers = upload_file_with_http_info(request)
        rescue ApiError => e
          if e.code == 401
            request_token
            data, _status_code, _headers = upload_file_with_http_info(request)
          else
            raise
          end
      end
      data
    end

    # Upload file
    # 
    # @param request UploadFileRequest
    # @return [Array<(FilesUploadResult, Fixnum, Hash)>]
    # FilesUploadResult data, response status code and response headers
    private def upload_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? UploadFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.upload_file ...' if @api_client.config.debugging
      # verify the required parameter 'file_content' is set
      raise ArgumentError, 'Missing the required parameter file_content when calling AssemblyApi.upload_file' if @api_client.config.client_side_validation && request.file_content.nil?
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.upload_file' if @api_client.config.client_side_validation && request.path.nil?
      # resource path
      local_var_path = '/assembly/storage/file/{path}'
      local_var_path = local_var_path.sub('{' + downcase_first_letter('Path') + '}', request.path.to_s)

      # query parameters
      query_params = {}
      if local_var_path.include? downcase_first_letter('StorageName')
        local_var_path = local_var_path.sub('{' + downcase_first_letter('StorageName') + '}', request.storage_name.to_s)
      else
        query_params[downcase_first_letter('StorageName')] = request.storage_name unless request.storage_name.nil?
      end

      # header parameters
      header_params = {}
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = 'multipart/form-data'

      # form parameters
      form_params = {}
      form_params[downcase_first_letter('FileContent')] = request.file_content

      # http body (model)
      post_body = nil
      auth_names = ['JWT']
      begin
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'FilesUploadResult')
      rescue ApiError => e
        if e.code == 401
          request_token
          data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        auth_names: auth_names,
                                                        return_type: 'FilesUploadResult')
        end														
      end
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#upload_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
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
en
