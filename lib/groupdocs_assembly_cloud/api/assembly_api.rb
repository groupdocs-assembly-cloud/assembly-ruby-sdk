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

    # Copy file
    # 
    # @param request FileCopyFileRequest
    # @return [nil]
    def file_copy_file(request)
      data, _status_code, _headers = file_copy_file_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Copy file
    # 
    # @param request FileCopyFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def file_copy_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FileCopyFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.file_copy_file ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.file_copy_file' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.file_copy_file' if @api_client.config.client_side_validation && request.src_path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#file_copy_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete file
    # 
    # @param request FileDeleteFileRequest
    # @return [nil]
    def file_delete_file(request)
      data, _status_code, _headers = file_delete_file_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Delete file
    # 
    # @param request FileDeleteFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def file_delete_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FileDeleteFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.file_delete_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.file_delete_file' if @api_client.config.client_side_validation && request.path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#file_delete_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Download file
    # 
    # @param request FileDownloadFileRequest
    # @return [File]
    def file_download_file(request)
      data, _status_code, _headers = file_download_file_with_http_info(request)
      request_token if _status_code == 401
      data
    end

    # Download file
    # 
    # @param request FileDownloadFileRequest
    # @return [Array<(File, Fixnum, Hash)>]
    # File data, response status code and response headers
    private def file_download_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FileDownloadFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.file_download_file ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.file_download_file' if @api_client.config.client_side_validation && request.path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names,
                                                        return_type: 'File')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#file_download_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Move file
    # 
    # @param request FileMoveFileRequest
    # @return [nil]
    def file_move_file(request)
      data, _status_code, _headers = file_move_file_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Move file
    # 
    # @param request FileMoveFileRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def file_move_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FileMoveFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.file_move_file ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.file_move_file' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.file_move_file' if @api_client.config.client_side_validation && request.src_path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#file_move_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Upload file
    # 
    # @param request FileUploadFileRequest
    # @return [FilesUploadResult]
    def file_upload_file(request)
      data, _status_code, _headers = file_upload_file_with_http_info(request)
      request_token if _status_code == 401
      data
    end

    # Upload file
    # 
    # @param request FileUploadFileRequest
    # @return [Array<(FilesUploadResult, Fixnum, Hash)>]
    # FilesUploadResult data, response status code and response headers
    private def file_upload_file_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FileUploadFileRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.file_upload_file ...' if @api_client.config.debugging
      # verify the required parameter 'file_data' is set
      raise ArgumentError, 'Missing the required parameter file_data when calling AssemblyApi.file_upload_file' if @api_client.config.client_side_validation && request.file_data.nil?
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.file_upload_file' if @api_client.config.client_side_validation && request.path.nil?
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
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['multipart/form-data'])

      # form parameters
      form_params = {}
      form_params[downcase_first_letter('FileData')] = request.file_data

      # http body (model)
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names,
                                                        return_type: 'FilesUploadResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#file_upload_file\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Copy folder
    # 
    # @param request FolderCopyFolderRequest
    # @return [nil]
    def folder_copy_folder(request)
      data, _status_code, _headers = folder_copy_folder_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Copy folder
    # 
    # @param request FolderCopyFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def folder_copy_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FolderCopyFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.folder_copy_folder ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.folder_copy_folder' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.folder_copy_folder' if @api_client.config.client_side_validation && request.src_path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#folder_copy_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Create the folder
    # 
    # @param request FolderCreateFolderRequest
    # @return [nil]
    def folder_create_folder(request)
      data, _status_code, _headers = folder_create_folder_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Create the folder
    # 
    # @param request FolderCreateFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def folder_create_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FolderCreateFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.folder_create_folder ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.folder_create_folder' if @api_client.config.client_side_validation && request.path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#folder_create_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete folder
    # 
    # @param request FolderDeleteFolderRequest
    # @return [nil]
    def folder_delete_folder(request)
      data, _status_code, _headers = folder_delete_folder_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Delete folder
    # 
    # @param request FolderDeleteFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def folder_delete_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FolderDeleteFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.folder_delete_folder ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.folder_delete_folder' if @api_client.config.client_side_validation && request.path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#folder_delete_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Get all files and folders within a folder
    # 
    # @param request FolderGetFilesListRequest
    # @return [FilesList]
    def folder_get_files_list(request)
      data, _status_code, _headers = folder_get_files_list_with_http_info(request)
      request_token if _status_code == 401
      data
    end

    # Get all files and folders within a folder
    # 
    # @param request FolderGetFilesListRequest
    # @return [Array<(FilesList, Fixnum, Hash)>]
    # FilesList data, response status code and response headers
    private def folder_get_files_list_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FolderGetFilesListRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.folder_get_files_list ...' if @api_client.config.debugging
      # verify the required parameter 'path' is set
      raise ArgumentError, 'Missing the required parameter path when calling AssemblyApi.folder_get_files_list' if @api_client.config.client_side_validation && request.path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names,
                                                        return_type: 'FilesList')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#folder_get_files_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Move folder
    # 
    # @param request FolderMoveFolderRequest
    # @return [nil]
    def folder_move_folder(request)
      data, _status_code, _headers = folder_move_folder_with_http_info(request)
      request_token if _status_code == 401
      nil
    end

    # Move folder
    # 
    # @param request FolderMoveFolderRequest
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    private def folder_move_folder_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? FolderMoveFolderRequest

      @api_client.config.logger.debug 'Calling API: AssemblyApi.folder_move_folder ...' if @api_client.config.debugging
      # verify the required parameter 'dest_path' is set
      raise ArgumentError, 'Missing the required parameter dest_path when calling AssemblyApi.folder_move_folder' if @api_client.config.client_side_validation && request.dest_path.nil?
      # verify the required parameter 'src_path' is set
      raise ArgumentError, 'Missing the required parameter src_path when calling AssemblyApi.folder_move_folder' if @api_client.config.client_side_validation && request.src_path.nil?
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#folder_move_folder\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Retrieves list of supported file formats.
    # 
    # @param request GetSupportedFileFormatsRequest
    # @return [FormatCollection]
    def get_supported_file_formats(request)
      data, _status_code, _headers = get_supported_file_formats_with_http_info(request)
      request_token if _status_code == 401
      data
    end

    # Retrieves list of supported file formats.
    # 
    # @param request GetSupportedFileFormatsRequest
    # @return [Array<(FormatCollection, Fixnum, Hash)>]
    # FormatCollection data, response status code and response headers
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
      auth_names = ['JWT']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: nil,
                                                        auth_names: auth_names,
                                                        return_type: 'FormatCollection')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        AssemblyApi#get_supported_file_formats\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
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
<<<<<<< lib/groupdocs_assembly_cloud/api/assembly_api.rb
      auth_names = ['JWT']
=======
      auth_names = ['oauth']
>>>>>>> lib/groupdocs_assembly_cloud/api/assembly_api.rb
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
