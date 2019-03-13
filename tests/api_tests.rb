#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="GroupDocs" file="api_tests.rb">
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
# --------------------------------------------------------------------------------------------------------------------
#
module GroupDocsAssemblyCloud
    require_relative './base_test_context'
    #
    # Test for document assembly request
    #
    class ApiTests < BaseTestContext
      def test_folder
        'GroupDocs.Assembly'
      end
  
      def test_post_assemble
        filename = 'TestAllChartTypes.docx'
        remote_name = filename
  
        st_request = PutCreateRequest.new remote_test_folder + test_folder + '/' + remote_name, File.open(local_test_folder + '/' + filename, "rb").read       
        @storage_api.put_create st_request
  
        request = PostAssembleDocumentRequest.new remote_name ,File.new(local_test_folder + '/Teams.json'),{:SaveFormat => "docx"}, remote_test_folder + test_folder, nil
        result = @assembly_api.post_assemble_document request
        assert result.length > 0, 'Error occurred while getting image data'
      end
  
    end
end
  