require 'minitest/autorun'
require_relative '../../app/models/blog'
require 'ostruct'

describe Blog do

  subject       { Blog.new }
  let(:entries) { [] }

  it "has no entries" do
    subject.entries.must_be_empty
  end

  describe '#new_post' do
    before(:each) do
      @new_post = OpenStruct.new
      subject.post_source = ->{ @new_post }
    end

    it "return a new post" do
      subject.new_post.must_equal @new_post
    end

    it "sets the post's blog reference to itself" do
      subject.new_post.blog.must_equal(subject)
    end
  end

  describe '#add_entry' do
    it 'adds the entry to the blog' do
      entry = Object.new
      subject.add_entry(entry)
      subject.entries.must_include(entry)
    end
  end
end
