require 'rspec'
require 'json'
require 'yaml'
require 'bosh/template/test'

describe 'stdout' do
    let(:release) { Bosh::Template::Test::ReleaseDir.new(File.join(File.dirname(__FILE__), '../..')) }
    let(:job) { release.job('main') }
    let(:template) { job.template('main.sh') }
    
    it 'writes to property to stdout' do
        message = 'hi'
        output = template.render(
            'strings' => {
              'message' => message
            }
        )

        expect(output).to include("echo #{message}")
    end
end