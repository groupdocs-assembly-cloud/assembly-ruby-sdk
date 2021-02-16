This repository contains GroupDocs.Assembly Cloud SDK for Ruby source code. This SDK allows you to work with GroupDocs.Assembly Cloud REST APIs in your Ruby applications quickly and easily, with zero initial cost.

See [API Reference](https://apireference.groupdocs.cloud/assembly) for full API specification.

# Key Features
* API to Define Templates, Fetch Data Source, Insert Data in Template & Generate on the fly Reports.

## How to use the SDK?
The complete source code is available in this repository folder. You can either directly use it in your project via source code or get [RubyGem](https://rubygems.org/gems/groupdocs_assembly_cloud) (recommended).

### Prerequisites

To use GroupDocs.Assembly for Cloud Ruby SDK you need to register an account with [GroupDocs Cloud](https://www.groupdocs.cloud/) and lookup/create App Key and SID at [Cloud Dashboard](https://dashboard.groupdocs.cloud/applications). There is free quota available. For more details, see [GroupDocs Cloud Pricing](https://purchase.groupdocs.cloud/pricing).

### Installation
To install this package do the following:
update your Gemfile
```ruby
gem 'groupdocs_assembly_cloud', '~> 21.1'
```
or install directly
```bash
gem install groupdocs_assembly_cloud
```

### Sample usage
```ruby
@config = Configuration.new
@config.api_key['api_key'] = '' # Put your's api_key and app_sid
@config.api_key['app_sid'] = ''
@api_client = ApiClient.new @config
@assembly_api = AssemblyApi.new @api_client
template_file_info = TemplateFileInfo.new(:FilePath => remote_name)
assemble_data = AssembleOptions.new(:TemplateFileInfo => template_file_info, :SaveFormat => "docx", :ReportData => File.open(DataFile, 'rb') { |f| f.read })
request = AssembleDocumentRequest.new assemble_data
result = @assembly_api.assemble_document request
assert result.length > 0, 'Error occurred while getting image data'
```
      
[Tests](tests/) contain various examples of using the SDK.
Please put your credentials into [Configuration](Settings/servercreds.json).

## Dependencies
- Ruby 2.3 or later
- referenced packages (see [here](Gemfile) for more details)

## Contact Us
[Product Page](https://products.groupdocs.cloud/assembly/ruby) | [Documentation](https://docs.groupdocs.cloud/display/assemblycloud/Home) | [API Reference](https://apireference.groupdocs.cloud/assembly/) | [Code Samples](https://github.com/groupdocs-assembly-cloud/groupdocs-assembly-cloud-ruby) | [Blog](https://blog.groupdocs.cloud/category/assembly/) | [Free Support](https://forum.groupdocs.cloud/c/assembly) | [Free Trial](https://dashboard.groupdocs.cloud/applications)
