require 'spec_helper'

module BlogApp
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
      let!(:very_similar_post) { FactoryGirl.create(:post, tag_list: "cincinnati, qcmerge, culture") }
      let!(:similar_post) { FactoryGirl.create(:post, tag_list: "cincinnati") }
      let!(:related_post) { FactoryGirl.create(:post, tag_list: "qcmerge") }
      let!(:unrelated_post) { FactoryGirl.create(:post, tag_list: "detroit") }

      it "returns limit to x number of similar posts" do
        # this will make you a sad panda:
        # https://github.com/mbleigh/acts-as-taggable-on/issues/139
        post.related.should have(3).items
      end

      it "exlcudes itself" do
        post.related.should_not include(post)
      end

      it "returns posts in related order" do
        post.related.first.should == very_similar_post
        post.related.second.should == similar_post
        post.related.last.should == related_post
      end
    end

    describe '#generated_description' do
      let(:dirty) { "On the flipside, you don&#39;t need to be one of those des/dev demi-gods to work with developers." }
      let(:clean) { "On the flipside, you don't need to be one of those des/dev demi-gods to work with developers." }

      it 'is empty by default' do
        subject.generated_description.should be_blank
      end

      context 'when set' do
        before { subject.description = dirty }

        it 'decodes any HTML entities present' do
          subject.generated_description.should eq(clean)
        end
      end

      context 'when missing' do
        before { subject.html = "<p>#{dirty}</p>" }

        it 'generates a description from the HTML' do
          subject.generated_description.should eq(clean)
        end

        it 'decodes any HTML entities present' do
          subject.generated_description.should eq(clean)
        end
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
end