# ------------------------------------------------------------------------------------
# <copyright company="GroupDocs" file="groupdocs_assembly_cloud.rb">
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
# ------------------------------------------------------------------------------------

# Common files
require_relative 'groupdocs_assembly_cloud/api_client'
require_relative 'groupdocs_assembly_cloud/api_error'
require_relative 'groupdocs_assembly_cloud/version'
require_relative 'groupdocs_assembly_cloud/configuration'

# Models
require_relative 'groupdocs_assembly_cloud/models/error'
require_relative 'groupdocs_assembly_cloud/models/error_details'
require_relative 'groupdocs_assembly_cloud/models/file_response'
require_relative 'groupdocs_assembly_cloud/models/files_list'
require_relative 'groupdocs_assembly_cloud/models/files_upload_result'
require_relative 'groupdocs_assembly_cloud/models/format'
require_relative 'groupdocs_assembly_cloud/models/format_collection'
require_relative 'groupdocs_assembly_cloud/models/report_options_data'
require_relative 'groupdocs_assembly_cloud/models/storage_file'

# APIs
require_relative 'groupdocs_assembly_cloud/api/assembly_api'

module GroupDocsAssemblyCloud
  # Main module
  class << self
    # Configure sdk using block.
    # GroupDocsAssemblyCloud.configure do |config|
    #   config.username = "xxx"
    #   config.password = "xxx"
    # end
    # If no block given, return the configuration singleton instance.
    def configure
      if block_given?
        yield Configuration.default
      else
        Configuration.default
      end
    end
  end
end
