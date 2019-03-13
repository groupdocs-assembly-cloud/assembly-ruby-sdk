This repository contains GroupDocs.Assembly Cloud SDK for Ruby source code. This SDK allows you to work with GroupDocs.Assembly Cloud REST APIs in your Ruby applications quickly and easily, with zero initial cost.

See [API Reference](https://apireference.groupdocs.cloud/) for full API specification.

## How to use the SDK?
The complete source code is available in this repository folder. You can either directly use it in your project via source code or get [RubyGem](https://rubygems.org/gems/groupdocs_assembly_cloud) (recommended). For more details, please visit our [documentation website](https://docs.groupdocs.cloud/display/assemblycloud/Available+SDKs).

### Prerequisites

To use GroupDocs.Assembly for Cloud Ruby SDK you need to register an account with [GroupDocs Cloud](https://www.groupdocs.cloud/) and lookup/create App Key and SID at [Cloud Dashboard](https://dashboard.groupdocs.cloud/#/apps). There is free quota available. For more details, see [GroupDocs Cloud Pricing](https://purchase.groupdocs.cloud/pricing).

### Installation
To install this package do the following:
update your Gemfile
```ruby
gem 'groupdocs_assembly_cloud', '~> 18.7'
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
request = PostAssembleDocumentRequest.new remote_name ,File.new(local_test_folder + '/Data.json'),{:SaveFormat => "docx"}, remote_test_folder, nil
result = @assembly_api.post_assemble_document request
```
      
[Tests](tests/) contain various examples of using the SDK.
Please put your credentials into [Configuration](Settings/servercreds.json).

## Dependencies
- Ruby 2.3 or later
- referenced packages (see [here](Gemfile) for more details)
