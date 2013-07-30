require 'spec_helper'

describe Author do
  let(:author) { Author.new(tumblr: 'gaslight') }
  
  describe '#external_comments_count' do
    subject { author.external_comments_count }

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

  describe 'contributions' do 
    subject {author.contributions }
    context 'when author has no posts' do
      it {should == 0}
    end
    context 'when the author has posts' do
      before do
        FactoryGirl.create(:post, author: author.tumblr)
        FactoryGirl.create(:post, author: author.tumblr)
      end
      it { should == 2 }
    end
  end
  
  describe '#as_json' do
    it 'returns the correct attributes for json' do
      author.stub(:external_comments_count) { 42 }
      author.stub(:contributions) { 22 }

      author.as_json.should == {
        tumblr: 'gaslight',
        external_comments_count: 42,
        contributions: 22,
      }
    end
  end

end
