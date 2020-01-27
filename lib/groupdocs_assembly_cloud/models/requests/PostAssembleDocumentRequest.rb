 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="GroupDocs" file="PostAssembleDocumentRequest.rb">
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

  #
  # Request model for post_assemble_document operation.
  #
  class PostAssembleDocumentRequest

        # File name of template, which is located on a storage
        attr_accessor :name
        # Report Data Options. It should be JSON with SaveFormat and ReportData
        attr_accessor :report_data
        # Folder path where template file is located(on a storage)
        attr_accessor :folder
        # Result name of built document
        attr_accessor :dest_file_name
	
        #
        # Initializes a new instance.
        # @param name File name of template, which is located on a storage
        # @param report_data Report Data Options. It should be JSON with SaveFormat and ReportData
        # @param folder Folder path where template file is located(on a storage)
        # @param dest_file_name Result name of built document
        def initialize(name, report_data, folder = nil, dest_file_name = nil)
           self.name = name
           self.report_data = report_data
           self.folder = folder
           self.dest_file_name = dest_file_name
        end
  end
end
