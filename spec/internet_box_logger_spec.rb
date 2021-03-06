require 'spec_helper'


describe InternetBoxLogger do

  subject {InternetBoxLogger}

  it 'should not accept invalid parsers' do
    expect{ subject.get_box(:stupid)}.to raise_error
  end

  it 'should accept any valid parser' do
    InternetBoxLogger::Parsers[].each do |parser|
      expect{ subject.get_box(parser)}.not_to raise_error
    end
  end

  it 'should use the default box type if not provided' do
    expect{ subject.get_box}.not_to raise_error
  end

  it 'should include a parser of the box_type specified in the constructor' do
    parser = InternetBoxLogger::Parsers::FreeboxV5Parser
    box = subject.get_box(parser)
    expect( box.respond_to? :get_box_data).to be_truthy
  end

end