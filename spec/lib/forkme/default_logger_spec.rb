require File.expand_path(File.join('..', '..', '/spec_helper.rb'), File.dirname(__FILE__))
require 'stringio'

# sio = StringIO.new
# old_stdout, STDOUT = STDOUT, sio


describe 'DefaultLogger' do
  before(:all) do
    @sio = StringIO.new
    @old_stdout, $stdout = $stdout, @sio
  end

  describe "#error" do
    it "should print error" do
      DefaultLogger.error "erred"
      @sio.string.should == "erred\n"
    end
  end

  describe "#info" do
    it "should print some info" do
      DefaultLogger.info "infoed"
      @sio.string.should == "erred\ninfoed\n"
    end
  end

  describe "#debug" do
    it "should print some debug info" do
      DefaultLogger.debug "debugged"
      @sio.string.should == "erred\ninfoed\ndebugged\n"
    end
  end

  after(:all) do
    $stdout = @old_stdout # restore stdout
  end
end

