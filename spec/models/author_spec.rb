require 'spec_helper'

describe Author do
  
  describe '#external_comments_count' do
    subject { author.external_comments_count }
    let(:author) { Author.new(tumblr: 'gaslight') }

    context 'when the author has no posts' do
      it { should == 0 }
    end

    context 'when the author has posts with external comments' do
      before do
        FactoryGirl.create(:post, author: author.tumblr, external_comments_count: 1)
        FactoryGirl.create(:post, author: author.tumblr, external_comments_count: 2)
      end

      it { should == 3 }
    end
  end

  describe '#as_json' do
    it 'returns the correct attributes for json' do
      author = Author.new(tumblr: 'gaslight')
      author.stub(:external_comments_count) { 42 }

      author.as_json.should == {
        tumblr: 'gaslight',
        external_comments_count: 42,
      }
    end
  end

end