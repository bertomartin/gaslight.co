require 'spec_helper'

describe Post do
  its(:published_on) { should == Date.today }
  its(:title) { should == "" }
  its(:tag_list) { should be_empty }
  it { should_not be_published}

  describe 'tags' do
    let!(:postA) { FactoryGirl.create(:post, tag_list: "a,b") }
    let!(:postB) { FactoryGirl.create(:post, tag_list: "b,c") }
    it "should return a set of sorted tags" do
      tags = Post.tags
      tags.count.should == 3
      tags.should include("a","b","c")
    end
  end

  describe 'validation' do
    it { should have(1).error_on(:title) }
    it { should have(1).error_on(:body) }
    it { should have(1).error_on(:author) }
  end

  describe 'publishing' do
    subject { FactoryGirl.build(:post) }

    context 'unsaved' do
      it { should_not be_published }
    end

    context 'saved' do
      before { subject.save! }
      it { should be_published }
    end

    describe 'future posts' do
      before { subject.published_at = 1.week.from_now }

      context 'now' do
        it { should_not be_published }
      end

      context 'in two weeks' do
        it { should_not be_published }
      end
    end
  end

  describe 'rendering html' do
    let(:test_html) { "<h1>Testing the HTML</h1>\n" }

    before do
      subject.title = 'Test Post'
      subject.author = 'cdmwebs'
      subject.body = '# Testing the HTML'
      subject.save
    end

    its(:html) { should == test_html }
  end

  describe "type" do
    context "default" do
      let(:post) { FactoryGirl.build(:post) }
      it "is an article type" do
        post.type.should == "article"
      end
    end
    context "podcast" do
      let(:podcast) { FactoryGirl.build(:post, audio_url: "something.mp3") }
      it "is a naudio type" do
        podcast.type.should == "audio"
      end
    end
  end

  describe "related" do
    let(:post) { FactoryGirl.create(:post, tag_list: "cincinnati, qcmerge, culture") }
    let(:similar_post) { FactoryGirl.create(:post, tag_list: "cincinnati") }
    let!(:similar_post2) { FactoryGirl.create(:post, tag_list: "cincinnati") }
    let!(:similar_post3) { FactoryGirl.create(:post, tag_list: "cincinnati") }

    it "returns limit to x number of similar posts" do
      # this will make you a sad panda:
      # https://github.com/mbleigh/acts-as-taggable-on/issues/139
      post.related.should have(2).items
    end
  end

  describe 'class methods' do
    # TODO: do a bunch of crazy setup and testing

    it 'returns published posts' do
      Post.published.should be_empty
    end

    it 'returns recent posts' do
      Post.recent.should be_empty
    end

    it 'returns tagged posts' do
      Post.tagged('test').should be_empty
    end

    it 'returns matching posts' do
      Post.search('test').should be_empty
    end

    it 'returns posts written by an author' do
      Post.written_by('test').should be_empty
    end
  end
end
